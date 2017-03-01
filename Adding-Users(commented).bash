#!/bin/bash
#---------------------------------------------------------------------------------------------------------------------------
#		Author:Mohammed Usman Ali
#		Class:Year 11 Computing Group
#		Purpose: A shell script to add users
#---------------------------------------------------------------------------------------------------------------------------

#this clears all text on the console
clear

#condition checks if the user is root. 0 equals root, anything else is not root user
if [ "$EUID" -ne 0 ]
	#if the user is not root then displays message to run as root
	then echo "Please run as root"
	#exits the shell
	exit
#end of condition
fi

#condition starts to see if $username has anything stored in it
while [ x"$username" = "x" ]; do
	#reads from user input, thus the -p (prompt option), and stores it to the username variable
	read -r -p "Please enter the username you wish to create: " username
#end of condition
done

#condition starts to see if $group has anything stored in it
while [ x"$group" = "x" ]; do
	#reads from user input, thus the -p (prompt option), and stores it to the group variable
	read -r -p "Please enter the group you would like to be in. If that group doesn't exist it will be made: " group
	#creats a new group that is chosen, if it already exists then a message appears that it already exists
	groupadd "$group"
#end of condition
done

#reads from user input, thus the -p (prompt option), and stores it to the confirm option
read -r -p "The new user $username will be created and put into group $group Please confirm [y/n]: " confirm
	#condition starts. if $confirm holds y then
	if [ "$confirm" = "y" ]; then
		#user added will $username being their username and $group being their primary group
		useradd -g "$group" -m "$username"
	#otherwise
	else
		#displays message saying user not added
		echo "User not added."
	#end of condition
	fi
#prompts a password change if user is created
passwd "$username"
#when user added, group assigned and password is change then the script ends.
exit
