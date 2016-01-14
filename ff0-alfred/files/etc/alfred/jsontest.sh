#. /lib/functions/jshn.sh

. /usr/share/libubox/jshn.sh

lat=$(uci get owm.settings.lat)
lon=$(uci get owm.settings.lon)

# generating json data
nodeid=$(cat /sys/class/net/eth0/address | tr -d ':')

json_init
json_add_string "node_id" $nodeid
json_add_string "hostname" $(cat /proc/sys/kernel/hostname)
json_add_object "location"
json_add_string "latitude" $(uci get owm.settings.lat)
json_add_string "longitude" $(uci get owm.settings.lon)
json_add_string "altitude" "0"
json_close_object
MSG158=`json_dump`
echo $MSG158 | gzip > /tmp/158.gz
cat /tmp/158.gz | alfred -s 158 

json_init
json_add_string "node_id" $nodeid
json_add_int "uptime" $(cat /proc/uptime | awk '{print $1}')
processes=$(cat /proc/loadavg | awk -F' ' '{ print $4 }')
json_add_object "processes"
json_add_int "running" $(echo $processes | awk -F'/' '{print $1}')
json_add_int "total" $(echo $processes | awk -F'/' '{print $2}') 
json_close_object
json_add_object "memory"
json_add_int "free" $(cat /proc/meminfo | grep "MemFree" | awk -F' ' '{ print $2 }') 
json_add_int "cached" $(cat /proc/meminfo | grep "Cached" | awk -F' ' '{ print $2 }')
json_add_int "total" $(cat /proc/meminfo | grep "MemTotal" | awk -F' ' '{ print $2 }')
json_add_int "buffers" $(cat /proc/meminfo | grep "Buffers" | awk -F' ' '{ print $2 }')
json_close_object
json_add_int "loadavg" $(cat /proc/loadavg | awk '{print $1}')
json_add_int "idletime" $(cat /proc/loadavg | awk '{print $2}')
json_add_object "clients"
json_add_int "total" $(grep -Eo "\[.*\]+" /sys/kernel/debug/batman_adv/bat0/transtable_local|grep -c W)
json_add_int "wifi" $(grep -Eo "\[.*\]+" /sys/kernel/debug/batman_adv/bat0/transtable_local|grep -c W)
json_add_int "wifi24" $(grep -Eo "\[.*\]+" /sys/kernel/debug/batman_adv/bat0/transtable_local|grep -c W)
json_add_int "wifi5" 0
json_close_object
json_add_object "software"
  json_add_object "firmware"
    json_add_string "base" $(cat /etc/firmware)
    json_add_string "release" $(cat /etc/firmware)
  json_close_object
json_close_object
json_add_string "gateway" $(cat /sys/kernel/debug/batman_adv/bat0/gateways | grep "=>" | awk -F' ' '{print $2}')
MSG159=`json_dump`
echo $MSG159 | gzip > /tmp/159.gz
cat /tmp/159.gz | alfred -s 159

json_init
json_add_string "node_id" $(cat /sys/class/net/eth0/address | tr -d ':')
json_init
json_add_string "node_id" $(cat /sys/class/net/eth0/address | tr -d ':')
iwinfo adhoc2 assiclist | grep "ms ago" > /tmp/xcv
json_add_object "wifi"
json_add_object "$(cat /sys/class/net/adhoc2/address)"
json_add_object "neighbors"
foo=""
while IFS= read -r line <&3; do
  macx=$(echo -e "$line" | awk -F' ' '{print $1}')
  signalx=$(echo -e "$line" | awk -F' ' '{print $2}')
  noisex=$(echo -e "$line" | awk -F' ' '{print $5}') 
  inactivex=$(echo -e "$line" | awk -F' ' '{print $9}')
  foo="$foo $macx;$signalx;$noisex;$inactivex"         
done 3< "/tmp/xcv"                                     
for neigh in `echo $foo`; do                           
  json_add_object $(echo $neigh | awk -F';' '{ print $1 }')
  json_add_int "signal" $(echo $neigh | awk -F';' '{ print $2 }')
  json_add_int "noise" $(echo $neigh | awk -F';' '{ print $3 }') 
  json_add_int "inactive" $(echo $neigh | awk -F';' '{ print $4 }')
  json_close_object                                                     
done                                                                    
json_close_object                                                       
json_close_object                                                       
json_close_object 
MSG160=`json_dump`
echo $MSG160 | gzip > /tmp/160.gz
cat /tmp/160.gz | alfred -s 160
