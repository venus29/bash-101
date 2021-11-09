#!/bin/bash
mkdir five
cd five
for i in {1..5}
do
    mkdir dir${i}
    for j in {1..4}
    do
        touch ${PWD}/dir${i}/file${j}
        for ((k=1; k <= ${j}; k++))
        do
            echo $j >> ${PWD}/dir${i}/file${j}
        done
    done
done
