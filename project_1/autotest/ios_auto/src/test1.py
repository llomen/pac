# -*- coding: utf-8 -*-
import web

urls=(#aplay、心跳、播放小事件上报
      '/dispatcher.do','log_v2', 
      # cdn三层上报
      '/info.php?','log_v2',
      )
app = web.application(urls, globals())

class log_v2(object):
    """ aplay、心跳、播放小事件上报获取函数"""
    def GET(self):
        #web.header('Content-Type', value, unique)
        #host=web.ctx.host
        agent=web.ctx.get(key, default)
        return agent
    def POST(self):
        #web.header('Content-Type', value, unique)
        host=web.ctx.host
        return host


if __name__ == "__main__":
    app.run()