# -*- coding: utf-8 -*-
import web
import json
import sqlite3

urls=(#aplay、心跳、播放小事件上报
      '/dispatcher.do','log_v2', 
      # cdn三层上报
      '/info.php?','v2_log',
      #搜索上报
      '/a.gif?','log_so',
      #广告上报
      '/v1/t','log_da',
      #pvsource上报
      '/pv.php','pysource',
      #推送上报
      #'/mpns/*','log_npms',
      #推荐上报
      '/rpt','log_rc',
      #支付上报
      '/audit_mpp.html?','pay',
      #adplay上报
      '/ad.gif','ad'
      )
app = web.application(urls, globals())

path='/Users/klyg/Desktop/iphone_auto/sqlite/iphone1.sqlite'     #sqlite数据库文件地址

class ad(object):
    """ 广告adplay数据上报获取函数"""
    def GET(self):
        data=web.input()
        data=json.dumps(data,indent=4, ensure_ascii=False)
        host=web.ctx.host
        conn=sqlite3.connect(path)
        c=conn.cursor()
        c.execute("insert into get_data values(?,?)",(host,data))
        conn.commit()
        conn.close()  
         
class pay(object):
    """ 支付数据上报获取函数"""
    def GET(self):
        data=web.input()
        data=json.dumps(data,indent=4, ensure_ascii=False)
        host=web.ctx.host
        conn=sqlite3.connect(path)
        c=conn.cursor()
        c.execute("insert into get_data values(?,?)",(host,data))
        conn.commit()
        conn.close()
        
class pysource(object):
    """ pysource数据上报获取函数"""
    def GET(self):
        data=web.input()
        data=json.dumps(data,indent=4, ensure_ascii=False)
        host=web.ctx.host
        conn=sqlite3.connect(path)
        c=conn.cursor()
        c.execute("insert into get_data values(?,?)",(host,data))
        conn.commit()
        conn.close()      
          
class log_v2(object):
    """ aplay、心跳、播放小事件上报获取函数"""
    def POST(self):
        #web.header('Content-Type', value, unique)
        data=web.data()
        host=web.ctx.host
        conn=sqlite3.connect(path)
        c=conn.cursor()
        c.execute("insert into get_data values(?,?)",(host,data))
        conn.commit()
        conn.close()
        
class v2_log(object):
    """ cdn上报获取函数"""
    def GET(self):
        data=web.input()
        data=json.dumps(data,indent=4, ensure_ascii=False)
        host=web.ctx.host
        conn=sqlite3.connect(path)
        c=conn.cursor()
        c.execute("insert into get_data values(?,?)",(host,data))
        conn.commit()
        conn.close()
        
class log_so(object):
    """ 搜索上报获取函数"""
    def GET(self):
        data=web.input()
        data=json.dumps(data,indent=4, ensure_ascii=False)
        host=web.ctx.host
        conn=sqlite3.connect(path)
        c=conn.cursor()
        c.execute("insert into get_data values(?,?)",(host,data))
        conn.commit()
        conn.close()

class log_da(object):
    """ 广告上报获取函数"""
    def POST(self):
        #web.header('Content-Type', value, unique)
        data={}
        data1=web.data()
        b=data1.split('&')
        for line in b:
            c=line.split('=')
            data[c[0]]=c[1]
        #data=json.dumps(data,indent=4, ensure_ascii=False)
        host=web.ctx.host
        conn=sqlite3.connect(path)
        c=conn.cursor()
        c.execute("insert into get_data values(?,?)",(host,str(data)))
        conn.commit()
        conn.close()

class log_rc(object):
    """ 推荐上报获取函数"""
    def POST(self):
        data=web.data()
        #data=json.dumps(data,indent=4, ensure_ascii=False)
        host=web.ctx.host
        conn=sqlite3.connect(path)
        c=conn.cursor()
        c.execute("insert into get_data values(?,?)",(host,data))
        conn.commit()
        conn.close()
        
"""
class log_npms(object):
    def POST(self):  
        #web.header('Content-Type', value, unique)
        data=web.data()
        data=json.dumps(data,indent=4, ensure_ascii=False)
        host=web.ctx.host
        conn=sqlite3.connect(path)
        c=conn.cursor()
        c.execute("insert into get_data values(?,?)",(host,data))
        conn.commit()
        conn.close()
"""




if __name__ == "__main__":
    app.run()
