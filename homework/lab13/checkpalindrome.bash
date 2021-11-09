#!/bin/bash

checkpalindrome () 

{ 
    input_str=$1
    set "${1// /}"
    set "${1//[[:punct:]]/}"
   
    len=$((${#1} - 1))
   
    for ((i=0; i <= (len/2); i++)); do
        [[ ${1:i:1} == ${1:len-i:1} ]] || return 1
    done
    return 0
}

for var in "$@"; do
    
    if checkpalindrome "$@"; then
        echo "$input_str is a palindrome"
    else
        echo "$input_str is a NOT palindrome"
    fi
done