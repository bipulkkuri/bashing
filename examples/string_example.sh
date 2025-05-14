#!/bin/bash

# include class header
source ./string.sh
 
str="hello world"

myline(){ 
echo ""
echo "---------------"
echo ""

}

echo "to upper  $str"
upper "$str"
myline
echo "to lower $str"
lower "$str"
myline

echo "to capitalize first letter $str"
capitalize "$str"
myline


echo  "Tile $str"
title "$str"
myline


echo "reverse $str"
reverse "$str"
myline



echo "reverseallcase $str"
str="Hello world"
reverseallcase "$str"
myline

str="hello world"
echo "strip all char param from $str"
stripall "$str" " "
myline


echo "strip whitespace $str"
strip "$str"  
myline


echo "Left strip whitespace $str"
lstrip "$str" 
myline 

 
echo "Right strip whitespace $str"
rstrip "$str"  
myline

 
echo "startswith hello $str"
startswith "$str" "hello" 
myline

echo "endswith world in $str"
endswith "$str" "world"
myline

echo "find world in $str" 
find "$str" "world"
myline

echo "replace world with shell in $str" 
replace "$str" "world" "shell"
myline

str="hello world world"
echo "count occurances of world in  $str"
count "$str"  "world"
myline

str="hello world"
echo "isalpha $str" 
isalpha "$str"   
myline

echo "isdigit $str"
isdigit "$str"  
myline

str="1234"
echo  "is num "
isalnum "$str"  
myline

str="hello world"
echo  "isspace $str"
isspace "$str"  
str="\n\t\r"
echo  "isspace $str"
myline

str="hello world"
echo "islower $str"
islower "$str"  
myline

str="HELLO WORLD"
echo "isupper $str"
isupper "$str"  
myline

declare -a results
str="tom,dick,harry"
echo "split in array $str"
split "$str" ","
echo "${results[@]}" ""
myline

echo "reverse split in array $str"
echo $(rsplit "$str" ",")
myline

str="https://github.com/bipulkkuri/"
echo "Encode: $str"
encoded=$(urlencode $str)
echo "Encoded: $str"
myline

echo "deccoded: $encoded"
urldecode "$encoded"
myline