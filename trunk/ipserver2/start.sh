#!/bin/bash

echo "Startup Begin"
#cd ${PWD}
cd ~/ipserver2

svn update

chmod a+x ipubuntu.sh
chmod a+x ipremote

screen -d -m -S ipcheck ./ipubuntu.sh

# screen -d -m -S hideip2 ./hideipserver

# svn checkout https://protectprivate.googlecode.com/svn/trunk/ipserver2
