# coding:utf-8
import library.public as pub

class v2_log(pub.public_field,pub.sqlite):
    def cdn_three_fieldvalue(self,s,test_point):
        errdata={}
        data=self.cut_data('v2.log.hunantv.com', 's')
        if len(data)!=0:
            check_data=data[s][0]
            config_data=self.get_config_cdn(test_point)
            for line in config_data:
                if line in check_data:
                    config_data[line]=config_data[line].decode('utf-8')
                    if check_data[line]!=config_data[line]:
                        errdata[line]=check_data[line]
        else:
            errdata['data_number']=0
        return(errdata)
            
class v1_play(): 
    def cdn_player_fieldvalue(self,s,test_point):
        errdata={}
        data=self.cut_data('v2.log.hunantv.com', 's')
        if len(data)!=0:
            check_data=data[s][0]
            config_data=self.get_config_cdn(test_point)
            for line in config_data:
                if line in check_data:
                    config_data[line]=config_data[line].decode('utf-8')
                    if check_data[line]!=config_data[line]:
                        errdata[line]=check_data[line]
        else:
            errdata['data_number']=0
        return(errdata)   