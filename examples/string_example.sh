#!/bin/bash

# include class header
source ./string.sh
 
str="hello world"

upper "$str"

echo  ""

lower "$str"

echo  ""

capitalize "$str"

echo  ""
echo  "Tile "
title "$str"

echo  ""
reverse "$str"

str="Hello world"
echo  ""
reverseallcase "$str"
str="hello world"

echo  ""
stripall "$str" " "


echo  ""
strip "$str"  


echo  ""
lstrip "$str"  

echo  ""
rstrip "$str"  

echo  ""
startswith "$str" "hello" 

echo  ""
endswith "$str" "world"

echo  ""
find "$str" "world"

echo  ""
replace "$str" "world" "shell"

echo  ""
count "$str"  "world"

echo  "" 
isalpha "$str"   


echo  ""
isdigit "$str"  

str="1234"
echo  "is num "
isalnum "$str"  

str="hello world"
echo  "isspace $str"
isspace "$str"  
str="\n\t\r"
echo  "isspace $str"

str="hello world"
echo  ""
islower "$str"  

str="HELLO WORLD"
echo  ""
isupper "$str"  

declare -a results
str="tom,dick,harry"
echo  ""
split "$str" ","
echo "${results[@]}" ""


echo $(rsplit "$str" ",")


str="https://github.com/bipulkkuri/"
encoded=$(urlencode $str)
echo "Encoded: $encoded"

urldecode "$encoded"
