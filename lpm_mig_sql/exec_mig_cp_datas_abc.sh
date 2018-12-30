log_road=/home/lpmtask/ncb_mig/lpm_mig_sql
file=ENT_INFO

sqlplus nyals/nyals@10.37.65.67:1521/ncbdlmppdb <<EOF | tee $log_road/$file.log
exec MIG_CP_DATAS('$file')
EOF

if [[ "$(cat $log_road/$file.log | grep "SP2-")" = "" ]] && [[ "$(cat $log_road/$file.log | grep "ORA")" = "" ]]; then
   echo " $file is ok"
   rm $log_road/$file.log
else
   echo "$file is error"
   exit 8
fi