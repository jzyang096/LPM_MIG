#******************************************************
# function : 002_lpm_sqlLdr.sh
# author : jzyang
# date 2018/12/20
# version 1.0
#	mark:	1.���������ļ���sqlLdr������
#       2.��������ļ�
#				3.����sqlLdrָ��
#******************************************************
xtrq=`date +%Y%m%d`
#��־�ļ�·��
log_file=/home/lpmtask/ncb_mig/log/datafilecheck_${xtrq}.log
#NAS�������ļ�·��
NAS_PATH=/NAS_MIG/NAS_LPM/PRD/20181031/IN
TXT_PATH=/home/lpmtask/ncb_mig/sqlldr_lpm/in
#echo "��������ļ���ʼ" >> $log_file
#rm -rf /home/lpmtask/ncb_mig/sqlldr_lpm/in/*
#echo "��������ļ��ɹ�" >> $log_file
#��NAS��ȡ�����ļ�
#��·���б仯����Ҫ�޸�
cp $NAS_PATH/*.txt $TXT_PATH/

#!/bin/bash
ENT_INFO="$TXT_PATH/ENT_INFO.txt"
if [ -f "$ENT_INFO" ]
then
 echo "$ENT_INFO found."
else
 echo "$ENT_INFO not found."
fi

