. $(dirname $(readlink -e $0))/utils.sh

    out=$(find /var/log/glusterfs/ -type f | xargs grep -il "has not responded in the last" | wc -l)
    if [ $out -gt 0 ];
    then 
        NOTOK log file in /var/log/glusterfs has more than 1 ping-timeout error.
    else
        OK log file in /var/log/glusterfs has not any ping-timeout error
    fi

