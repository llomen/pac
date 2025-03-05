# coding:utf-8
import library.public as pub

class pay(pub.sqlite):
    def diff_pay(self,act_value,test_point,data_table,public_point):
        errdata={}
        data=self.cut_data('audit.aaa.mgtv.com', 'act')
        if len(data)!=0:
            check_data=data[act_value][0]
            config_data=self.get_config_data(test_point, data_table, public_point, 'config_public')
            for line in config_data:
                if line in check_data:
                    if config_data[line]==None:
                        if check_data[line]!='':
                            errdata[line]=check_data[line]
                    else:
                        if check_data[line]!=config_data[line]:
                            errdata[line]=check_data[line]
            err_data=self.pay(errdata)
        else:
            err_data['data_number']=0
        return(err_data)
    def pay(self,aa):
        if "gps" in aa:
            aa.pop("gps")

        if "time" in aa:
            if aa["time"] != None:
                aa.pop("time")

        return(aa)