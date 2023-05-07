#!/bin/bash


echo "Welcome to the System Admin Daily Tasks Script! " 




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

disk() {
        #!/bin/bash

    # Set the threshold for disk usage as a percentage
    # Ask the user to enter the threshold value he want 
    echo "Enter the threshold value"
    read threshold

    # Ask the user to enter his email address 
    echo "Enter Your email address :"
    read email
    # Get the current disk usage as a percentage
    disk_usage=$(df -h --output=pcent /dev/sda1 | grep -o '[0-9]*')

    # Check if disk usage exceeds the threshold
    if [ $disk_usage -gt $threshold ]; then
        # Send an email alert to the system administrator
        echo "WARNING: Disk usage on server $(hostname) has exceeded the threshold of $threshold%." | mail -s "Disk space alert" $email
    fi
    
    echo "Threshold created successfully .. "

}

Network_manager() {
    echo "Welcome to the network interface configuration script!"
    echo ""


    echo "Enter the name of the network interface you want to configure :"
    read interface

    echo "Enter the Ip address for $interface : "
    read ip_address


    echo "Enter the netmask for $interface : "
    read netmask

    echo "Enter the default gateway for $interface : "
    read gateway


    ifconfig $interface $ip_address netmask $netmask
    route add default gw $gateway $interface



    echo "Network interface $interface has been configured successfully :) ... "
}

Security_hardening() {
    
    firewall(){
      apt-get update
      apt-get install ufw -y
      ufw default deny incoming
      ufw default allow outgoing
      ufw allow ssh
      ufw enable

    }


    disable_root_login() {
      sed -i 's/PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config
    }

    install_fail1ban() {
      apt-get install fail1ban -y
    }


    enable_automatic_update() {
      apt-get install unattended-upgrades -y
      dpkg-reconfigure -plow unattended-upgrades
        
    }

    disable_unnecessary_services() {
      systemctl stop cups.service
      systemctl disable cups.service
    }


    set_password_policies() {
      sed -i 's/# minlen/minlen/g' /etc/security/pwquality.conf
      sed -i 's/# dcredit/dcredit/g' /etc/security/pwquality.conf
      sed -i 's/# ucredit/ucredit/g' /etc/security/pwquality.conf
      sed -i 's/# lcredit/lcredit/g' /etc/security/pwquality.conf
      sed -i 's/# ocredit/ocredit/g' /etc/security/pwquality.conf
    }


    set_permission_on_sentitve_files() {
      chmod 599 /etc/shadow
      chmod 643 /etc/passwd
    }


    all() {
      firewall
      disable_root_login
      install_fail1ban
      enable_automatic_update
      disable_unnecessary_services
      set_password_policies
      set_permission_on_sentitve_files
    }

    echo "Welcome the Security hardening ... "

    echo "Choose an option : "
    echo "1- Disables root login over SSH"
    echo "2- Installs and configures a firewall (ufw). "
    echo "3- Installs fail2ban to protect against brute force attacks.  "
    echo "4- Enables automatic security updates"
    echo "5- Disables unnecessary services"
    echo "6- Sets password policies for user accounts."
    echo "7- Sets permissions on sensitive files (shadow and passwd)"
    echo "8- excute all this options in on time  "

    read s_choice


    case $s_choice in 
      1) disable_root_login;;
      2) firewall;;
      3) install_fail1ban;;
      4) enable_automatic_update;;
      5) disable_unnecessary_services;;
      6) set_password_policies;;
      7) set_permission_on_sentitve_files;;
      8) all
    esac

    echo "Security hardening completed successfully!"
}






donee=0

while [ $donee -ne 1 ]
do
    echo "Welcome to the System Admin Daily Tasks Script! " 
    echo ">>>>>>>>>>>>>>>>>>>>>>>>"

    echo "1- to update the system "
    echo "2- to manage users "
    echo "3- Create a backup"
    echo "4- Analyze a File "
    echo "5- Mini disk manager "
    echo "6- Network manager "
    echo "7- Security hardening"
    echo "8- Exit. "
    read choice 

    case $choice in 
        1) update;;
        2) manage_users;;
        3) backup;;
        4) analyzefiles;;
        5) disk;;
        6) Network_manager;;
        7) Security_hardening;;
        8) donee=1
    esac
done
echo "By have a great day "
