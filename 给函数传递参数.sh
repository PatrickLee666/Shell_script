#!/bin/bash
p_num()
{
	num=$1 #获取第一个参数
	echo $num
}
for n in $@
do
	p_num $n
done
