# BASH FUNCTIONS 
 
Some reusable string and collection functions in pure bash. Requires Bash 4+.

Scripte are grouped in following sets as per their operations
- Strings operations
- Collections ,set array operations

## Documentation

- Strings [`string`](https://github.com/bipulkkuri/bashing/blob/main/string.sh#L7-L105).
- Collections [`collection`](https://github.com/bipulkkuri/bashing/blob/main/collection.sh#L7-L20).

## Install

```
curl -fsSL https://raw.githubusercontent.com/bipulkkuri/bashing/main/install.sh | sudo bash
```

## UnInstall

```
curl -fsSL https://raw.githubusercontent.com/bipulkkuri/bashing/main/uninstall.sh | sudo bash
```

## Sample examples 
```
examples/string_example.sh 
examples/collection_example.sh
```

## How to include these functions in your scripts after install

test.sh
```
#!/bin/bash
source string

str="Hello world"
echo  ""
reverseallcase "$str"
```

Run 
```
$bash ./test.sh 
hELLO WORLD

```

## Extending 

More functions can be added 
add your script.sh file reference in `SCRIPT_NAMES=("string" "collection")` in install.sh and uninstall.sh


# Contributing

Feel free to fork and extend.


# License
This project is licensed under the [MIT License][License].

[License]: ./LICENSE