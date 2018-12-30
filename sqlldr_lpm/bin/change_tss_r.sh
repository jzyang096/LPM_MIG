file_name=$1
yu=$2
temp_file=$3
actual_table=$4
echo "in change:::$yu::temp:$temp_file::file:$file_name"
sed -i '1i ( ' ${yu}/${file_name}.ctl
sed -i '1i  trailing nullcols ' ${yu}/${file_name}.ctl
#sed -i '1i  optionally enclosed by '\''"'\''' ${yu}/${file_name}.ctl
sed -i '1i  fields terminated by "^^" ' ${yu}/${file_name}.ctl
sed -i '1i  replace into table MIG_'${actual_table}' ' ${yu}/${file_name}.ctl
sed -i '1i  infile '\'''${temp_file}''\''' ${yu}/${file_name}.ctl
sed -i '1i  CHARACTERSET ZHS16GBK  LENGTH SEMANTICS CHARACTER' ${yu}/${file_name}.ctl
sed -i '1i load data ' ${yu}/${file_name}.ctl
sed -i   '$s/,/)/' ${yu}/${file_name}.ctl
