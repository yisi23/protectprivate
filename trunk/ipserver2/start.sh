#!/bin/sh

echo "Startup Begin"
#cd ${PWD}
cd ~/ipserver2

chmod a+x ipubuntu.sh

screen -d -m -S hideip2 ./ipubuntu.sh

# screen -d -m -S hideip2 ./hideipserver

