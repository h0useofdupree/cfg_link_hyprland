#!/usr/bin/env bash

# TODO: Make this toggle persist reloads

STATE=$(hyprctl getoption master:always_center_master)

if echo "$STATE" | grep -qw "int: 1"; then
    hyprctl keyword master:always_center_master false
else
    hyprctl keyword master:always_center_master true
fi
