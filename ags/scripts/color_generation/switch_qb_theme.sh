#!/usr/bin/env bash

notify-send "Test"
COLORMODE_FILE="$HOME/.cache/ags/user/colormode.txt"
COLORMODE=$(sed -n '1p' "$COLORMODE_FILE")
QB_THEME="$HOME/.config/qutebrowser/qutebrowser-themes/themes/onedark.py"


if [ "$COLORMODE" == "light" ];then
  sed -i \
    -e 's/#1f2224/#e2e4e5/g' \
    -e 's/#222729/#d3d6d8/g' \
    -e 's/#121414/#bfc2c5/g' \
    -e 's/#565c64/#a0a4a8/g' \
    -e 's/#abb2bf/#40474d/g' \
    -e 's/#c8ccd4/#f1f2f3/g' \
    -e 's/#e06c75/#e57373/g' \
    -e 's/#e5c07b/#f9db9e/g' \
    -e 's/#98c379/#4F7CA4/g' \
    -e 's/#56b6c2/#88d8d8/g' \
    -e 's/#61afef/#a0c4ef/g' \
    -e 's/#c678dd/#d7a9e3/g' \
    "$QB_THEME"
elif [ "$COLORMODE" == "dark" ];then
  sed -i \
    -e 's/#e2e4e5/#1f2224/g' \
    -e 's/#d3d6d8/#222729/g' \
    -e 's/#bfc2c5/#121414/g' \
    -e 's/#a0a4a8/#565c64/g' \
    -e 's/#40474d/#abb2bf/g' \
    -e 's/#f1f2f3/#c8ccd4/g' \
    -e 's/#e57373/#e06c75/g' \
    -e 's/#f9db9e/#e5c07b/g' \
    -e 's/#4F7CA4/#98c379/g' \
    -e 's/#88d8d8/#56b6c2/g' \
    -e 's/#a0c4ef/#61afef/g' \
    -e 's/#d7a9e3/#c678dd/g' \
    "$QB_THEME"
fi
