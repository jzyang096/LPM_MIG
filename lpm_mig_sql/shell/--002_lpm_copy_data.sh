#******************************************************
# function : init-all.sh
# author : jzyang
# date 2018/09/12
# version 1.0
#	mark:	��ʼ��LPM����Ǩ�ƻ���
#******************************************************
curdate=`date +%Y/%m/%d\ %H:%M:%S`
echo "Begin Time :$curdate"
echo "lpm_mig_init begin"
today=`date +%Y%m%d`
export NLS_LANG="AMERICAN_AMERICA.ZHS16GBK"
sqlplus -S  ALS_NCBLPM/ALS_NCBLPM@10.37.97.95:1521/NCBUXDPDB << EOF
@/home/lpmtask/ncb_mig/lpm_mig_sql/exec_mig_cp_datas.sql;
commit;
exit;
EOF
echo "lpm_mig_init end"
curdate=`date +%Y/%m/%d\ %H:%M:%S`
echo "End Time :$curdate"