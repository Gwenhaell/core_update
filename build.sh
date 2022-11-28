#!/bin/sh

versionCode=$(cat module.prop | grep 'versionCode=' | awk -F '=' '{print $2}')
let versionCode++
sed -i "s/versionCode=[0-9]*/versionCode=$versionCode/g" module.prop
sed -i "s/\"versionCode\": [0-9]*/\"versionCode\": $versionCode/g" update.json

zip -r -o -X -ll core_update.zip ./ -x '.git/*' -x 'build.sh' -x '.github/*' -x 'update.json'
