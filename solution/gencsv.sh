#!/bin/bash
i=1
while :
do
	random=$(date +%s)
	echo "$i,$random" >> /root/FOSFOR/appserver/solution/inputfile
        i=$((i+1))
done


