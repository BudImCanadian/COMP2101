#!/bin/bash
#
# this script demonstrates doing arithmetic

# Task 1: Remove the assignments of numbers to the first and second number variables. Use one or more read commands to get 3 numbers from the user.
# Task 2: Change the output to only show:
#    the sum of the 3 numbers with a label
#    the product of the 3 numbers with a label
read -p 'First Number: ' firstnum
read -p 'Second Number: ' secondnum
read -p 'Third Number: ' thirdnum
sum=$((firstnum + secondnum + thirdnum))
dividend=$((firstnum / secondnum / thirdnum))
fpdividend=$(awk "BEGIN{printf \"%.2f\", $firstnum/$secondnum/$thirdnum}")
multi=$((firstnum * secondnum * thirdnum))
cat <<EOF
$firstnum plus $secondnum plus $thirdnum is $sum
$firstnum divided by $secondnum divided by $thirdnum is $dividend
$firstnum Multiplied by $secondnum Multiplied by $thirdnum
  - More precisely, it is $fpdividend
EOF
