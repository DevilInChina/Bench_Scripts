#!/bin/bash
rm -rf findMtx.sh
rm -rf $3
echo \#!/bin/bash > findMtx.sh
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

cat $3 |sort > temp
rm -rf $3
lastTitle=''
cat temp | while read line;
do
  cur_title=$(echo $line | awk -F"[']" '{print $1}')
  #echo $cur_title
  if [ "$cur_title" = "$lastTitle" ]
  then
    continue
  else
    echo "run.sh" $(echo $line | awk -F"[']" '{print $2}') >> $3
  fi
  lastTitle=$cur_title
done
rm -rf temp
rm -rf findMtx.sh
rm -rf MtxPath
chmod 777 $3
