# coding:utf-8
import library.public as pub

class recommend(pub.sqlite):
    def diff_recommend(self,act_value,test_point,data_table,public_point):
        errdata={}
        data=self.cut_data('log.rc.hunantv.com', 'act')
        if len(data)!=0:
            check_data=data[act_value][0]
            config_data=self.get_config_data(test_point,data_table,public_point, 'config_pvsource_public')
            for line in config_data:
                if line in check_data:
                    if config_data[line]==None:
                        if check_data[line]!='':
                            errdata[line]=check_data[line]
                    else:
                        if check_data[line]!=config_data[line]:
                            errdata[line]=check_data[line]
            err_data=self.recommend(errdata)
        else:
            err_data['data_number']=0
        return(err_data)
    def recommend(self,aa):
        """ adplay公共字段校验函数
                    传入参数：
                    aa:本次操作上报字段字典
                    uuid:用户uuid
                    adtype:广告类型 0-前贴，1-中插
                    返回值：
                    aa:剩余未校验字段和多余字段字典
                    errdata:异常值字段和缺失字段字典
        """
        if "gps" in aa:
            aa.pop("gps")

        if "time" in aa:
            if aa["time"] != None:
                aa.pop("time")

        if "sid" in aa:
            if len(aa['sid']) ==36:
                aa.pop("sid")
        return(aa)
    
    

