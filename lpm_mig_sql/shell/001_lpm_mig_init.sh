#******************************************************
# function : 001_lpm_mig_init.sh
# author : jzyang
# date 2018/09/12
# version 1.0
#	mark:	初始化LPM数据迁移环境
#******************************************************
curdate=`date +%Y/%m/%d\ %H:%M:%S`
echo "Begin Time :$curdate"
echo "lpm_mig_init begin"
today=`date +%Y%m%d`
export NLS_LANG="AMERICAN_AMERICA.ZHS16GBK"
sqlplus -S  ALS_NCBLPM/ALS_NCBLPM@10.37.97.95:1521/NCBUXDPDB << EOF
spool /home/lpmtask/ncb_mig/lpm_mig_sql/20181205_init.log
@/home/lpmtask/ncb_mig/lpm_mig_sql/01_init_data.sql;
@/home/lpmtask/ncb_mig/lpm_mig_sql/02_table_CL_Info_Mig_Base.sql;
@/home/lpmtask/ncb_mig/lpm_mig_sql/02_table_CL_Occupy_Error.sql;
@/home/lpmtask/ncb_mig/lpm_mig_sql/02_table_ExcelInfo.sql;
@/home/lpmtask/ncb_mig/lpm_mig_sql/02_table_SQ_bad_data.sql;
@/home/lpmtask/ncb_mig/lpm_mig_sql/02_table_SQ_CL_Error.sql;
@/home/lpmtask/ncb_mig/lpm_mig_sql/02_table_SQ_table_row.sql;
@/home/lpmtask/ncb_mig/lpm_mig_sql/03_init_ExcelInfo.sql;
@/home/lpmtask/ncb_mig/lpm_mig_sql/03_init_SQ_Table_Row;
@/home/lpmtask/ncb_mig/lpm_mig_sql/04_proc_MIG_CP_DATA.sql;
@/home/lpmtask/ncb_mig/lpm_mig_sql/04_proc_MIG_CP_DATAS;
@/home/lpmtask/ncb_mig/lpm_mig_sql/04_proc_SQ_auto_checkout.sql;
@/home/lpmtask/ncb_mig/lpm_mig_sql/04_proc_SQ_check_tablerow.sql;
commit;
spool off;
exit;
EOF
echo "lpm_mig_init end"
curdate=`date +%Y/%m/%d\ %H:%M:%S`
echo "End Time :$curdate"