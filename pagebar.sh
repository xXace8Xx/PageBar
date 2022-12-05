#!/usr/bin/bash

# pagebar - Dwm bar, with pages.
# github <https://github.com/Randomguy-8/PageBar>


VERSION=2022.11.10

HERE="$(dirname "$0")"
PAGEBAR_LOC="$(readlink -f "$HERE")"

TMP_DATA="/dev/shm" # use /dev/shm for fast r/w speed
#TMP_DATA="/Tmp"
unset page_name


# Pages
Page_Name+=("${PAGEBAR_LOC}/pages/page_main")
Page_Name+=("${PAGEBAR_LOC}/pages/page_clock")
Page_Name+=("${PAGEBAR_LOC}/pages/page_cpu")
Page_Name+=("${PAGEBAR_LOC}/pages/page_wifi")
Page_Name+=("${PAGEBAR_LOC}/pages/page_battery")
Page_Name+=("${PAGEBAR_LOC}/pages/page_memory")


# Arguments Handler
arg_(){
	for i in "$@"; do
	case "$i" in
		"-n"|"-p"|"-r")
			PageNum="$(cat "${TMP_DATA}/Pagebar/pagenum" 2>/dev/null)"

			case "$i" in
				"-n")	PageNum="$((PageNum+1))";;
				"-p")	PageNum="$((PageNum-1))";;
				  * )	PageNum="$PageNum"	;; # Refresh
			esac

			if [[ "$PageNum" -ge "${#Page_Name[@]}" ]]; then
				PageNum=0
			elif [[ "$PageNum" -lt 0 ]]; then
				PageNum="$((${#Page_Name[@]}-1))"
			fi


			if [[ -e "${Page_Name[$PageNum]}" ]]; then
				cp "${Page_Name[$PageNum]}" "${TMP_DATA}/Pagebar/nextpage" && \
				printf "$PageNum" >"${TMP_DATA}/Pagebar/pagenum"

				echo "${Page_Name[$PageNum]}"
			else
				printf "Pagebar: page \"${Page_Name[$PageNum]}\" not found\n" 1>&2
			fi

			# xsetroot -name "${Page_Name[$PageNum]}"; sleep 0.5
			;;
		"-h"|"--help")
			printf "usage: ${0} {page-file} [-h]  [-r refresh] [-p previous | -n next]\n"
			;;
		*)
			## Error Handler
			if [[ ! -e "$i" ]]; then
				if [[ "$i" == "-"* ]]; then
					printf "pagebar: \"%s\" Invalid Option\n" "$i" 1>&2
				else
					printf "pagebar: \"%s\" page not found\n" "$i" 1>&2
				fi
				exit 2
			fi
			cp "$i" "${TMP_DATA}/Pagebar/nextpage" 2>/dev/null
			;;

	esac
	done
	exit 0 ## Exit successfully
}

# Skips the execution of a function for N(<60) number of loops.
func_skip_(){ # $1=skips | $2=function
	if [[ $1 -eq 0 ]]; then
		$2 "$3" ## Function with Arguments
	elif [[ "$((LOOP_COUNT % $1))" -eq 0 ]]; then
		$2 "$3"
	fi
}

clean_(){
	rm -d -R "${TMP_DATA}/Pagebar" 2>/dev/null
	mkdir -p "${TMP_DATA}/Pagebar"
	cp "${Page_Name[0]}" "${TMP_DATA}/Pagebar/nextpage" 2>/dev/null
}

main_(){
	# Modules
	. "${PAGEBAR_LOC}/modules/module_cpu"
	. "${PAGEBAR_LOC}/modules/module_memory"
	. "${PAGEBAR_LOC}/modules/module_battery"
	. "${PAGEBAR_LOC}/modules/module_clock"
	. "${PAGEBAR_LOC}/modules/module_wifi"
	. "${PAGEBAR_LOC}/modules/module_volume"
	. "${PAGEBAR_LOC}/modules/module_brightness"
	. "${PAGEBAR_LOC}/modules/module_uptime"
	. "${PAGEBAR_LOC}/modules/module_updates"
	. "${PAGEBAR_LOC}/modules/module_storage"
	. "${PAGEBAR_LOC}/modules/module_keyboard"
	#. "$PAGEBAR_LOC/modules/module_weather"


	while true; do
			[[ "$LOOP_COUNT" -eq 61 ]] && LOOP_COUNT=1
			unset Status

			for (( i=0; i<${Update:-"4"}; i++ )); do
				if [[ -e "${TMP_DATA}/Pagebar/nextpage" ]]; then
					unset Update LOOP_COUNT functions_ page_
					mv "${TMP_DATA}/Pagebar/nextpage" "${TMP_DATA}/Pagebar/page"
					. "${TMP_DATA}/Pagebar/page"
					. "${PAGEBAR_LOC}/actions"
					break
				else
					sleep 0.5
				fi
			done

			functions_
			page_

			action_
			xsetroot -name "$Status"

			LOOP_COUNT="$((LOOP_COUNT+1))"
	done
}


[[ $# -ne 0 ]] && arg_ "$@"	## Arguments handler
clean_				## Clean data of previous session

main_ "$@"
