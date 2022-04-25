#!/bin/bash

wifi_status=$(rfkill list wifi | head -n 3 | grep "Soft" | cut -d " " -f 3)
bluetooth_status=$(rfkill list bluetooth | head -n 3 | grep "Soft" | cut -d " " -f 3)

icon_dir=/usr/share/icons/Adwaita/scalable/status

if [ "$wifi_status" == 'no' ] || [ "$bluetooth_status" == 'no' ]; then
    rfkill block all
    notify-send -i $icon_dir/airplane-mode-symbolic.svg --hint int:transient:1 "Airplane mode turned on"
else
    rfkill unblock all
    notify-send -i $icon_dir/network-wireless-signal-excellent-symbolic.svg --hint int:transient:1 "Airplane mode turned off"
fi
