#!/bin/bash

thumb_button_id="-1"
key="KEY_LEFTMETA"
event_type=EV_KEY
action_type=KEYBOARD_KEY
pressed="pressed"
devices=$(libinput list-devices | grep MX -A1 |grep event | awk '{print $2}')
count=0


function mapDevice(){
	device=$1
	while read line; do
		action=$(echo "${line}" |awk '{print $2}')
		button=$(echo "${line}" |awk '{print $5}')
		movement=$(echo "${line}" |awk '{print $6}')
		if [ ${action} = ${action_type} ] && [ ${button} = "(${thumb_button_id})" ]; then
			count=$(($count +1))
			if [ ${count} = 3 ]; then
				echo "press key ${key}"
				evemu-event ${devices} --sync --type ${event_type} --code ${key} --value 1;
				sleep 0.01
	                        evemu-event ${devices} --sync --type ${event_type} --code ${key} --value 0;
				count=0
			fi
		fi
	done < <(stdbuf -oL libinput debug-events --device ${device} & )
}

for device in ${devices[@]}; do
    ( mapDevice ${device} ) &
done

wait

