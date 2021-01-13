#!/bin/bash
rm -rf findMtx.sh
rm -rf $2
echo \#!/bin/bash > findMtx.sh
echo "find" $1 -name *.mtx ">> MtxPath" > findMtx.sh
chmod 777 findMtx.sh
./findMtx.sh
for i in $(cat MtxPath);do
	echo "./run.sh" \'$i\'>> $2
done
rm -rf findMtx.sh
rm -rf MtxPath
chmod 777 $2
