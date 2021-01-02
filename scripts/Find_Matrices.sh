#!/bin/bash
rm -rf findMtx.sh
rm -rf $3
echo \#!/bin/bash > findMtx.sh
for i in $(cat $2);do
	echo "find" $1 -name \'$i.mtx\' ">> MtxPath">> findMtx.sh;
done
chmod 777 findMtx.sh
./findMtx.sh
for i in $(cat MtxPath);do
	echo "./run.sh" \'$i\'>> $3
done
rm -rf findMtx.sh
rm -rf MtxPath
chmod 777 $3
