#!/bin/bash
#connects a device the to wifi
#make sure you are connected to the same network!!
echo "devices"
adb devices
echo "device ip"
ip=$(adb shell ip route | awk '{print $9}')
echo $ip
echo "kill-server"
adb kill-server
wait
echo "start-server"
adb start-server
wait
echo "reverse tcp:8081 tcp:8081" #needed for development only - in case you run a server such as the react-native packager 
adb reverse tcp:8081 tcp:8081
wait
echo "tcpip 5556"
adb tcpip 5555
wait
echo "connect ${ip}:5556"
adb connect ${ip}:5555
wait
echo "devices:"
adb devices

