#!/bin/bash

isvalidip()
{
case $1 in
"" | *[!0-9.]* | *[!0-9]) return 1 ;;
esac

set "${1//./ }"

set -- $1
[ $# -eq 4 ] && ## must be four parameters

[ ${1:-default} -le 255 ] && [ ${2:-default} -le 255 ] &&
[ ${3:-default} -le 255 ] && [ ${4:-default} -le 255 ]
}
    for ip in "$@"
    do
        valid_flag=1
        for ip_addr in "$@"
        do
            if isvalidip "$ip" 
            then
                valid_flag=0
            else
                valid_flag=1
                break;
            fi
        done

            if [[ $valid_flag == 0 ]]
            then
                _valid_ips+=( $ip )
            else
                _invalid_ips+=( $ip )
            fi
    done
    if [ ${#_valid_ips} -gt 0 ] && [ ${#_invalid_ips} -gt 0 ]; then
        echo "Valid IP address are as follows."
        printf "%s\n" "${_valid_ips[@]}"
        echo "Invalid IP address are as follows."
        printf "%s\n" "${_invalid_ips[@]}"
    elif [ ${#_valid_ips} -gt 0 ]; then
        echo "Valid IP address are as follows."
        printf "%s\n" "${_valid_ips[@]}"
    elif [ ${#_invalid_ips} -gt 0 ]; then
        echo "Invalid IP address are as follows."
        printf "%s\n" "${_invalid_ips[@]}"
    fi





 