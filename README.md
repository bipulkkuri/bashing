## BASH FUNCTIONS 
 
 Requires Bash 4+

# Strings

```
 upper(string)
 Converts all characters in the input string to uppercase.
 Example: upper "hello" -> "HELLO"

 lower(string)
 Converts all characters in the input string to lowercase.
 Example: lower "HELLO" -> "hello"

 capitalize(string)
 Capitalizes the first letter of the input string.
 Example: capitalize "hello world" -> "Hello world"

 title(string)
 Capitalizes the first letter of each word in the input string.
 Example: title "hello world" -> "Hello World"

 reverse(string)
 Reverses the input string.
 Example: reverse "hello" -> "olleh"

 reverseallcase(string)
 Reverses the case of all characters in the input string.
 Example: reverseallcase "Hello" -> "hELLO"

 stripall(string, pattern)
 Removes all instances of the specified pattern from the input string.
 Example: stripall "hello world" "l" -> "heo word"

 strip(string)
 Removes leading and trailing whitespace from the input string.
 Example: strip "  hello  " -> "hello"

 lstrip(string, pattern)
 Removes leading occurrences of the specified pattern from the input string.
 Example: lstrip "hello world" "he" -> "llo world"

 rstrip(string, pattern)
 Removes trailing occurrences of the specified pattern from the input string.
 Example: rstrip "hello world" "ld" -> "hello wor"

 startswith(string, prefix)
 Checks if the input string starts with the specified prefix. Returns "True" or "False".
 Example: startswith "hello" "he" -> "True"

 endswith(string, suffix)
 Checks if the input string ends with the specified suffix. Returns "True" or "False".
 Example: endswith "hello" "lo" -> "True"

 find(string, substring)
 Returns the lowest index of the substring in the input string, or -1 if not found.
 Example: find "hello world" "world" -> 6

 replace(string, old, new)
 Replaces all occurrences of the old substring with the new substring in the input string.
 Example: replace "hello world" "world" "bash" -> "hello bash"

 count(string, substring)
 Counts the occurrences of the substring in the input string.
 Example: count "hello hello" "hello" -> 2

 isalpha(string)
 Checks if all characters in the input string are alphabetic. Returns "True" or "False".
 Example: isalpha "hello" -> "True"

 isdigit(string)
 Checks if all characters in the input string are digits. Returns "True" or "False".
 Example: isdigit "12345" -> "True"

 isalnum(string)
 Checks if all characters in the input string are alphanumeric. Returns "True" or "False".
 Example: isalnum "hello123" -> "True"

 isspace(string)
 Checks if the input string contains only whitespace. Returns "True" or "False".
 Example: isspace "   " -> "True"

 islower(string)
 Checks if all characters in the input string are lowercase. Returns "True" or "False".
 Example: islower "hello" -> "True"

 isupper(string)
 Checks if all characters in the input string are uppercase. Returns "True" or "False".
 Example: isupper "HELLO" -> "True"

 split(string, separator)
 Splits the input string into an array using the specified separator.
 Example: split "hello,world" "," -> ["hello", "world"]

 rsplit(string, separator)
 Splits the input string from the right using the specified separator.
 Example: rsplit "hello,world,again" "," -> ["again", "world", "hello"]

 splitlines(string)
 Splits the input string at line breaks. (Currently not implemented)

 urlencode(string)
 Encodes the input string for use in a URL.
 Example: urlencode "hello world" -> "hello%20world"

 urldecode(string)
 Decodes a URL-encoded string.
 Example: urldecode "hello%20world" -> "hello world"
```


# Collections

```
  set()
    - Description: Creates a unique set of input arguments by removing duplicates.
    - Parameters: Accepts a list of strings as arguments.
    - Output: Prints the unique set of input arguments as a space-separated string.

  random()
    - Description: Selects a random element from the provided input arguments.
    - Parameters: Accepts a list of strings as arguments.
    - Output: Prints a randomly selected element from the input arguments.

  rrayreverse()
    - Description: Reverses the order of the input arguments.
    - Parameters: Accepts a list of strings as arguments.
    - Output: Prints the reversed list of input arguments as a space-separated string.
```

# Install

```
curl -fsSL https://raw.githubusercontent.com/bipulkkuri/bashing/main/install.sh | sudo bash
```

# UnInstall

```
curl -fsSL https://raw.githubusercontent.com/bipulkkuri/bashing/main/uninstall.sh | sudo bash
```

# Sample run 
```
bash ./examples/string_example.sh 
```
