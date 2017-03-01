#!/bin/bash
#---------------------------------------------------------------------------------------------------------------------------
#		Author:Mohammed Usman Ali
#		Class:Year 11 Computing Group
#		Purpose: A shell script to add users
#---------------------------------------------------------------------------------------------------------------------------

clear

if [ "$EUID" -ne 0 ]
	then echo "Please run as root"
	exit
fi

while [ x"$username" = "x" ]; do
	read -r -p "Please enter the username you wish to create: " username
done

while [ x"$group" = "x" ]; do
	read -r -p "Please enter the group you would like to be in. If that group doesn't exist it will be made: " group
	groupadd "$group"
done

read -r -p "The new user $username will be created and put into group $group Please confirm [y/n]: " confirm
	if [ "$confirm" = "y" ]; then
		useradd -g "$group" -m "$username"
	else
		echo "User not added."
	fi
passwd "$username"
exit
