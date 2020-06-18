#!/bin/bash
today=`date '+%d-%b-%Y-%T'`;
filename="$PWD/results-$today.txt"
echo $filename;

#geekbench install and run

touch $filename
sudo dpkg --add-architecture i386 
sudo apt-get update -y
sudo apt-get install libc6:i386 libstdc++6:i386 -y
wget http://cdn.geekbench.com/Geekbench-5.1.0-Linux.tar.gz $PWD
tar -zxvf $PWD/Geekbench-5.1.0-Linux.tar.gz
echo "Running geekbench" >> $filename
echo "Running geekbench5.. This will take a moment"
$PWD/Geekbench-5.1.0-Linux/geekbench5 >> $filename

#end geekbench
echo "----------------------------------------------" >> $filename


echo "Running fio" >> $filename
echo "" >> $filename
#fio
echo "Installing fio"
sudo apt-get install fio -y

echo "Running fio"

echo "Running Random Read Write"
fio --name=randomrw --ioengine=libaio --direct=1 --bs=4k --iodepth=64 --size=40G --rw=randrw --rwmixread=75 --gtod_reduce=1 >> $filename
echo "" >> $filename

echo "Running Random Read"
fio --name=randomread --ioengine=libaio --direct=1 --bs=4k --iodepth=64 --size=40G --rw=randread --gtod_reduce=1 >> $filename
echo "" >> $filename

echo "Running Random Write"
fio --name=randomwrite --ioengine=libaio --direct=1 --bs=4k --iodepth=64 --size=40G --rw=randwrite --gtod_reduce=1 >> $filename
echo "" >> $filename

echo "cleaning up fio files"
rm randomrw* randomread* randomwrite*


#end fio

echo "---------------------------------------------" >> $filename
echo ""
echo ioping >> $filename
wget https://launchpad.net/ubuntu/+archive/primary/+files/ioping_0.9-2_amd64.deb $PWD
sudo dpkg -i $PWD/ioping_0.9-2_amd64.deb
echo "running ioping"
ioping -c 10 . >> $filename
echo "cleaning up"
rm ioping_0.9-2_amd64.deb*

echo ""
echo ""
echo "Benchmark results can be found in $filename"
echo ""
echo "use command cat $filename to view results"
