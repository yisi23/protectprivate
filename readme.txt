

http://protectprivate.googlecode.com/svn/trunk/cloudconfig/proxys.xml

http://protectprivate.googlecode.com/svn/trunk/ipserver/ipubuntu.sh

http://protectprivate.googlecode.com/svn/trunk/ipserver/hideipserver

 

svn checkout https://protectprivate.googlecode.com/svn/trunk/ipserver2



  
2. �����64λϵͳ������Ҫ��װ32λ֧�ֿ�:
64λubuntu�������32λ����
����취�ܼ򵥣�ֻ��Ҫ��װ32λ�����֧�ֿ�Ϳ����ˡ�
sudo apt-get install ia32-libs

centos��  32λ��Ҫ������64λϵͳ�ϣ�
yum install glibc.i686
yum whatprovides libstdc++.so.6
yum install libstdc++-4.4.7-3.el6.i686



4. ��ӵ���������

����ļ��мӣ�һ��Ҫָ���ĸ��û����У�
sudo vi /etc/rc.local


su root -c '/root/ipserver2/start.sh'

centos:
vi  /etc/rc.d/rc.local
/root/ipserver2/start.sh
