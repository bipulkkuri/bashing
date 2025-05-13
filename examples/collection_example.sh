#!/bin/bash

source ./collection.sh

echo  "SET"
set 1 1 2 2 3 3 3 3 3 4 4 4 4 4 5 5 5 5 5 5
echo  ""
echo  "Random"
ar=(tom dick harry nathan brown)
random "${ar[@]}"
echo  ""
random 1 2 3 4 5 6 7 8 9 10

echo  "Reverse"
ar=(red green blue yellow brown)
arrayreverse "${ar[@]}"