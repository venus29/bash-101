#!/bin/bash


max3() #@ Sort 3 integers and store in an array
{ 
if [[ $4 =~ ^[1-9] ]] || [[ $4 =~ [^a-zA-Z_0-9] ]];
then
    echo "Invalid variable name."
    return 1
fi

    #@ USAGE: max3 N1 N2 N3 [VARNAME]
declare -n _max3=${4:-results}
(( $# < 3 )) && return 4
(( $1 > $2 )) && set -- "$2" "$1" "$3"
(( $2 > $3 )) && set -- "$1" "$3" "$2"
(( $1 > $2 )) && set -- "$2" "$1" "$3"
_max3=( "$3" "$2" "$1" )

}

