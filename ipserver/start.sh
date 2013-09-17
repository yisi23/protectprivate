#!/bin/sh

echo "Startup Begin"
#cd ${PWD}
cd ~/ipserver

chmod a+x ipubuntu.sh

screen -d -m -S hideip ./ipubuntu.sh

