#!/bin/bash
while true
do
  cpu_temp_command=$(cat /sys/class/thermal/thermal_zone0/temp)
  cpu_temp1=$(($cpu_temp_command/1000))
  cpu_temp2=$(($cpu_temp_command/100))
  cpu_temp_display=$(($cpu_temp2 %$cpu_temp1))
  clear
  echo -e "\e[95m:::::::::::\e[96mTHERMAL MONITOR\\e[95m:::::::::::"
  echo ""
  echo -e "\e[0m\e[94mCPU \e[0mtemp=$cpu_temp1.$cpu_temp_display'C"
  echo -e "\e[32mGPU \e[0m$(/opt/vc/bin/vcgencmd measure_temp)"
  echo ""
  echo -e "\e[91mCtrl\e[32m+\e[91mC\e[0m to exit..."
  echo -e "\e[95m:::::::::::::::::::::::::::::::::::::"
  sleep 1
done
