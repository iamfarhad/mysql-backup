#!/bin/bash
### MySQL Server Login Info ###
MUSER="root"
MPASS="password"
MHOST="localhost"
MDB="database_name"
MYSQL="$(which mysql)"
MYSQLDUMP="$(which mysqldump)"
BAK="/home/db_backup/mysql"
BAK_MONGO="/ssdb/db_backup/mongo"
GZIP="$(which gzip)"

NOW=$(date +"%Y%m%d_%H%M")

### See comments below ###
### [ ! -d $BAK ] && mkdir -p $BAK || /bin/rm -f $BAK/* ###
### Create directory if not exists ###
[ ! -d "$BAK" ] && mkdir -p "$BAK"
[ ! -d "$BAK_MONGO" ] && mkdir -p "$BAK_MONGO"

FILE=$BAK/db_backup_final_$NOW.gz

mysqldump -u $MUSER --verbose --quick --single-transaction --password=$MPASS $MDB | $GZIP -9 > $FILE
#done

