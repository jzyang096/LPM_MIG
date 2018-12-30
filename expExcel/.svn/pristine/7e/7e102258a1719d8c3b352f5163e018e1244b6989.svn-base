@echo off

IF "%JAVA_HOME%"=="" SET LOCAL_JAVA=java
IF NOT "%JAVA_HOME%"=="" SET LOCAL_JAVA=%JAVA_HOME%\bin\java

set basedir=%~f0
:strip
set removed=%basedir:~-1%
set basedir=%basedir:~0,-1%
if NOT "%removed%"=="\" goto strip
set BASE_HOME=%basedir%

dir /b "%BASE_HOME%\lib\*.*" > %TEMP%\run-lib.tmp
FOR /F %%I IN (%TEMP%\run-lib.tmp) DO CALL "%BASE_HOME%\addpath.bat" "%BASE_HOME%\lib\%%I"

SET TMP_CP=./bin;%TMP_CP%;"%CLASSPATH%"

@rem set JAVA_OPTION="-Dfile.encoding=GBK -Xmx1024M -Xms256M"
set RUN_CLASS=com.amarsoft.als.exp.ExpMain
set ARE_CONFIG_FILE=./etc/are.xml

"%LOCAL_JAVA%" -Xmx256m -cp %TMP_CP% %RUN_CLASS% are=%ARE_CONFIG_FILE%