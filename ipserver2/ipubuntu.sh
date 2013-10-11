#!/bin/sh


#检查服务的间隔,以秒位单位
minunit=60 
waittime=3600
while :
do
    #文件的更新
  if [ "$waittime" -ge 3600 ];then
	 echo "begin update."
     svn update   
	 waittime=0
	 echo "update end."
  fi
  
  
	#获取hideipserver进程
	stillRunning=$(ps -ef |grep "ipserver" |grep -v "grep")
	#判断hideipserver进程是否存在
	if [ "$stillRunning" ];then
		echo "running now."
		sleep $minunit
		waittime=$[$waittime+$minunit]
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
		
		sleep $minunit
		waittime=$[$waittime+$minunit]
		continue		
	fi
done
		   

