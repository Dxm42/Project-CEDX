#!/bin/bash
if [ "$1" == "" ]
then
echo "How to use: $0  example.com";
else
	cat art
	wget -q  $1;
	grep href index.html | cut -d "/" -f 3 | grep "\." | cut -d '"' -f 1 | grep -v "<l" > list.txt;
	echo "#######################################################################################";
	echo "#                                [+] Resolving Hosts                                  #";
	echo "#######################################################################################";
	for url in $(cat list.txt):
	do
	host $url | grep "has address";
	done
	for ips in $(cat list.txt):
	do
	host  $ips | cut -d " " -f 4 | grep -v "handled" >> ips.txt;
	done

	cat ips.txt | grep -v "found:" >> hosts.txt
	rm index.html;
	rm ips.txt;
fi
