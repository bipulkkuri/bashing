#!/bin/bash
#
# This script provides utility functions for working with arrays and strings in Bash.
#
# Functions:
#
# 1. set()
#    - Description: Creates a unique set of input arguments by removing duplicates.
#    - Parameters: Accepts a list of strings as arguments.
#    - Output: Prints the unique set of input arguments as a space-separated string.
#
# 2. random()
#    - Description: Selects a random element from the provided input arguments.
#    - Parameters: Accepts a list of strings as arguments.
#    - Output: Prints a randomly selected element from the input arguments.
#
# 3. arrayreverse()
#    - Description: Reverses the order of the input arguments.
#    - Parameters: Accepts a list of strings as arguments.
#    - Output: Prints the reversed list of input arguments as a space-separated string.

set() {
	declare -A tmp_array
	for i in "$@"; do
        	[[ $i ]] && IFS=" " tmp_array["${i:- }"]=1
    	done
	printf '%s' "${!tmp_array[@]}"
}


random() {
    local arr=("$@")
    printf '%s' "${arr[RANDOM % $#]}"
}

arrayreverse() {
    local original=("$@")
    local reversed=()
    for (( i=${#original[@]}-1 ; i>=0 ; i-- )); do
        reversed+=("${original[i]} ")
    done
    printf '%s' "${reversed[@]}"
}
