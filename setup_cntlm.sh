#!/bin/bash

sed -i "s/REPLACE_USERNAME/$2/g" /etc/cntlm.conf
sed -i "s/REPLACE_DOMAIN/$3/g" /etc/cntlm.conf
sed -i "s/REPLACE_PROXY_URL/$1/g" /etc/cntlm.conf
pwd=$(read -s -p "Password: " pwd && echo $pwd)
echo $pwd | cntlm -H 2> /dev/null | tee | awk '$1 ~ /Pass(LM|NTLMv2|NT)/ { system("sed -i \"s/"$1"\\s\\{1,\\}REPLACE_GENERATED_"$1"/"$1"       "$2"/g\" /etc/cntlm.conf") }'
