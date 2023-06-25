#! /usr/bin/bash

# Function to create a user individually if file doesn't exist 
create_user() {
    read -p "Enter  username: " username
    read -p "Enter  password: " -s password
    echo
    read -p "Enter  groupname: " groupname

    # Creating new user 
    sudo useradd -m -p $(openssl passwd -1 "$password") "$username"

    # Creating a group with the provided groupname if it doesn't exist
    if ! grep -q "^$groupname:" /etc/group; then
        sudo groupadd "$groupname"
    fi

    # Adding the user to the group with restricted permissions
    sudo usermod -a -G "$groupname" "$username"

    # Creating website.txt file with read-only permissions for the created user
    home_directory=$(getent passwd "$username" | cut -d: -f6) #to get home directory of new user
    sudo -u "$username" touch "$home_directory"/website.txt
    sudo -u "$username" chmod 400 "$home_directory"/website.txt
}

# Checking if the user_info.txt file already exists
if [ -f "user_info.txt" ]; then
    # Reading the user details from the file
    while IFS=":" read -r username password groupname #keeping IFS as : and modified user_info.txt for my convenient
    do
        # Creating  new user 
        sudo useradd -m -p $(openssl passwd -1 "$password") "$username"

        # Creating group with the provided groupname if it doesn't exist
        if ! grep -q "^$groupname:" /etc/group; then
            sudo groupadd "$groupname"
        fi

        # Add the user to the group with restricted permissions
        sudo usermod -a -G "$groupname" "$username"

        # Creating  website.txt file with read-only permissions for the user
    home_dir=$(getent passwd "$username" | cut -d: -f6)
    sudo -u "$username" touch "$home_dir"/website.txt
    sudo -u "$username" chmod 400 "$home_dir"/website.txt
    
    done < "user_info.txt"
else
    echo "user_info.txt file not found."
    echo "Creating users individually..."
    create_user
fi
# Setting  read and write permissions for the website file for me 
    home_dir=$(getent passwd "aravindhan1891" | cut -d: -f6)
    sudo -u "aravindhan1891" touch "$home_dir"/website.txt
    sudo -u "aravindhan1891" chmod 600 "$home_dir"/website.txt

