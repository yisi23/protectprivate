

http://protectprivate.googlecode.com/svn/trunk/cloudconfig/proxys.xml

http://protectprivate.googlecode.com/svn/trunk/ipserver/ipubuntu.sh

http://protectprivate.googlecode.com/svn/trunk/ipserver/hideipserver

 

svn checkout https://protectprivate.googlecode.com/svn/trunk/ipserver2



  
2. 如果是64位系统，还需要安装32位支持库:
64位ubuntu如何运行32位程序：
解决办法很简单，只需要安装32位程序的支持库就可以了。
sudo apt-get install ia32-libs

centos上  32位需要运行在64位系统上：
yum install glibc.i686
yum whatprovides libstdc++.so.6
yum install libstdc++-4.4.7-3.el6.i686



4. 添加到开机启动

向此文件中加，一定要指明哪个用户运行：
sudo vi /etc/rc.local


su root -c '/root/ipserver2/start.sh'

centos:
vi  /etc/rc.d/rc.local
/root/ipserver2/start.sh
