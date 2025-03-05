# /usr/bin python
# coding:utf-8
import web
import json
import MySQLdb

urls=('/dispatcher.do?','pv',    #get 域名pcweb.v1.mgtv.com
      '/pv.php','pvsource',    # mpp
      '/phb.php','hp',         #ott
      '/buffer.php','buff',   #ott
      '/play.php','play',  #ott
      '/test','test',
      '/delete','delete',
      '/info.php','cdn',   #
      '/rpt?','rpt',
      '/report','search',
        )

app = web.application(urls, globals())

class pvsource(object):
    def GET(self):
        ge=public()
        ge.get()
        
class pv(object):
    def GET(self):
        ge=public()
        ge.get()
    def POST(self):
        po=public()
        po.post()

class hp(object):
    def GET(self):
        ge=public()
        ge.get()

class play(object):
    def GET(self):
        ge=public()
        ge.get()
        
class buff(object):
    def GET(self):
        ge=public()
        ge.get()
    
class cdn(object):
    def GET(self):
        ge=public()
        ge.get()
class rpt(object):
    def GET(self):
        ge=public()
        ge.get()
    def POST(self):
        po=public()
        po.post()
class search(object):
    def GET(self):
        ge=public()
        ge.get()
class pay(object):
    def GET(self):
        ge=public()
        ge.get()
class ad(object):
    def GET(self):
        ge=public()
        ge.get()
        
class public():
    def insert_data(self,host,data,platform): 
        conn=MySQLdb.connect(
            host='192.168.8.239',
            user='auto_test',
            passwd='123',
            port=3306,
            unix_socket='/opt/lampp/var/mysql/mysql.sock',
            db ='auto_test',
            use_unicode=True,
            charset="utf8"
            )
        conn = self.get_conn()
        cur = conn.cursor()
        cur.execute("insert into mpp_realtime_data values(%s,%s,%s)",(host,data,platform))
        conn.commit()
        conn.close()

    def get(self,platform):
        data=web.input()
        data=json.dumps(data,indent=4, ensure_ascii=False)
        host=web.ctx.host
        self.insert_data(host, data,'Android')
        return 'OK'
    def post(self,platform):
        data=web.data()
        host=web.ctx.host
        self.insert_data(host, data,'Android')
        return 'OK'


if __name__ == "__main__":
    app.run()

