#!/bin/bash
BINPATH=/home/kouushou/Github/spmv/bin
cur_path=$(pwd)
last=$(cat lastMtx.info)
echo $1 > lastMtx.info
if [[ "$1" > "$last" ]];
then
  echo $1 "in running"
  cd ${BINPATH};
  rm -rf run_sh_temp
  ./spmv $1 8 8 > run_sh_temp

  if [[ $? != 0 ]]
  then
    echo $1 >> ${cur_path}/err_mtx.txt
  else
    cat run_sh_temp >> ${cur_path}/$2
  fi
  rm -rf run_sh_temp
else
  echo $1 "has runned"
fi