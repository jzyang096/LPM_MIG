cd /home/oracle/data_mig/sqlldr/ext/bin/
get_date=$1
server=$2
data_date=$3
mig_road=/home/oracle/data_mig/extern/migproc/LPM
log_road=/oradata/extern_share/log/transcoding/LPM/$data_date
mkdir -p $log_road
a=$(date +%H%M%S)
for tmp_file in `cat $mig_road/MIG_LPM_LIST.txt|grep -v "^#"`
do
echo $tmp_file
prog_type=`echo $tmp_file|cut -d ',' -f 1`
file=`echo $tmp_file|cut -d ',' -f 2`

echo $prog_type
echo $file

if [ $prog_type = "SQL" ];then
sqlplus dev001/123456@${server} <<EOF | tee $log_road/$file.log
@$mig_road/$file.sql
EOF
else
sqlplus dev001/123456@${server} <<EOF | tee $log_road/$file.log
@$mig_road/${file}.sql
alter procedure $file compile;
exec $file
EOF
fi

if [[ "$(cat $log_road/$file.log | grep "SP2-")" = "" ]] && [[ "$(cat $log_road/$file.log | grep "ORA")" = "" ]]; then
   echo " $file is ok"
   rm $log_road/$file.log
else
   echo "$file is error"
   exit 8
fi

done
b=$(date +%H%M%S)
echo -e "startTime:\t$a" > $log_road/lpm_mig_runtime.log
echo -e "endTime:\t$b" >> $log_road/lpm_mig_runtime.log
