#!/bin/bash

sed -i '/proxies:/a\'"${HK_PROXY}"'' proxy_temp.yaml

#sed -i "s#SED_HK_PROXY_NAME#${HK_PROXY_NAME}#g" proxy_temp.yaml
#sed -i "s#SED_HK_PROXY_SERVER#${HK_PROXY_SERVER}#g" proxy_temp.yaml
#sed -i "s#SED_HK_PROXY_SECRETS#${HK_PROXY_SECRETS}#g" proxy_temp.yaml
cat proxy_temp.yaml config_rule.yaml >clash.yaml
cat clash.yaml
