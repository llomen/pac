#!/usr/bin/env python
# encoding: utf-8
"""
@author: wuhong@mgtv.com
@file: stf_aphone.py
@time: 2018/12/12 11:09 AM
@desc:
"""
import json,logging
from urllib.parse import urljoin
import requests

logging.basicConfig(level=logging.INFO,
                    format='%(asctime)s %(filename)s[line:%(lineno)d]%(levelname)s%(message)s')

DEVICES_URL = '/api/v1/devices'
USER_DEVICES_URL = '/api/v1/user/devices'


class StfaPhone(object):
    """
    aPhone STF工具类主要用简化STF操作 STF提供了OPEN API DOC 见WIKI:
    主要封装方法 获取可用设备、使用设备、获取单个设备详细信息、归还设备
    """

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

    def devices(self):
        """
        获取所有设备
        :return:
        """
        url = urljoin(self.stf_url, DEVICES_URL)
        info = self._get_response(url=url)
        return info

    def device_by_serial(self, serial):
        """
        获取单个设备
        :param serial:str 设备的 serial 字段
        :return:
        """
        left_url = "/".join([USER_DEVICES_URL, serial])
        url = urljoin(self.stf_url, left_url)
        info = self._get_response(url=url)
        return info

    def users_devices(self):
        """
        获取哪些人在使用哪些设备
        :return:
        """
        url = urljoin(self.stf_url, USER_DEVICES_URL)
        info = self._get_response(url=url)
        return info

    def using_device(self, serial):
        """
        申请一台设备
        :param serial: str 设备的 serial 字段
        :return:
        """
        url = urljoin(self.stf_url, USER_DEVICES_URL)
        data = {"serial": serial}
        headers = self.headers
        headers["Content-Type"] = "application/json"
        info = self._get_response(url, "POST", headers, json.dumps(data))
        if info["success"]:
            remote_info = self.device_remote_connect(serial)
            remote_url = remote_info.get('remoteConnectUrl')
            self.apply_devices[serial] = remote_url

        return info

    def return_device(self, serial):
        """
        归还一台设备
        :param serial:
        :return:
        """
        if serial in self.apply_devices:
            left_url = "/".join([USER_DEVICES_URL, serial])
            url = urljoin(self.stf_url, left_url)
            info = self._get_response(url, "DELETE")
        else:
            info = {'success': False, 'description': '非本次申请设备'}
        return info

    def device_remote_connect(self, serial):
        """
        获取远程测试地址
        :param serial:
        :return:
        """
        left_url = "/".join([USER_DEVICES_URL, serial, "remoteConnect"])
        url = urljoin(self.stf_url, left_url)
        info = self._get_response(url, "POST")
        return info

    def remove_remote_connect(self, serial):
        """
        移除远程测试地址
        :param serial:
        :return:
        """
        if serial in self.apply_devices:
            left_url = "/".join([USER_DEVICES_URL, serial, "remoteConnect"])
            url = urljoin(self.stf_url, left_url)
            info = self._get_response(url, "DELETE")
        else:
            info = {'success': False, 'description': '非本次申请设备'}
        return info


if __name__ == '__main__':
    TOKEN = '365cd9634d7640719657cd307fcbbdb98f8677837b1243028cca014aff1986ad'  # jenkins token
    DEVICES_URL = '/api/v1/devices'  # 设备访问接口
    STF_URL='http://172.31.36.77:7100/'
    stf=StfaPhone(STF_URL,TOKEN)
    devices=stf.devices()
    # devices=stf.device_by_serial('7643c658')
    print(devices)