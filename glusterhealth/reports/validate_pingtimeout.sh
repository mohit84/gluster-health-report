. $(dirname $(readlink -e $0))/utils.sh

    out=$(find /var/lib/glusterd -type f -name "*.vol" | xargs grep "option ping-timeout" | head -1 | awk -F "ping-timeout"  '{print $2}')
    if [ $out -gt 300 ] || [ $out -le 10 ];
    then 
        WARNING Configured Ping Timeout value $out Either more than 300 Or Less than 10
    else
        OK Configured Ping Timeout value is $out
    fi

