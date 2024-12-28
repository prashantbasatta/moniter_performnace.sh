#!/bin/bash

# Function to display a menu
display_menu() {
    echo "Linux User and Group Administration Script"
    echo "1. Create User"
    echo "2. Delete User"
    echo "3. Add User to Group"
    echo "4. Remove User from Group"
    echo "5. Create Group"
    echo "6. Delete Group"
    echo "7. List Users"
    echo "8. List Groups"
    echo "9. Exit"
    read -p "Enter your choice [1-9]: " choice
}

# Function to create a user
create_user() {
    read -p "Enter the username to create: " username
    read -p "Enter the group (leave empty for none): " group
    if [ -z "$group" ]; then
        sudo useradd -m "$username"
    else
        sudo useradd -m -G "$group" "$username"
    fi
    echo "User $username created successfully."
}

# Function to delete a user
delete_user() {
    read -p "Enter the username to delete: " username
    sudo deluser --remove-home "$username"
    echo "User $username deleted successfully."
}

# Function to add a user to a group
add_user_to_group() {
    read -p "Enter the username to add to a group: " username
    read -p "Enter the group: " group
    sudo usermod -aG "$group" "$username"
    echo "User $username added to group $group."
}

# Function to remove a user from a group
remove_user_from_group() {
    read -p "Enter the username to remove from a group: " username
    read -p "Enter the group: " group
    sudo deluser "$username" "$group"
    echo "User $username removed from group $group."
}

# Function to create a group
create_group() {
    read -p "Enter the group name to create: " groupname
    sudo groupadd "$groupname"
    echo "Group $groupname created successfully."
}

# Function to delete a group
delete_group() {
    read -p "Enter the group name to delete: " groupname
    sudo groupdel "$groupname"
    echo "Group $groupname deleted successfully."
}

# Function to list all users
list_users() {
    echo "Listing all users:"
    getent passwd
}

# Function to list all groups
list_groups() {
    echo "Listing all groups:"
    getent group
}

# Main function to execute the menu options
main() {
    while true; do
        display_menu
        case $choice in
            1) create_user ;;
            2) delete_user ;;
            3) add_user_to_group ;;
            4) remove_user_from_group ;;
            5) create_group ;;
            6) delete_group ;;
            7) list_users ;;
            8) list_groups ;;
            9) echo "Exiting..."; exit 0 ;;
            *) echo "Invalid choice. Please select a valid option." ;;
        esac
    done
}

# Run the main function
main
