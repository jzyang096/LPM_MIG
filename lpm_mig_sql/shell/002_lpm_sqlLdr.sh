#******************************************************
# function : 002_lpm_sqlLdr.sh
# author : jzyang
# date 2018/12/20
# version 1.0
#	mark:	1.复制数据文件到sqlLdr工程下
#       2.检查数据文件
#				3.调用sqlLdr指令
#******************************************************
xtrq=`date +%Y%m%d`
#日志文件路径
log_file=/home/lpmtask/ncb_mig/log/datafilecheck_${xtrq}.log
#NAS上数据文件路径
NAS_PATH=/NAS_MIG/NAS_LPM/PRD/20181031/IN
TXT_PATH=/home/lpmtask/ncb_mig/sqlldr_lpm/in
#echo "清除数据文件开始" >> $log_file
#rm -rf /home/lpmtask/ncb_mig/sqlldr_lpm/in/*
#echo "清除数据文件成功" >> $log_file
#从NAS获取数据文件
#若路径有变化，需要修改
cp $NAS_PATH/*.txt $TXT_PATH/

#!/bin/bash
ENT_INFO="$TXT_PATH/ENT_INFO.txt"
if [ -f "$ENT_INFO" ]
then
 echo "$ENT_INFO found."
else
 echo "$ENT_INFO not found."
fi

