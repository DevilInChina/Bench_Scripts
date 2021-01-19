#!/bin/bash
cat MtxPath | while read line ;
do
  IFS_OLD=$IFS
  IFS=/
  FileName=''
  for i in $line;do
    FileName=$i
    done
  IFS=$IFS_OLD
  echo $FileName
done