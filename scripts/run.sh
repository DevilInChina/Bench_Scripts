#!/bin/bash
cur_path=$(pwd)

BINPATH=/home/kouushou/Github/spmv/bin
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