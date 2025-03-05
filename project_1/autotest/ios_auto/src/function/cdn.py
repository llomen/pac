# coding:utf-8
import function.public as pub
import function.config as conf

class v2_log(object):
    def return_count(self,path):
        count={}
        pu=pub.data()
        data=pu.get_data(path)
        if len(data)!=0:
            for i in range(0,len(data)):
                da=data[i]
                aa=str(da['t'])+str(da['s'])
                if aa in count:
                    count[aa]+=1
                else:
                    count[aa]=1
        return(count)
      
    def return_data(self,path):
        pu=pub.data()
        data=pu.get_data(path)
        da={}
        if len(data)!=0:
            for i in range(len(data)):
                data1=data[i]
                if 't' in data1 and 's' in data1:
                    da[str(data1['t'])+str(data1['s'])]=data1
        return(da)
 
    def diff_v2_log(self,path,s,f,t,h,e,hi,hf,ex):
        da=self.return_data(path)
        data,errdata =self.v2_log(da[str(t)+str(s)],s,f,t,h,e,hi,hf,ex)
        return(data,errdata)
    def v2_log(self,data,s,f,t,h,e,hi,hf,ex):
        errdata = {}
        Publi=pub.Public()
        """
        if 'a' in data:
            if data['a'] != a:
                errdata['a'] = data['a']
            data.pop('a')
        else:
            errdata['a'] = 'no_field'   
            
        if 'b' in data:
            if data['b'] != b:
                errdata['b'] = data['b']
            data.pop('b')
        else:
            errdata['b'] = 'no_field'   

        if 'c' in data:
            if data['c'] != c:
                errdata['c'] = data['c']
            data.pop('c')
        else:
            errdata['c'] = 'no_field'   
        """
            
        if 's' in data:
            if data['s'] != s:
                errdata['s'] = data['s']
            data.pop('s')
        else:
            errdata['s'] = 'no_field'  
        """
        if 'si' in data:
            if data['si'] != si:
                errdata['si'] = data['si']
            data.pop('si')
        else:
            errdata['si'] = 'no_field'  
        """
            
        if 'p' in data:
            if data['p'] != conf.p:
                errdata['p'] = data['p']
            data.pop('p')
        else:
            errdata['p'] = 'no_field'   
              
        if 'v' in data:
            if Publi.aver(data['v'])=='fail':
                errdata['v']=data['v']
            data.pop('v')
        else:
            errdata['v'] = 'no_field' 
            
        if 'u' in data:
            if Publi.guid(data['u'])=='fail':
                errdata['u']=data['u']
            data.pop('u')
        else:
            errdata['u'] = 'no_field' 
             
        if 'f' in data:
            if data['f'] != f:
                errdata['f'] = data['f']
            data.pop('f')
        else:
            errdata['f'] = 'no_field'       
        """
        if 'z' in data:
            if data['z'] != z:
                errdata['z'] = data['z']
            data.pop('z')
        else:
            errdata['r'] = 'no_field'     
        """
        if 't' in data:
            if data['t'] != t:
                errdata['t'] = data['t']
            data.pop('t')
        else:
            errdata['r'] = 'no_field'      
        """
        if 'l' in data:
            if data['l'] == None:
                errdata['l'] = data['l']
            data.pop('l')
        else:
            errdata['l'] = 'no_field'    
        """ 
        if 'h' in data:
            if data['h'] != h:
                errdata['h'] = data['h']
            data.pop('h')
        else:
            errdata['h'] = 'no_field'  
            
        if 'e' in data:
            if data['e'] != e:
                errdata['e'] = data['e']
            data.pop('e')
        else:
            errdata['e'] = 'no_field'  

        if 'ex' in data:
            if data['ex'] != ex:
                errdata['ex'] = data['ex']
            data.pop('ex')
        else:
            errdata['ex'] = 'no_field'  
        if 'cv' in data:
            if data['cv'] != conf.play_cv:
                errdata['cv'] = data['cv']
            data.pop('cv')
        else:
            errdata['cv'] = 'no_field'  
            
        if 'hi' in data:
            if data['hi'] != hi:
                errdata['hi'] = data['hi']
            data.pop('hi')
        else:
            errdata['hi'] = 'no_field'  
        if 'hf' in data:
            if data['hf'] != hf:
                errdata['hf'] = data['hf']
            data.pop('hf')
        else:
            errdata['hf'] = 'no_field'  
            
        return(data, errdata) 

    def diff_download_v2_log(self,path,s,f,t,h,e,hi,hf,a,c,si,z):
        da=self.return_data(path)
        data,errdata =self.download_v2_log(da[str(t)+str(s)],s,f,t,h,e,hi,hf,a,c,si,z)
        return(data,errdata) 
    def download_v2_log(self,data,s,f,t,h,e,hi,hf,a,c,si,z):
        errdata = {}
        Publi=pub.Public()
        if 'a' in data:
            if data['a'] != a:
                errdata['a'] = data['a']
            data.pop('a')
        else:
            errdata['a'] = 'no_field'   

        if 'c' in data:
            if data['c'] != c:
                errdata['c'] = data['c']
            data.pop('c')
        else:
            errdata['c'] = 'no_field'   
            
        if 's' in data:
            if data['s'] != s:
                errdata['s'] = data['s']
            data.pop('s')
        else:
            errdata['s'] = 'no_field'  
        if 'si' in data:
            if data['si'] != si:
                errdata['si'] = data['si']
            data.pop('si')
        else:
            errdata['si'] = 'no_field'  
            
        if 'p' in data:
            if data['p'] != conf.p:
                errdata['p'] = data['p']
            data.pop('p')
        else:
            errdata['p'] = 'no_field'   
              
        if 'v' in data:
            if Publi.aver(data['v'])=='fail':
                errdata['v']=data['v']
            data.pop('v')
        else:
            errdata['v'] = 'no_field' 
            
        if 'u' in data:
            if Publi.guid(data['u'])=='fail':
                errdata['u']=data['u']
            data.pop('u')
        else:
            errdata['u'] = 'no_field' 
             
        if 'f' in data:
            if data['f'] != f:
                errdata['f'] = data['f']
            data.pop('f')
        else:
            errdata['f'] = 'no_field'       
        if 'z' in data:
            if data['z'] != z:
                errdata['z'] = data['z']
            data.pop('z')
        else:
            errdata['r'] = 'no_field'     
        if 't' in data:
            if data['t'] != t:
                errdata['t'] = data['t']
            data.pop('t')
        else:
            errdata['r'] = 'no_field'      

        if 'l' in data:
            if data['l'] == None:
                errdata['l'] = data['l']
            data.pop('l')
        else:
            errdata['l'] = 'no_field'    

        if 'h' in data:
            if data['h'] != h:
                errdata['h'] = data['h']
            data.pop('h')
        else:
            errdata['h'] = 'no_field'  
            
        if 'e' in data:
            if data['e'] != e:
                errdata['e'] = data['e']
            data.pop('e')
        else:
            errdata['e'] = 'no_field'  

        if 'ex' in data:
            if data['ex'] == None:
                errdata['ex'] = data['ex']
            data.pop('ex')
        else:
            errdata['e'] = 'no_field'  

        if 'cv' in data:
            if data['cv'] != conf.down_cv:
                errdata['cv'] = data['cv']
            data.pop('cv')
        else:
            errdata['cv'] = 'no_field'  
            
        return(data, errdata) 
