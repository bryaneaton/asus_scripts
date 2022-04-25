#! /usr/bin/env bash


device=DC:2C:26:F5:E3:74

bluetoothctl trust $device
bluetoothctl disconnect $device
bluetoothctl connect $device


