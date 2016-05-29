#!/bin/sh
# for some panel?
lang=$(xkblayout-state print "%c")

if [[ $lang == "1" ]]; then
	echo "bg"
else 
	echo "en"
fi
