
# Requires Bash 4+

# Function Descriptions:
# ----------------------

# upper(string)
# Converts all characters in the input string to uppercase.
# Example: upper "hello" -> "HELLO"

# lower(string)
# Converts all characters in the input string to lowercase.
# Example: lower "HELLO" -> "hello"

# capitalize(string)
# Capitalizes the first letter of the input string.
# Example: capitalize "hello world" -> "Hello world"

# title(string)
# Capitalizes the first letter of each word in the input string.
# Example: title "hello world" -> "Hello World"

# reverse(string)
# Reverses the input string.
# Example: reverse "hello" -> "olleh"

# reverseallcase(string)
# Reverses the case of all characters in the input string.
# Example: reverseallcase "Hello" -> "hELLO"

# stripall(string, pattern)
# Removes all instances of the specified pattern from the input string.
# Example: stripall "hello world" "l" -> "heo word"

# strip(string)
# Removes leading and trailing whitespace from the input string.
# Example: strip "  hello  " -> "hello"

# lstrip(string, pattern)
# Removes leading occurrences of the specified pattern from the input string.
# Example: lstrip "hello world" "he" -> "llo world"

# rstrip(string, pattern)
# Removes trailing occurrences of the specified pattern from the input string.
# Example: rstrip "hello world" "ld" -> "hello wor"

# startswith(string, prefix)
# Checks if the input string starts with the specified prefix. Returns "True" or "False".
# Example: startswith "hello" "he" -> "True"

# endswith(string, suffix)
# Checks if the input string ends with the specified suffix. Returns "True" or "False".
# Example: endswith "hello" "lo" -> "True"

# find(string, substring)
# Returns the lowest index of the substring in the input string, or -1 if not found.
# Example: find "hello world" "world" -> 6

# replace(string, old, new)
# Replaces all occurrences of the old substring with the new substring in the input string.
# Example: replace "hello world" "world" "bash" -> "hello bash"

# count(string, substring)
# Counts the occurrences of the substring in the input string.
# Example: count "hello hello" "hello" -> 2

# isalpha(string)
# Checks if all characters in the input string are alphabetic. Returns "True" or "False".
# Example: isalpha "hello" -> "True"

# isdigit(string)
# Checks if all characters in the input string are digits. Returns "True" or "False".
# Example: isdigit "12345" -> "True"

# isalnum(string)
# Checks if all characters in the input string are alphanumeric. Returns "True" or "False".
# Example: isalnum "hello123" -> "True"

# isspace(string)
# Checks if the input string contains only whitespace. Returns "True" or "False".
# Example: isspace "   " -> "True"

# islower(string)
# Checks if all characters in the input string are lowercase. Returns "True" or "False".
# Example: islower "hello" -> "True"

# isupper(string)
# Checks if all characters in the input string are uppercase. Returns "True" or "False".
# Example: isupper "HELLO" -> "True"

# split(string, separator)
# Splits the input string into an array using the specified separator.
# Example: split "hello,world" "," -> ["hello", "world"]

# rsplit(string, separator)
# Splits the input string from the right using the specified separator.
# Example: rsplit "hello,world,again" "," -> ["again", "world", "hello"]

# splitlines(string)
# Splits the input string at line breaks. (Currently not implemented)

# urlencode(string)
# Encodes the input string for use in a URL.
# Example: urlencode "hello world" -> "hello%20world"

# urldecode(string)
# Decodes a URL-encoded string.
# Example: urldecode "hello%20world" -> "hello world"

# Converts all characters to uppercase. bash 4+
upper() {
	printf '%s'"${1^^}"
}

# Converts all characters to lowercase. bash 4+
lower() {
	printf '%s' "${1,,}"
}

# Capitalizes the first letter.
capitalize() {
	local input="$1"
	local first_char="${input:0:1}"
	local rest="${input:1}"
	echo -n "${first_char^^}${rest,,}"
}

# Capitalizes the first letter of each word.
title() {
	capitalized=$(echo "$1" | while read -a words; do
		for word in "${words[@]}"; do
			echo -n "${word^} "
		done
	done)
	printf '%s' "$capitalized"

}

# reverse a string
reverse() {
	local input="$1"
	local output=""
	local i
	for ((i = ${#input} - 1; i >= 0; i--)); do
		output+="${input:i:1}"
	done
	printf '%s' "$output"
}

# reverse all cases
reverseallcase() {
	local input="$1"
	local flipped=""

	for ((i = 0; i < ${#input}; i++)); do
		char="${input:$i:1}"
		if [[ "$char" =~ [A-Z] ]]; then
			flipped+="${char,}" # Convert to lowercase
		elif [[ "$char" =~ [a-z] ]]; then
			flipped+="${char^}" # Convert to uppercase
		else
			flipped+="$char" # Leave non-letters unchanged
		fi
	done

	printf '%s' "$flipped"

}

# Strip all instances of pattern from string
stripall() {
	printf '%s' "${1//$2/}"
}

# Removes leading/trailing whitespace.
strip() {
	local input="$1"
	# Remove leading and trailing whitespace using parameter expansion and regex
	input="${input#"${input%%[![:space:]]*}"}" # remove leading whitespace
	input="${input%"${input##*[![:space:]]}"}" # remove trailing whitespace
	printf '%s' "$input"
}

# Removes leading whitespace.
lstrip() {
	printf '%s' "${1##$2}"
}

# Removes trailing whitespace.
rstrip() {
	printf '%s' "${1%%$2}"
}

# String starts with substring True or False
startswith() {
	local string="$1"
	local prefix="$2"

	if [[ "$string" == "$prefix"* ]]; then
		printf '%s' "True"
	else
		printf '%s' "False"
	fi
}

# String ends  with substring True or False
endswith() {
	local input="$1"
	local sub_string="$2"
	if [[ "$input" == *"$sub_string" ]]; then
		printf '%s' "True"
	else
		printf '%s' "False"
	fi
}

# Returns the lowest index of the substring or -1 if not found.
find() {
	local string="$1"
	local substr="$2"

	local rest="${string%%"$substr"*}"

	if [[ "$string" == *"$substr"* ]]; then
		printf '%s' "${#rest}"
	else
		printf '%s' "-1"
	fi
}

# Replaces occurrences of a substring. replace(old, new)
replace() {
	local string="$1"
	local old="$2"
	local new="$3"

	# Use Bash string replacement (replace all occurrences)
	printf '%s' "${string//"$old"/"$new"}"
}

# Counts occurrences of a substring.
count() {
	local string="$1"
	local substr="$2"
	local count=0
	local temp="$string"

	while [[ "$temp" == *"$substr"* ]]; do
		temp="${temp#*"$substr"}"
		((count++))
	done

	printf '%s' "$count"
}

# Checks if all characters are alphabetic.
isalpha() {
	local input="$1"

	if [[ "$input" =~ ^[A-Za-z[:space:]]+$ ]]; then
		printf '%s' "True"
	else
		printf '%s' "False"
	fi
}

# Checks if all characters are digits.
isdigit() {
	local input="$1"

	if [[ "$input" =~ ^[0-9]+$ ]]; then
		printf '%s' "True"
	else
		printf '%s' "False"
	fi
}

# Checks if all characters are alphanumeric.
isalnum() {
	local input="$1"

	if [[ "$input" =~ ^[A-Za-z0-9]+$ ]]; then
		printf '%s' "True"
	else
		printf '%s' "False"
	fi
}

# Checks if the string contains only whitespace.
isspace() {
	local input="$1"

	if [[ "$input" =~ ^[[:space:]]+$ ]]; then
		printf '%s' "True"
	else
		printf '%s' "False"
	fi
}

# Checks if all characters are lowercase.
islower() {
	local input="$1"

	if [[ "$input" =~ ^[a-z[:space:]]+$ ]]; then
		printf '%s' "True"
	else
		printf '%s' "False"
	fi
}

# Checks if all characters are uppercase.
isupper() {
	local input="$1"

	if [[ "$input" =~ ^[A-Z[:space:]]+$ ]]; then
		echo "True"
	else
		echo "False"
	fi
}

# Splits the string into a array. split string sep
split() {
	local string="$1"
	local sep="$2"

	IFS="$sep" read -r -a array <<<"$string"

	IFS="$sep" read -r -a results <<<"$string"

}

# Splits from the right. rsplit(sep)
rsplit() {
	local string="$1"
	local sep="$2"

	# Reverse the string and separator
	local reversed_string=$(echo "$string" | rev)
	local reversed_sep=$(echo "$sep" | rev)

	# Split the reversed string
	IFS="$reversed_sep" read -r -a reversed_array <<<"$reversed_string"

	# Reverse the array back and print it
	for ((i = ${#reversed_array[@]} - 1; i >= 0; i--)); do
		echo -n "${reversed_array[$i]} "
	done
	echo
}

# Splits at line breaks.
splitlines() {
	printf ""
}

urlencode() {
	# Usage: urlencode "string"
	local LC_ALL=C
	for ((i = 0; i < ${#1}; i++)); do
		: "${1:i:1}"
		case "$_" in
		[a-zA-Z0-9.~_-])
			printf '%s' "$_"
			;;

		*)
			printf '%%%02X' "'$_"
			;;
		esac
	done
	printf '\n'
}

# decode a string
urldecode() {
	: "${1//+/ }"
	printf '%b' "${_//%/\\x}"
}