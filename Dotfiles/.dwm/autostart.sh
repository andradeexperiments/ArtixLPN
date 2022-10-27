#!/bin/bash

dwmblocks &
sxhkd -c $HOME/.config/dwm-sxhkd/dwm-sxhkdrc &
dunst &
numlockx &
#picom --config $HOME/.config/picom/picom.sample.conf --experimental-backends &
nitrogen --restore &
