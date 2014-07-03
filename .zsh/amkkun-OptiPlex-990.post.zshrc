export ORACLE_HOME=/usr/include/oracle/12.1/client64
export ECLIPSE=/usr/local/eclipse
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
# export JAVA_HOME=/usr/lib/jvm/java-8-oracle
export JRE_HOME=/usr/lib/jvm/java-7-openjdk-amd64/jre
# export JRE_HOME=/usr/lib/jvm/java-8-oracle/jre
export M2=/home/amkkun/.m2/repository
export PATH=${ECLIPSE}:${M2}:${JAVA_HOME}/bin:$PATH

LD_LIBRARY_PATH=/home/amkkun/Workspace/sh/sqlplus:$LD_LIBRARY_PATH
PATH=$LD_LIBRARY_PATH:$PATH
NLS_LANG=JAPANESE_JAPAN.AL32UTF8
export LD_LIBRARY_PATH PATH NLS_LANG
export ORACLE_HOME=/usr/lib/oracle/12.1/client64
export TNS_ADMIN=$ORACLE_HOME/network/admin
export ORACLE_SID=ORCL
