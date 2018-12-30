#******************************************************
# function : data_rollback.sh
# author : jzyang
# date 2018/09/18
# version 1.0
#	mark:	lpmÇ¨ÒÆÊý¾Ý»Ø¹ö
#******************************************************

curdate=`date +%Y/%m/%d\ %H:%M:%S`
echo "Begin Time :$curdate"
echo "data_rollback begin"
today=`date +%Y%m%d`
sqlplus -S  als_nylpm/als_nylpm@10.37.96.101:1521/NCBTXDPDB << EOF
spool /home/lpmtask/ncb_mig/lpm_mig_sql/20181201_rollback.log
delete from ENT_INFO where customerid in (select customerid from ENT_INFO_MIG);
delete from CUSTOMER_RELATIVE where customerid in (select customerid from CUSTOMER_RELATIVE_MIG);
delete from CUSTOMER_BELONG where customerid in (select customerid from CUSTOMER_BELONG_MIG);
delete from IND_INFO where customerid in (select customerid from IND_INFO_MIG);
delete from CUSTOMER_ADDRESS where serialno in (select serialno from CUSTOMER_ADDRESS_MIG);
delete from CUSTOMER_TEL where serialno in (select serialno from CUSTOMER_TEL_MIG);
delete from CUSTOMER_CERT where serialno in (select serialno from CUSTOMER_CERT_MIG);
delete from BUSINESS_APPROVE where serialno in (select serialno from BUSINESS_APPROVE_MIG);
delete from BUSINESS_CONTRACT where serialno in (select serialno from BUSINESS_CONTRACT_MIG);
delete from BUSINESS_DUEBILL where serialno in (select serialno from BUSINESS_DUEBILL_MIG);
delete from GUARANTY_CONTRACT where serialno in (select serialno from GUARANTY_CONTRACT_MIG);
delete from GUARANTY_INFO where guarantyid in (select guarantyid from GUARANTY_INFO_MIG);
delete from GUARANTY_RELATIVE where objectno in (select serialno from BUSINESS_CONTRACT_MIG) and objectType ='BusinessContract';
delete from GUARANTY_RELATIVE where objectno in (select serialno from BUSINESS_CONTRACT_MIG) and objectType ='GuarantyContract';
delete from CL_INFO where lineid in (select lineid from CL_INFO_MIG);
delete from CL_DIVIDE where serialno in (select serialno from CL_DIVIDE_MIG);
delete from CL_OCCUPY where serialno in (select serialno from CL_OCCUPY_MIG);
delete from BUSINESS_WASTEBOOK where serialno in (select serialno from BUSINESS_WASTEBOOK_MIG);
delete from GROUP_INFO where groupid in (select groupid from GROUP_INFO_MIG);
delete from GROUP_MEMBER_RELATIVE where serialno in (select serialno from GROUP_MEMBER_RELATIVE_MIG);
delete from CONTRACT_RELATIVE where serialno in (select serialno from CONTRACT_RELATIVE_MIG);
delete from CMS_INSURANCE_INFO where serialno in (select serialno from CMS_INSURANCE_INFO_MIG);
delete from CUSTOMER_INFO where customerid in (select customerid from CUSTOMER_INFO_MIG);
delete from CL_CREDIT_SAME where serialno in (select serialno from CL_CREDIT_SAME_MIG);
delete from APPLY_BATCHRELATIVE where serialno in (select serialno from APPLY_BATCHRELATIVE_MIG);
delete from CLASSIFY_RECORD where objectno in (select objectno from CLASSIFY_RECORD_MIG);
delete from MARGIN_INFO where serialno in (select serialno from MARGIN_INFO_MIG);
delete from BUSINESS_IMAGE_RELATIVE where serialno in (select serialno from BUSINESS_IMAGE_RELATIVE_MIG);
delete from BUSINESS_PUTOUT where serialno in (select serialno from BUSINESS_PUTOUT_MIG);
delete from BILL_INFO bi where bi.objectno||bi.serialno in (select objectno||serialno from BILL_INFO_MIG);
commit;
exit;
EOF
echo "data_rollback end"
curdate=`date +%Y/%m/%d\ %H:%M:%S`
echo "End Time :$curdate"