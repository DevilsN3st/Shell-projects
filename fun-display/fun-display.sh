#!/bin/bash

clear

while true; do
	typed=""
	while true; do
		IFS="" read -rsn1 char 

		if [[ "$char" == $'\x7f' ]]; then
			typed="${typed%?}"
		elif [[ "$char" == '' ]]; then
			break
		else
			typed="$typed$char" 
		fi

		cols=$(tput cols)

		if ((${#typed} > cols)); then
			typed="${typed:${#typed}-cols:${#typed}}"
		fi

		clear 

		cols=$(tput cols)
		rows=$(tput lines)

		col_pos=$(((cols - ${#typed}) / 2))
		row_pos=$((rows / 2))

		tput cup $row_pos $col_pos
		echo -n "$typed"

	done

	clear
done
