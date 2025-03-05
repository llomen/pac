#coding=utf-8
import re
import json,logging
from urllib.parse import urljoin
import requests
from pprint import pprint

logging.basicConfig(level=logging.INFO,
                    format='%(asctime)s %(filename)s[line:%(lineno)d]%(levelname)s%(message)s')

DEVICES_URL = '/api/v1/devices'
USER_DEVICES_URL = '/api/v1/user/devices'

class AtxiOS(object):
    '''
    封装ATX2接口用于设备远程操作
    '''
    def __init__(self, stf_url, token):
        self.stf_url = stf_url
        self.token = token
        self.session = requests.Session()
        self.headers = dict(Authorization="Bearer {}".format(self.token))
        self.apply_devices = {}

    def _get_response(self, url, method="GET", headers=None, data=None):
        """
        获取API响应结果
        :param url:
        :param method:
        :param headers:
        :param data:
        :return:
        """
        if not headers:
            headers = self.headers

        try:
            response = self.session.request(method, url, headers=headers, data=data, timeout=20)
            info = response.json()
        except Exception as error:
            logging.error('网址：{}请求失败。{}'.format(url, error))
            info = {'success': False, 'description': 'Bad request url: {}'.format(url)}
        return info

    def get_all_iOS_devices(self):
        """
        获取所有iOS设备
        :return:
        """
        url = urljoin(self.stf_url, DEVICES_URL)
        info = self._get_response(url=url)
        pprint(info)
        return info

    def get_iOS_device_by_udid(self, udid):
        """
        获取单个设备信息
        :param udid:str 设备的 udid 字段
        :return:
        """
        left_url = "/".join([USER_DEVICES_URL, udid])
        url = urljoin(self.stf_url, left_url)
        info = self._get_response(url=url)
        pprint(info)
        return info

    def get_wda_url(self,udid):
        '''
        获取iOS设备远程wda链接
        :param udid: 设备udid
        :return: 
        '''
        device_info = self.get_iOS_device_by_udid(udid)
        wda_url = device_info['device']['source']['wdaUrl']
        logging.info('wda_url is %s' %wda_url)
        return wda_url

    def get_url(self,udid):
        device_info = self.get_iOS_device_by_udid(udid)
        url = device_info['device']['source']['url']

        logging.info('url is %s' % url)
        return url


    def using_iOS_device(self, udid):
        """
        占用一台设备
        :param udid: str 设备的 udid 字段
        :return:
        """
        url = urljoin(self.stf_url, USER_DEVICES_URL)
        data = {"udid": udid}
        headers = self.headers
        headers["Content-Type"] = "application/json"
        info = self._get_response(url, "POST", headers, json.dumps(data))
        logging.info(info)

    def install_iOS_app(self,udid,appurl):
        url = self.get_url(udid)

        test= '/app/install'
        all=url+test+'?udid='+udid
        print(all)
        data = {"url": appurl}
        headers = self.headers
        #info = self._get_response(all, "POST", headers, json.dumps(data))
        ret = self.request_api(
            url+test,
            method="POST",
            params={"udid":udid},
            data={
                "url":appurl
            })
        pprint(ret)

    def release_iOS_device(self, udid):
        """
        释放iOS设备
        :param udid:
        :return:
        """

        left_url = "/".join([USER_DEVICES_URL, udid])
        url = urljoin(self.stf_url, left_url)
        info = self._get_response(url, "DELETE")
        logging.info(info)

    def uploadfile(self):
        test = '/uploads'
        url = urljoin(self.stf_url, test)
        file = "/Users/klyg/Downloads/report/iphone_1927/2020-06-18_18-10-47/00008020-001139E82292002E/report.html"
        ret = self.request_api(
            url,
            method="POST",
            data={
                "url": appurl
            })
        pprint(ret)

    def make_url(self,path):
        if re.match(r"^https?://", path):
            return path
        return self.stf_url + path

    def request_api(self,path, method="GET", **kwargs):
        kwargs['headers'] = {"Authorization": "Bearer " + self.token}
        r = requests.request(method, self.make_url(path), **kwargs)
        try:
            r.raise_for_status()
        except requests.HTTPError:
            pprint(r.text)
            raise
        return r.json()



if __name__ == '__main__':

    STF_URL ='http://172.28.124.73:4000'
    Token='cc81adcea60e4872bb904bd840950a97'
    udid='3a48b102de42ae32091c8b0a8150c4c259cf9349'  #iphone7


    atx=AtxiOS(STF_URL,Token)
    atx.using_iOS_device(udid)
    #atx.get_iOS_device_by_udid(udid)

    ret = atx.request_api("/api/v1/user/devices/" + udid)
    source = ret['device']['source']

    pprint("install app")
    provider_url = source['url']
    pprint(provider_url)

    #provider_url = "~/MGTV-iPhone-appstore-3.ipa"
    # ret = atx.request_api(
    #     provider_url + "/app/install",
    #     method="post",
    #     params={"udid": udid},
    #     data={
    #         "url":
    #         "http://172.28.211.134:8080/job/iPhone-AdHoc/1563/artifact/build/adHoc/MGTV-iPhone-appstore.ipa --user Guest:Guest"
    #     })
    pprint(ret)

    #atx.get_all_iOS_devices() #获取所有设备信息

    #device_info=atx.get_iOS_device_by_udid(udid) #获取单个设备信息
    #pprint(device_info)

    #atx.get_wda_url(udid) #获取设备的远程url

    #atx.using_iOS_device(udid) #占用设备

    #atx.release_iOS_device(udid) #释放设备




