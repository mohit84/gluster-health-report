. $(dirname $(readlink -e $0))/utils.sh

if [ -f /etc/logrotate.d/glusterfs ];
then
    if grep -q '.log {' /etc/logrotate.d/glusterfs
    then
        OK logrotate is configured for glusterfs
    fi
else 
    NOTOK log rotate is not configured for glusterfs
fi
