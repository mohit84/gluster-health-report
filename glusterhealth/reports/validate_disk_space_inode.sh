. $(dirname $(readlink -e $0))/utils.sh

local_ip=$(ip route get 8.8.8.8 | head -1 | awk '{print $7}')
if [ $local_ip ]
then
    for brick_name in `gluster v info --mode=script | grep -i "brick[0-9]" | grep $local_ip | awk -F ":" '{print $3}'`
    do
        disk_space_p=$(df -klh $brick_name | tail -1  | awk '{print $5}')
        disk_space=$(echo $disk_space_p | awk -F "%" '{print $1}')
        if [ $disk_space -gt 90 ]  
        then
            WARNING Current disk usage space $disk_space% is more than 90 percent for brick $brick_name
        else
            OK disk usage space $disk_space% is fine for brick $brick_name
        fi
        if [ $disk_space -gt 95 ]  
        then
            NOTOK Current disk usage space $disk_space% is more than 95 percent for brick $brick_name
        fi 
done
fi

if [ $local_ip ]
then
    for brick_name in `gluster v info --mode=script | grep -i "brick[0-9]" | grep $local_ip | awk -F ":" '{print $3}'`
    do
        inode_space_p=$(df -i $brick_name | tail -1  | awk '{print $5}')
        inode_space=$(echo $inode_space_p | awk -F "%" '{print $1}')
        if [ $disk_space -gt 90 ]  
        then
            WARNING Current Inode usage $inode_space% is more than 90 percent for brick $brick_name
        else
            OK Inode usage $inode_space% is fine for brick $brick_name
        fi
        if [ $inode_space -gt 95 ]  
        then
            NOTOK Current Inode usage space $inode_space% is more than 95 percent for brick $brick_name
        fi 
done
fi
