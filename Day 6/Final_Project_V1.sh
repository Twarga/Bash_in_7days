#!/bin/bash


echo "Welcome to the System Admin Daily Tasks Script! " 


echo "1- to update the system "
echo "2- to manage users "
echo "3- Create a backup"
echo "4- Analyze a  "
echo "5- exit"
read choice 

update() {
    if [ -d /etc/pacman.d ]
    then
        # The Host is based on Arch, run the pacman update command
        sudo pacman -Syu

    fi

    if [ -d /etc/apt ]
    then
        # The Host is based on Debian or Ubuntu 
        # Run the apt version of the command 
        sudo apt update
        sudo apt dist-upgrade
    fi
}

manage_users() {
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

}


backup() {
    echo "Entre the source directory"
    read source
    echo "Entre the dest directory "
    read dest

    # Capture the current date, and store it in the format YYYY-MM-DD
    current_date=$(date +Y-%m-%d)
    # If you choose --dry-run (dry mode) it's just simulation to test you need to remove it to see real backup .
    rsync_options="-avb --backup-dir $dest/$current_date --delete  "

    $(which rsync ) $rsync_options $source $dest/current >> backup_$current_date.log

}

analyzefiles() {

    echo "Entre the file name"
    read Directory

    for file in $Directory/*
    do
	    if [ -f $file ];then
		file_type=$(file -b $file)
		file_Size=$(stat -c%s $file)
		
		echo "File Name $file"
		echo "File Type $file"
		echo "File Size $file"
	    fi
    done


}

donee=0

while [ $donee -ne 1 ]
do
    echo "Welcome to the System Admin Daily Tasks Script! " 
    echo ">>>>>>>>>>>>>>>>>>>>>>>>"

    echo "1- to update the system "
    echo "2- to manage users "
    echo "3- Create a backup"
    echo "4- Analyze a  "
    echo "5- exit"
    read choice 

    case $choice in 
        1) update;;
        2) manage_users;;
        3) backup;;
        4) analyzefiles;;
        5) donee=1
    esac
done
echo "By have a great day "