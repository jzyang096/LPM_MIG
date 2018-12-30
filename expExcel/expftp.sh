#!/bin/sh
. /spdc/.profile

export JAVA_HOME=/usr/java6
export exphome=/backup/exp2009/exp

if [ -z "$JAVA_HOME" ]; then
echo "Please configure the JAVA_HOME!"
exit
fi

cd $exphome
export JLIBDIR=./lib
export CLASSPATH=./bin

for LL in `ls $JLIBDIR/*.jar`
do
    export CLASSPATH=$CLASSPATH:$LL
done

export JAVA_OPTION="-Dfile.encoding=GBK -Xmx1024M -Xms768M"
export RUN_CLASS=com.amarsoft.poc.tools.data.export.ExpMain
export ARE_CONFIG_FILE=./etc/are.xml
#export TASK_CONFIG_FILE=./etc/exptask.xml

#${JAVA_HOME}/bin/java ${JAVA_OPTION} -classpath ${CLASSPATH} ${RUN_CLASS} are=${ARE_CONFIG_FILE} task=${TASK_CONFIG_FILE}

d=`date +%Y%m%d`
LASTDAYS=1
yy=`echo $d|cut -c 1-4`
mm=`echo $d|cut -c 5-6`
dd=`echo $d|cut -c 7-8`
LASTDAYS=`expr $LASTDAYS - $dd`
while [ $LASTDAYS -ge 0 ]
do
  mm=`expr $mm - 1`
  [ $mm -eq 0 ] && mm=12 && yy=`expr $yy - 1`
  LASTMONTHEND=`echo \`cal $mm $yy\`|awk '{print $NF}'`
  LASTDAYS=`expr $LASTDAYS - $LASTMONTHEND`
done
dd=`expr 0 - $LASTDAYS`
expr $dd : "^.$" > /dev/null && dd=0$dd
expr $mm : "^.$" > /dev/null && mm=0$mm
LASTDATE=$yy$mm$dd
echo ${LASTDATE}
d=`date +%Y%m%d`
KEEPDAYS=3
yy=`echo $d|cut -c 1-4`
mm=`echo $d|cut -c 5-6`
dd=`echo $d|cut -c 7-8`
KEEPDAYS=`expr $KEEPDAYS - $dd`
while [ $KEEPDAYS -ge 0 ]
do
  mm=`expr $mm - 1`
  [ $mm -eq 0 ] && mm=12 && yy=`expr $yy - 1`
  LASTMONTHEND=`echo \`cal $mm $yy\`|awk '{print $NF}'`
  KEEPDAYS=`expr $KEEPDAYS - $LASTMONTHEND`
done
dd=`expr 0 - $KEEPDAYS`
expr $dd : "^.$" > /dev/null && dd=0$dd
expr $mm : "^.$" > /dev/null && mm=0$mm
KEEPDATE=$yy$mm$dd
echo ${KEEPDATE}
rm -rf ${exphome}/data/$KEEPDATE
d=$LASTDATE
touch ${exphome}/data/$d/FINISH|date>${exphome}/data/$d/FINISH
echo File FINISH created
echo start ftp to 10.100.180.67
ftp -i -n 10.100.180.67<<EOF
user FTP_RMO ftprmo
mkdir  /etldata/RMO/PREPARE/$d
cd /etldata/RMO/PREPARE/$d
lcd ${exphome}/data/$d
bin
mput d.*
put FINISH
quit
EOF
echo 上传信号文件给10.100.189.99
touch ${exphome}/data/$d/dir.rmo_etl_start_f$d|date>${exphome}/data/$d/dir.rmo_etl_start_f$d
echo File dir.rmo_etl_start_f$d created
echo start ftp to 10.100.189.99
ftp -i -n 10.100.189.99<<EOF
user etluser etl_user
lcd ${exphome}/data/$d
put dir.rmo_etl_start_f$d
quit
EOF
echo put dir.rmo_etl_start_f$d success
