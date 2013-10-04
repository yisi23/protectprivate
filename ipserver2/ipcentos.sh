#!/bin/sh

TIME=$(date +%Y-%m-%d%n%H:%M:%S)
ServerLogPath="./Server-log"
StartLogPath="./Start-log"

case "$1" in
####################################
  start)
        #判断AutoStartServer文件是否存在
        if [ -f ./AutoStartServer ];then
           #服务器事件日志文件夹的创建
           if [ ! -d "$ServerLogPath" ];then
              mkdir $ServerLogPath
           fi
           #启动事件日志文件夹的创建
           if [ ! -d "$StartLogPath" ];then
              mkdir $StartLogPath
           fi

           #判断是否有可执行权限
           if [ ! -x ./AutoStartServer ];then
              chmod +x AutoStartServer
           fi
           echo "Fast Hide IP Server Start..."       
           nohup ./AutoStartServer &>./Start-log/$TIME&
           echo "Server has been started!"                                 
        else
          echo "Can not find file [AutoStartServer]!"
          #提示是否下载AutoStartServer文件
          echo -n "Do you want to download this file?(yes(y)|no(n)): "
               read need
               case $need in
                    yes|y) 
                    wget http://fasthideip.com/server/AutoStartServer
                    echo "Please try again!"
                    ;;
                    no|n)
                    ;;
                    *)
                    ;;
               esac
        fi
        ;;
####################################
  stop)
        stillRunning=$(ps -ef |grep "AutoStartServer" |grep -v "grep")
        if [ "$stillRunning" ] ; then
           echo "Stop the server..."
           killall -9 AutoStartServer
           killall -9 FHIPserver
           echo "Server has been stopped!"
        else
           echo "Server does not start!"
        fi
        ;;
####################################
  restart)
        stillRunning=$(ps -ef |grep "AutoStartServer" |grep -v "grep")
        if [ "$stillRunning" ] ; then
           echo "Restart the server..."
           echo "Stop the server..."
           killall -9 AutoStartServer
           killall -9 FHIPserver
           echo "Server has been stopped!"
           echo "Fast Hide IP Server Start..."  
           nohup ./AutoStartServer &>./Start-log/$TIME&
           echo "Server has been started!" 
        else
           echo "Server does not start!"
        fi
        ;;
     *)
        echo "./FIPServer {start|restart|stop}"
        ;;
esac

exit 0
