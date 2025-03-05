import function.config as conf
import function.public as pub

class search_1(object):
    def diff_search1(self,uuid,input1, has,page,h,suggest,suggestidx):
        sqlite=pub.sqlite()
        data=sqlite.cut_data('log.so.hunantv.com')
        Public1 = pub.Public_old()
        data1, errdata1 = Public1.diff_pub(data['search'][0], uuid)
        if 'guid' in errdata1:
            errdata1.pop('guid')
        if 'bid' in errdata1:
            errdata1.pop('bid')
        data,errdata2= self.search1(data1, input1, has,page,h,suggest,suggestidx)
        errdata = dict(errdata1.items() + errdata2.items())
        return(data,errdata)
    def search1(self, data,input1,has,page,h,suggest,suggestidx):
        errdata = {}
        if 'act' in data:
            if data['act'] != 'search':
                errdata['act'] = data['act']
            data.pop('act')
        else:
            errdata['act'] = 'no_field'   
              
        if 'input' in data:
            if data['input'] !=input1:
                errdata['input'] = data['input']
            data.pop('input')
        else:
            errdata['input'] = 'no_field'    
             
        if 'has' in data:
            if data['has'] != has:
                errdata['has'] = data['has']
            data.pop('has')
        else:
            errdata['has'] = 'no_field'       
            
        if 'suggest' in data:
            if data['suggest'] != suggest:
                errdata['suggest'] = data['suggest']
            data.pop('suggest')
        else:
            errdata['suggest'] = 'no_field'      
            
        if 'suggestidx' in data:
            if data['suggestidx'] != suggestidx:
                errdata['suggestidx'] = data['suggestidx']
            data.pop('suggestidx')
        else:
            errdata['suggestidx'] = 'no_field'    
            
        if 'page' in data:
            if data['page'] != page:
                errdata['page'] = data['page']
            data.pop('page')
        else:
            errdata['page'] = 'no_field'  
            
        if 'h' in data:
            if data['h'] != h:
                errdata['h'] = data['h']
            data.pop('h')
        else:
            errdata['h'] = 'no_field'  
            
        if 'query' in data:
            if data['query'] == None:
                errdata['query'] = data['query']
            data.pop('query')
        else:
            errdata['query'] = 'no_field'    
        if '_client' in data:
            if data['_client'] != 'mobile':
                errdata['_client'] = data['_client']
            data.pop('_client')
        else:
            errdata['_client'] = 'no_field'  
            
        return(data, errdata) 
    def diff_view(self,uuid, lastquery, query,page,collcnt,shortcnt,cids,vids):
        sqlite=pub.sqlite()
        da=sqlite.cut_data('log.so.hunantv.com')
        Public1 = pub.Public_old()
        data1, errdata1 = Public1.diff_pub(da['view'][0], uuid)
        if 'guid' in errdata1:
            errdata1.pop('guid')
        if 'bid' in errdata1:
            errdata1.pop('bid')
        data,errdata2 =self.view(data1, lastquery, query,page,collcnt,shortcnt,cids,vids)
        errdata = dict(errdata1.items() + errdata2.items())
        return(data,errdata)
    def view(self, data,lastquery,query,page,collcnt,shortcnt,cids,vids):
        errdata = {}
        if 'act' in data:
            if data['act'] != 'view':
                errdata['act'] = data['act']
            data.pop('act')
        else:
            errdata['act'] = 'no_field'   
              
        if 'lastquery' in data:
            if data['lastquery'] !=lastquery:
                errdata['lastquery'] = data['lastquery']
            data.pop('lastquery')
        else:
            errdata['lastquery'] = 'no_field'    
             
        if 'query' in data:
            if data['query'] != query:
                errdata['query'] = data['query']
            data.pop('query')
        else:
            errdata['query'] = 'no_field'       
            
        if 'collcnt' in data:
            if data['collcnt'] != collcnt:
                errdata['collcnt'] = data['collcnt']
            data.pop('collcnt')
        else:
            errdata['collcnt'] = 'no_field'      
            
        if 'shortcnt' in data:
            if data['shortcnt'] != shortcnt:
                errdata['shortcnt'] = data['shortcnt']
            data.pop('shortcnt')
        else:
            errdata['shortcnt'] = 'no_field'    
            
        if 'page' in data:
            if data['page'] != page:
                errdata['page'] = data['page']
            data.pop('page')
        else:
            errdata['page'] = 'no_field'  
            
        if 'cids' in data:
            if data['cids']!=cids:
                errdata['cids']=data['cids']
            data.pop('cids')
        else:
            errdata['cids'] = 'no_field'  
            
        if 'vids' in data:
            if data['vids']!=vids:
                errdata['vids']=data['vids']
            data.pop('vids')
        else:
            errdata['vids'] = 'no_field'  
            
        if '_client' in data:
            if data['_client'] != 'mobile':
                errdata['_client'] = data['_client']
            data.pop('_client')
        else:
            errdata['_client'] = 'no_field'  
            
        return(data, errdata)
    def diff_click(self,uuid,query, tp,is_star):
        sqlite=pub.sqlite()
        da=sqlite.cut_data('log.so.hunantv.com')
        Public1 = pub.Public_old()
        data1, errdata1 = Public1.diff_pub(da['click'][0], uuid)
        if 'guid' in errdata1:
            errdata1.pop('guid')
        if 'bid' in errdata1:
            errdata1.pop('bid')
        data,errdata2 =self.click(data1, query, tp,is_star)
        errdata = dict(errdata1.items() + errdata2.items())
        return(data,errdata)
    def click(self,data,query,tp,is_star):
        errdata = {}
        if 'act' in data:
            if data['act'] != 'click':
                errdata['act'] = data['act']
            data.pop('act')
        else:
            errdata['act'] = 'no_field'   
        if 'query' in data:
            if data['query'] != query:
                errdata['query'] = data['query']
            data.pop('query')
        else:
            errdata['query'] = 'no_field'
        if 'is_star' in data:
            if data['is_star'] != is_star:
                errdata['is_star'] = data['is_star']
            data.pop('is_star')
        else:
            errdata['is_star'] = 'no_field'  
        if 'tp' in data:
            if data['tp'] != tp:
                errdata['tp'] = data['tp']
            data.pop('tp')
        else:
            errdata['tp'] = 'no_field'   
        if 'id' in data:
            if data['id'] ==None :
                errdata['id'] = data['id']
            data.pop('id')
        else:
            errdata['id'] = 'no_field'   
        if 'idx' in data:
            if data['idx'] ==None :
                errdata['idx'] = data['idx']
            data.pop('idx')
        else:
            errdata['idx'] = 'no_field'   
        if '_client' in data:
            if data['_client'] != 'mobile':
                errdata['_client'] = data['_client']
            data.pop('_client')
        else:
            errdata['_client'] = 'no_field'  
        return(data, errdata) 
    
    def diff_cids(self,aa,cid):
        cid=cid.split('%2C')
        errdata=[]
        for i in range(0,len(cid)):
            if cid[i] not in aa:
                errdata.append(cid[i])
        return(errdata)
                      
    
