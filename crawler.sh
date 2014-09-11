#########################################################################
# File Name: crawler.sh
# Author: zp
# mail: sczhaopeng@gmail.com
# Created Time: Tue 09 Sep 2014 09:05:05 PM CST
#########################################################################
#!/bin/bash

#url=xuexue1987.w98.mc-test.com
#echo $url
#url=image.baidu.com
url=$1
if [[ $# -eq  0 ]]; then
	echo "Please input url like crawler.sh www.url.com"
	exit;
fi



curl -s $url>>file.txt




cat file.txt| grep -o "src=\"[^\"]*\""| sort | uniq -c| awk -F '"' '{print $2}'>>tmp



for ur in ` cat tmp`
do

#	echo $ur
 if [[ "$ur" =~ ^/  ]];then
	
    wget  $url$ur -P /home/zhaopeng/work/img 
	# echo "yes $url"
     
elif [[ "$ur" =~ ^http   ]];then 
    wget -P /home/zhaopeng/work/img $ur
	 #  echo "hehe $ur"
 else
	 wget -P /home/zhaopeng/work/img $url/$ur
fi

done

rm file.txt
rm tmp


