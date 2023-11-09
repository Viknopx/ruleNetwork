#!/bin/bash



SEND_TITLE="Clash配置更新"
SEND_MESSAGE="$HK_PROXY \n更新完成。"


sed -i '/proxies:/a\'"${HK_PROXY}"'' proxy_temp.yaml
cat proxy_temp.yaml config_rule.yaml >clash.yaml



echo "发送通知！"
curl "$SEND_SERVER/message?token=$SEND_TOKEN" -F "title=$SEND_TITLE" -F "message=$SEND_MESSAGE" -F "priority=5"



echo "同步配置"
apt install rclone -y
envsubst < ../rclone.conf > ~/.config/rclone/rclone.conf 
rclone copy clash.yaml rclone:ops-software:/temp
