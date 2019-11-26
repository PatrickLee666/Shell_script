#!/bin/bash

#完成数据库定时备份
#备份路径
BACKUP=/Users/lijunfeng/data/mysql
#获取当前时间
DATETIME=$(date +%Y_%m_%d_%H%M%S)

echo "=====开始备份====="
echo "=====备份的路径是 $BACKUP/DATETIME.tar.gz"

#主机
HOST=localhost
#mysql账号用户名
DB_USER=root
#mysql密码
DB_PWD=root
#备份数据库名称
DATABASE=lab
#创建备份路径
#如果备份路径文件夹存在，就使用，否则创建
[ ! -d "$BACKUP/$DATETIME" ] && mkdir -p "$BACKUP/$DATETIME"
#执行mysql的备份数据库命令
mysqldump -u${DB_USER} -p${DB_PWD} --host=$HOST $DATABASE | gzip > $BACKUP/$DATETIME/$DATETIME.sql.gz
#打包备份文件
cd $BACKUP
tar -zcvf $DATATIME.tar.gz $DATETIME
#删除临时目录
rm -rf $BACKUP/$DATETIME

#删除10天前的备份文件
find $BACKUP -mtime +10 -name "*.tar.gz" -exec rm -rf {} \;
echo "=====备份文件成功====="
