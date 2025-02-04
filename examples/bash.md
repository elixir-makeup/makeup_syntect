## Bash Code Example

```bourne_again_shell_bash
#!/bin/bash

# Demo script showcasing various Bash features
set -euo pipefail  # Strict mode

# Variables and string manipulation
NAME="Bash Demo"
VERSION=1.0
CURRENT_DATE=$(date +%Y-%m-%d)
declare -A HASH_MAP=([key1]="value1" [key2]="value2")
declare -a ARRAY=(1 2 3 4 5)

# Functions
function print_header() {
    local title="$1"
    echo "=== ${title} ==="
}

# Error handling function
error_handler() {
    local line_num=$1
    echo "Error occurred in script at line: ${line_num}"
}

trap 'error_handler ${LINENO}' ERR

# Demonstrate string operations
print_header "String Operations"
STRING="Hello, World!"
echo "Original: ${STRING}"
echo "Length: ${#STRING}"
echo "Substring: ${STRING:0:5}"
echo "Uppercase: ${STRING^^}"
echo "Lowercase: ${STRING,,}"

# Arithmetic operations
print_header "Arithmetic"
A=5
B=3
echo "$A + $B = $((A + B))"
echo "$A * $B = $((A * B))"
echo "Power: $((A ** 2))"

# Control structures
print_header "Control Structures"

# If-else
if [[ $A -gt $B ]]; then
    echo "$A is greater than $B"
elif [[ $A -eq $B ]]; then
    echo "$A equals $B"
else
    echo "$A is less than $B"
fi

# Case statement
FRUIT="apple"
case $FRUIT in
    "apple")
        echo "Selected fruit is apple"
        ;;
    "banana"|"orange")
        echo "Selected fruit is banana or orange"
        ;;
    *)
        echo "Unknown fruit"
        ;;
esac

# Loops
print_header "Loops"

# For loop
for i in "${ARRAY[@]}"; do
    echo "Array element: $i"
done

# While loop with counter
counter=0
while [[ $counter -lt 3 ]]; do
    echo "Counter: $counter"
    ((counter++))
done

# Until loop
until [[ $counter -eq 0 ]]; do
    echo "Counting down: $counter"
    ((counter--))
done

# File operations
print_header "File Operations"
TEST_FILE="/tmp/test.txt"

# Write to file
cat << EOF > "$TEST_FILE"
Line 1
Line 2
Line 3
EOF

# Read from file
while IFS= read -r line; do
    echo "Read: $line"
done < "$TEST_FILE"

# Parameter expansion
print_header "Parameter Expansion"
UNSET_VAR=""
echo "Default value: ${UNSET_VAR:-default}"
echo "Alternate value: ${NAME:+alternate}"
echo "Substring removal: ${STRING#Hello,}"
echo "Pattern matching: ${STRING/World/Bash}"

# Process substitution and command substitution
print_header "Process & Command Substitution"
echo "Files in current directory: $(ls | wc -l)"
diff <(sort "$TEST_FILE") <(sort -r "$TEST_FILE")

# Associative array operations
print_header "Associative Array"
for key in "${!HASH_MAP[@]}"; do
    echo "Key: $key, Value: ${HASH_MAP[$key]}"
done

# Cleanup
rm -f "$TEST_FILE"

# Exit status
print_header "Exit Status"
true
echo "Last command status: $?"
false || echo "Command failed but script continues"

# Here document with parameter expansion
print_header "Here Document"
cat << EOT
Script: $NAME
Version: $VERSION
Date: $CURRENT_DATE
EOT

exit 0
```