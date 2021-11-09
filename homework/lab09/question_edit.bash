#!/bin/bash


#create 3 fastq 
head -100 SI208546-NT_S5_L001_R1_001.fastq > sample1.fastq
head -80 SI208546-NT_S5_L001_R1_001.fastq > sample2.fastq
head -40 SI208546-NT_S5_L001_R1_001.fastq > sample3.fastq

# extract 3-4 read ; line 9-16
head -16 sample1.fastq | tail -8 > sample1_r34.fastq
head -16 sample2.fastq | tail -8 > sample2_r34.fastq
head -16 sample3.fastq | tail -8 > sample3_r34.fastq

#create cat linecount.txt
wc -l sample1.fastq sample2.fastq sample3.fastq > temp_linecount.txt 

#swab column
awk '{printf("%s\t%s\n", $2, $1)}' temp_linecount.txt > linecount.txt
rm temp_linecount.txt

# move file linecount.txt in a new folder named "results"
mkdir results
mv linecount.txt $PWD/results










