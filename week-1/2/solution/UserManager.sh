#!/bin/bash
#----------------------script starting from here -------------------------
case "$1" in

addTeam)
	if getent group "$2" > /dev/null; then
		echo "Team $2 already exists."
	else
		sudo groupadd "$2"
		echo "Team $2 created successfully."
	fi
	;;

addUser)
	if id "$2" &>/dev/null; then
		echo "User $2 already exists."
	elif ! getent group "$3" > /dev/null; then
		echo "Team $3 does not exist."
		echo "Please create the Team first."
	else
		sudo useradd -m "$2"
		sudo usermod -aG "$3" "$2"
		sudo usermod -aG ninja "$2"

		sudo mkdir "/home/$2/team"
		sudo mkdir "/home/$2/ninja"

		sudo chown "$2:$3" "/home/$2"
		sudo chown "$2:$3" "/home/$2/team"
		sudo chown "$2:ninja" "/home/$2/ninja"

		sudo chmod 751 "/home/$2"
		sudo chmod 770 "/home/$2/team"
		sudo chmod 770 "/home/$2/ninja"

		echo "User $2 is added successfully to team $3."
	fi
	;;

changePasswd)
	if id "$2" &>/dev/null; then
		sudo passwd "$2"
	else
		echo "User $2 does not exist."
	fi
	;;

changeShell)
	if id "$2" &>/dev/null; then
		sudo usermod -s "$3" "$2"
		echo "Shell for $2 changed to $3."
	else
		echo "User $2 does not exist."
	fi
	;;

delUser)
	if id "$2" &>/dev/null; then
		sudo userdel -r "$2"
		echo "User $2 deleted successfully."
	else
		echo "User $2 does not exist."
	fi
	;;

delTeam)
	if getent group "$2" > /dev/null; then
		sudo groupdel "$2"
		echo "Team $2 deleted successfully."
	else
		echo "Team $2 does not exist."
	fi
	;;

ls)
	if [ "$2" = "User" ]; then
		getent passwd | awk -F: '$3 >= 1000 && $3 < 65534 {print $1}'
	elif [ "$2" = "Team" ]; then
		getent group | awk -F: '$3 >= 1000 && $3 < 65534 {print $1}'
	else
		echo "Usage: ./UserManager.sh ls User|Team"
	fi
	;;
	
*)
echo "Invalid Operation"
;;
esac