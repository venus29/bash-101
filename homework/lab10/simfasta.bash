
#!/bin/bash

# 1. Create regular expressions
re="^[0-9]+$"

# 2. Validate 3 parameter is exist
if [[ $# != 3  ]]
then
    echo "Need three arguments: number of sequence, sequence length and output file name"
    exit 1

# Check first parameter must be numeric
elif ! [[ $1 =~ $re ]]
then
    echo "First parameter must be numeric"
    exit 1

# Check second parameter must be numeric
elif ! [[ $2 =~ $re ]]
then
    echo "Second parameter must be numeric"
    exit 1

# Check file is exists
elif [ -f "$3" ]
then
    printf "file already exists\n"
    exit 1
    
fi
#Create fasta file by RANDOM string : ATGC
chars=ATGC


for ((i=1; i <= $1; i++))
do 
    echo ">read$i" >> file.fasta 
    for ((k=1; k <= $2; k++))
    do
        echo -n "${chars:RANDOM%${#chars}:1}" >> file.fasta
        
    done
    printf "\n" >> file.fasta

done
mv file.fasta $3
