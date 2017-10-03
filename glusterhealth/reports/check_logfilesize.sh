. $(dirname $(readlink -e $0))/utils.sh

out=$(find /var/log/glusterfs/ -type f -size +100M | wc -l)
if [ $out -gt 0 ];
then
    WARNING log files size in /var/log/glusterfs are more than 100M
else 
    OK log files size in /var/log/glusterfs are less than 100M
fi
