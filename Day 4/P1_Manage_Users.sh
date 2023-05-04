#!/bin/bash


create_user() {
	read -p "Enter the username: " USERNAME
	read -p "Enter the full name: " FULLNAME
	read -s -p "Enter the password: " PASSWORD
	echo ""
	useradd -c "$FULLNAME" -m "$USERNAME"
	echo "$PASSWORD" | passwd --stdin $USERNAME
	echo "User $USERNAME created "
}


delete_user() {
	read -p "Enter the username to delete: " USERNAME
	userdel -r $USERNAME
	echo "User $USERNAME deleted. "
}


list_users() {
	cut -d: -f1 /etc/passwd
}


finished=0
while [ $finished -ne 1 ]
do
	echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>"
	echo ""
	echo "User Management Script"
	echo "1 - Create a new user"
	echo "2 - Delete an existing user"
	echo "3- List all users "
	echo "4- Exit the script"
	echo "Enter Your choice please : "
	echo ""
	echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<"
	read CHOICE;
	case $CHOICE in
		1) create_user;;
		2) delete_user;;
		3) list_users;;
		4) finished=1;;
		*) echo "Invalid choice please Try again"
	esac
done


echo "Thank you for using this script , this script it made by Twarga"
