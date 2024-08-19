#!/usr/bin/env bash

list=$(nmcli --fields "SECURITY,SSID" device wifi list | sed 1d | sed 's/  */ /g' | sed -E "s/WPA*.?\S/ /g" | sed "s/^--/ /g" | sed "s/  //g" | sed "/--/d")

connected=$(nmcli -fields WIFI g)
if [[ "$connected" =~ "enabled" ]]; then
	toggle="󰖪  Disable Wi-Fi"
elif [[ "$connected" =~ "disabled" ]]; then
	toggle="󰖩  Enable Wi-Fi"
fi

chosen_network=$(echo -e "$toggle\n$list" | uniq -u | rofi -dmenu -config ~/NixConfig/rofi/wifi.rasi -p "Wi-Fi SSID: " )
read -r chosen_id <<< "${chosen_network:3}"

if [ "$chosen_network" = "" ]; then
	exit
elif [ "$chosen_network" = "󰖩  Enable Wi-Fi" ]; then
	nmcli radio wifi on
elif [ "$chosen_network" = "󰖪  Disable Wi-Fi" ]; then
	nmcli radio wifi off
else
  	success_message="$chosen_id"
	saved_connections=$(nmcli -g NAME connection)
	if [[ $(echo "$saved_connections" | grep -w "$chosen_id") = "$chosen_id" ]]; then
		nmcli connection up id "$chosen_id" | grep "successfully" && dunstify "WIFI" "Connected to $success_message" -i network-wireless
	else
		if [[ "$chosen_network" =~ "" ]]; then
			wifi_password=$(rofi -dmenu -config ~/NixConfig/rofi/pass.rasi -p "Password: " )
		fi
		nmcli device wifi connect "$chosen_id" password "$wifi_password" | grep "successfully" && dunstify  "WIFI" "Connected to $success_message" -i network-wireless
    fi
fi
