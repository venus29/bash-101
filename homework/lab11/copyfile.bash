#!/bin/bash

while getopts "o:" opt;do
    case ${opt} in
        o) outfile=$OPTARG ;;
        *) exit 1 ;;   
    esac  
done
shift $((OPTIND-1))
cat $@ >> $outfile
