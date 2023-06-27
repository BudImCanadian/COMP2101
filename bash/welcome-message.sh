#!/bin/bash
#
# This script produces a dynamic welcome message
# it should look like
#   Welcome to planet hostname, title name!

# Task 1: Use the variable $USER instead of the myname variable to get your name
# Task 2: Dynamically generate the value for your hostname variable using the hostname command - e.g. $(hostname)
# Task 3: Add the time and day of the week to the welcome message using the format shown below
#   Use a format like this:
#   It is weekday at HH:MM AM.
# Task 4: Set the title using the day of the week
#   e.g. On Monday it might be Optimist, Tuesday might be Realist, Wednesday might be Pessimist, etc.
#   You will need multiple tests to set a title
#   Invent your own titles, do not use the ones from this example

###############
# Variables   #
###############
title="Genius"

###############
# Main        #
###############'
if [ $(date +%A) == "Monday" ]
then
	title="Worst Day of The Week!"
elif [ $(date +%A) == "Tuesday" ]
then
	title="Take it easy Tuesday"
elif [ $(date +%A) == "Wednesday" ]
then
	title="No work Wednesday"
elif [ $(date +%A) == "Thursday" ]
then
	title="Work from home thursday"
elif [ $(date +%A) == "Friday" ]
then
	title="Mental Health Friday"
elif [ $(date +%A) == "Saturday" ]
then
	title="I'm fishing"
elif [ $(date +%A) == "Sunday" ]
then
	title="I'm fishing"
fi

cat <<EOF

Welcome to my house! $(hostname) 
$title $USER!
It is $(date +%A) at $(date +%I:%M%p)
EOF
