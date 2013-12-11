#!/bin/sh

mkdir -p logs

for n in 3 4 5 6 7 8 9 19 29 39 49 59 69 79 89 99 ; do
    m=`expr \( $n + 1 \) \* 500`
    echo "building $m files"
    rm -rf sconsbld
    ./genscons.pl -d $n -l 2 -f 500
    echo "STARTING $m ------------------------------" >> logs/vmstat.log
    cd sconsbld
    (time scons) > ../logs/$m.log 2>&1
    cd ..
    echo "FINISHED $m ------------------------------" >> logs/vmstat.log
done
