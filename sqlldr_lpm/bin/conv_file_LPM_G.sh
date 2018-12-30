road=/home/lpmtask/ncb_mig/sqlldr_lpm/cfg/convLIST
data_road=/home/lpmtask/ncb_mig/sqlldr_lpm/cfg/datamapping
get_road=/home/lpmtask/ncb_mig/sqlldr_lpm/in
yu_road=/home/lpmtask/ncb_mig/sqlldr_lpm/ctl
log_road=/home/lpmtask/ncb_mig/sqlldr_lpm/log
post="LPM"
in_road=/home/lpmtask/ncb_mig/sqlldr_lpm/out
a=$(date +%H%M%S)
rm ${log_road}/${post}/*
for file_name in `cat $road/${post}_LIST.txt | grep '^G,' | cut -d ',' -f 2`
do
  echo $file_name
  actual_table=`echo "$file_name" | cut -d '.' -f 1`
  #file_name=$actual_table
  #col_cnt=`echo "$file_name" | cut -d '.' -f 2`
  file_name=$actual_table
  #echo $actual_table ::: $col_cnt
  file_cnt=1
  for table_name in `find $get_road -name "$file_name.*" | cut -d '/' -f 7`
  do
     if [ ! -n "$table_name" ]
     then
       echo "error"
       continue
     else
       echo "good"
     fi
     echo $table_name
     file_name=$table_name
     temp_file=`echo $in_road/$file_name.temp`
     echo $temp_file
     if [ -f $temp_file ];then
       rm $temp_file
     fi
     touch $temp_file
  #./add_line_end $get_road/$table_name $in_road/$file_name.temp $col_cnt
  cp $get_road/$table_name $in_road/$file_name.temp
  #f_to_index=0
  #f_fr_index=1
  #col_lens=`cut -f 1,3,4,5,6 $data_road/${post}.txt | grep -i $file_name | cut -f 2,3,4,5 |sed 's/\t/!/g'|sed 's/PACKED DECIMAL/P/g'|sed 's/ZONED DECIMAL/Z/g'|sed 's/CHAR/C/g'`
  #./tr_fl_file $get_road/$table_name $in_road/$file_name.temp GBK UTF-8 0 0 $col_lens
 # while [ $f_to_index -lt $file_length ]
 # do
 #   for col_len in ${col_lens[@]}
 #   do
 #     let f_to_index=f_to_index+col_len
 #     echo -n '^^' >> $temp_file
 #     cut -b $f_fr_index-$f_to_index /home/oracle/data_mig/sqlldr/in/$file_name | iconv -s -c -f IBM-935 -t GBK >> $temp_file
 #     let f_fr_index=f_fr_index+col_len
 #   done
 #   echo >> $temp_file
 # done
  echo file_no is $file_cnt
#  if [ $file_cnt == 1 ];then
#sqlplus iss/iss@ncbtgjjspdb <<EOF 
#define file_name=${file_name}
#@truncate_table.sql 
#EOF  

#  fi

if [ $file_cnt == 1 ];then
sqlplus ALS_NYLPM/lpmpassword@10.37.97.95:1521/NCBUXDPDB <<EOF 
define file_name=${file_name}
define actual_table=${actual_table}
@student_tss.sql 
EOF
sh change_tss_r.sh ${file_name} ${yu_road} ${temp_file} ${actual_table}

else
sqlplus ALS_NYLPM/lpmpassword@10.37.97.95:1521/NCBUXDPDB <<EOF
define file_name=${file_name}
define actual_table=${actual_table}
@student_tss.sql 
EOF
sh change_tss_a.sh ${file_name} ${yu_road} ${temp_file} ${actual_table}

fi

    sqlldr ALS_NYLPM/lpmpassword@10.37.97.95:1521/NCBUXDPDB control=${yu_road}/${file_name}.ctl errors=10000 rows=2000 log=${log_road}/${post}/${file_name}.log bad=${log_road}/${post}/${file_name}.bad
    let file_cnt++
  done
done

grep -i "Rows not loaded" ${log_road}/${post}/*.log > errors.txt
grep -i "Row not loaded" ${log_road}/${post}/*.log >> errors.txt
grep -v ":  0 Rows not loaded" errors.txt > err_result.txt
grep -i "Rows successfully loaded." ${log_road}/${post}/*.log > success.txt
grep -i "Row successfully loaded." ${log_road}/${post}/*.log >> success.txt
#cat success.txt | cut -d " " -f 1,3 | sed -s 's/: /./g' > suc_result.txt
rm errors.txt
#rm success.txt

b=$(date +%H%M%S)
echo -e "startTime:\t$a"
echo -e "endTime:\t$b"
#cat DW9PCIT.20350813 | iconv -f IBM-935 -t GBK > DW9PCIT.20350813.out

