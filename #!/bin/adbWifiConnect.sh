#!/bin/bash
#connects
adb devices
ip=$(adb shell ip route | awk '{print $9}')
echo $ip
echo "kill-server"
adb kill-server
wait
echo "start-server"
adb start-server
wait
echo "tcpip 5556"
adb tcpip 5555
wait
echo "reverse tcp:8081 tcp:8081"
adb reverse tcp:8081 tcp:8081
wait
echo "connect ${ip}:5556"
adb connect ${ip}:5555
wait
echo "devices:"
adb devices
