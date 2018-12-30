#!/bin/sh
#. /oracle/.profile

export JAVA_HOME=/usr/java/latest

if [ -z "$JAVA_HOME" ]; then
echo "Please configure the JAVA_HOME!"
exit
fi

export JLIBDIR=./lib
export CLASSPATH=./bin

for LL in `ls $JLIBDIR/*.jar`
do
    export CLASSPATH=$CLASSPATH:$LL
done

export JAVA_OPTION="-Dfile.encoding=GBK -Xmx1024M -Xms768M"
export RUN_CLASS=com.amarsoft.als.exp.ExpMain
export ARE_CONFIG_FILE=./etc/are.xml

${JAVA_HOME}/bin/java ${JAVA_OPTION} -classpath ${CLASSPATH} ${RUN_CLASS} are=${ARE_CONFIG_FILE}