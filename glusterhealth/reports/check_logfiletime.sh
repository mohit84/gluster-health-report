. $(dirname $(readlink -e $0))/utils.sh

out=$(find /var/log/glusterfs/ -type f -mtime +30 | wc -l)
if [ $out -gt 0 ];
then
    WARNING log file exist in directory /var/log/glusterfs older than 30 days.
else 
    OK log file exist in directory /var/log/glusterfs less than 30 days.
fi
