#!/bin/bash



SEND_TITLE="Clash配置更新"
SEND_MESSAGE="$HK_PROXY \n更新完成。"


sed -i '/proxies:/a\'"${HK_PROXY}"'' proxy_temp.yaml
cat proxy_temp.yaml config_rule.yaml >clash.yaml



echo "发送通知！"
curl -s "$SEND_SERVER/message?token=$SEND_TOKEN" -F "title=$SEND_TITLE" -F "message=$SEND_MESSAGE" -F "priority=5"



echo "同步配置"
mkdir -p ~/.config/rclone/

wget https://github.com/rclone/rclone/releases/download/v1.64.2/rclone-v1.64.2-linux-amd64.rpm
rpm -ih  rclone-v1.64.2-linux-amd64.rpm
envsubst < ../rclone.conf > ~/.config/rclone/rclone.conf 
rclone copy clash.yaml rclone:ops-software:/temp
