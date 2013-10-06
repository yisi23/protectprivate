#!/bin/sh


#检查服务的间隔,以秒位单位
minunit=600 

while :
do
  
	#获取hideipserver进程
	stillRunning=$(ps -ef |grep "ipserver" |grep -v "grep")
	#判断hideipserver进程是否存在
	if [ "$stillRunning" ];then
		sleep $minunit
		continue
	else
		echo "server not run. try to start it"
		
		svn update
		if [ ! -f ./ipserver ];then
			wget http://protectprivate.googlecode.com/svn/trunk/ipserver2/ipserver
		fi

		#判断是否有可执行权限
		if [ ! -x ./ipserver ];then
		  chmod +x ipserver
		fi

		echo "Starting IP Hider Pro Server..."       
		./ipserver
		echo "Server End!" 
		
		sleep 10
		continue		
	fi
done
		   

