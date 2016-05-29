#!/bin/bash
vol(){
  vol=$(amixer get 'Master' | grep Mono: | sed 's/ *Mono: .* \[\([^ ]*\)\] \[[^ ]*\] \[\([^ ]*\)\]/\1 \2/;s/.*off/off/;s/\([^ ]*\).*/\1/')
	echo $vol
}

vol
