#!/bin/bash
source string

str="Hello world"
echo  ""
reverseallcase "$str"

echo  ""
str=" Hello world "
lstrip "$str"

echo  ""
rstrip "$str" 
