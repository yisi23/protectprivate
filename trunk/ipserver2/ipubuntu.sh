#!/bin/bash


#检查服务的间隔,以秒位单位
minunit=60 
waittime=0
runningmd="1"
while :
do
    #文件的更新
  if [ "$waittime" -ge 1800 ];then
	 echo "begin update."
     svn update   
	 waittime=0
	 echo "update end."
	 
	 newmd=$(md5sum ./ipremote |cut -d ' ' -f1)
	# echo $newmd
	# echo $runningmd
	 if [ "$newmd" != "$runningmd" ];then
         #停止服务
		 echo "found new version, kill current one."
         killall -9 ipremote
		 sleep 1
	fi
	 
  fi
  
	#获取hideipremote进程
	stillRunning=$(ps -ef |grep "ipremote" |grep -v "grep")
	#判断hideipremote进程是否存在
	if [ "$stillRunning" ];then
		echo "found it is still running."
		sleep $minunit
		waittime=$[$waittime+$minunit]
		continue
	else
		echo "server not run. try to start it"
		
		svn update
		if [ ! -f ./ipremote ];then
			wget http://protectprivate.googlecode.com/svn/trunk/ipremote2/ipremote
		fi

		#判断是否有可执行权限
		if [ ! -x ./ipremote ];then
		  chmod +x ipremote
		fi
		
		   #本地文件MD5值的获取 
		runningmd=$(md5sum ./ipremote |cut -d ' ' -f1)
		echo "Starting IP Hider Pro Server..."       
		screen -d -m -S ipremote ./ipremote
		echo "Server started!" 
		
		sleep $minunit
		waittime=$[$waittime+$minunit]
		continue		
	fi
done
		   

