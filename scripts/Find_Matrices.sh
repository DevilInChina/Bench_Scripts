#!/bin/bash
rm -rf findMtx.sh
rm -rf $3

find $1 -name *.mtx >> MtxPath

cat MtxPath | while read line ;
do

  IFS_OLD=$IFS
  IFS=/
  FileName=''
  for i in $line;do
    FileName=$i
    done
  IFS=$IFS_OLD
	echo $FileName\'$line >> $3
done



NameSet=$(sed 's/$/&.mtx/g' $2)

cat $3 |sort > temp
rm -rf $3
echo $NameSet > sss
lastTitle=''

cat temp | while read line;
do
  cur_title=$(echo $line | awk -F"[']" '{print $1}')

  Cur_name=$cur_title
  #echo $Cur_name
  if [ "$cur_title" = "$lastTitle" ]
  then
    continue
  else
    if [[ $NameSet == *$Cur_name* ]]
    then
      echo "./run.sh" \'$(echo $line | awk -F"[']" '{print $2}')\' \$1>> $3
    fi
  fi
  lastTitle=$cur_title
done
rm -rf temp
rm -rf findMtx.sh
rm -rf MtxPath

chmod 777 $3
