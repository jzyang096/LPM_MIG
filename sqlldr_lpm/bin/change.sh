file_name=$1
yu=$2
temp_file=$3
sed -i '1i ( ' ${yu}/${file_name}.ctl
sed -i '1i  trailing nullcols ' ${yu}/${file_name}.ctl
sed -i '1i  fields terminated by "^^" ' ${yu}/${file_name}.ctl
sed -i '1i  replace into table '${file_name}' ' ${yu}/${file_name}.ctl
sed -i '1i  infile '\'''${temp_file}''\''' ${yu}/${file_name}.ctl
sed -i '1i  CHARACTERSET AL32UTF8  LENGTH SEMANTICS CHARACTER' ${yu}/${file_name}.ctl
sed -i '1i load data ' ${yu}/${file_name}.ctl
sed -i   '$s/,/)/' ${yu}/${file_name}.ctl