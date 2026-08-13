# **Assignment 4 \- OTSSH**

# **About the Assignment**

In this assignment, we are asked to create a simple Bash utility called otssh to manage SSH server connections.

## **What the Utility Should Do**

The utility should provide the following operations:

1. \*\*Add\*\* an SSH connection and save its details.  
2. \*\*List\*\* all saved SSH connections.  
3. \*\*Display\*\* the details of saved connections.  
4. \*\*Update\*\* an existing SSH connection.  
5. \*\*Delete\*\* a saved SSH connection.  
6. \*\*Connect\*\* to a server using its saved connection name.

## **How We Are Solving It**

We are using:

* \`otssh\` \- the main Bash script that performs all the operations.  
* \`servers.db\` \- a simple database file used to store the SSH connection details.

The sections below explain each operation one by one and show the commands used to test it. A space is left at the required screenshot locations so the actual output screenshots can be added later.

# **Introduction**

In this assignment, I created a small Bash utility called otssh.

The main purpose of this utility is to save SSH server details with a simple name. After saving a server, I can use its name instead of writing the complete SSH command every time.

For example, instead of writing a long SSH command, I can use:

./otssh server3

The server information is stored in a file called servers.db.

# **Objective of the Assignment**

The main objective of this assignment was to create an otssh utility with the following operations:

* Add an SSH connection  
* List saved SSH connections  
* Display connection details  
* Update an existing SSH connection  
* Delete an SSH connection  
* Connect to a server using its saved name

# **Project Files**

My assignment folder contains:

assignment4.0/  
│  
├── otssh  
├── servers.db  
└── README.md

## **\`otssh\`**

This is the main Bash script.

## **\`servers.db\`**

This file stores the SSH connection information.

## **\`README.md\`**

This file contains the explanation and screenshots of my assignment.

# **1\. Creating the Script**

First, I created the otssh file.

touch otssh

Then I opened the file and wrote the Bash script.

I also gave execute permission:

chmod \+x otssh

I checked the permission using:

ls \-l otssh

The x permission means that the script can be executed.

## **Screenshot \- Script and Execute Permission**

<img width="662" height="65" alt="Screenshot from 2026-08-11 08-33-14" src="https://github.com/user-attachments/assets/8b1e0e89-e6ed-41a3-abca-815e77700d8d" />


# **2\. Database File**

The script uses servers.db to store the SSH connection details.

The basic format of one record is:

ServerName|Host|Username|Port|PrivateKey

For example:

server1|192.168.21.30|kirti|22|  
server2|192.168.42.34|kirti|2022|  
server3|192.168.46.34|ubuntu|2022|/home/user/.ssh/server3.pem

The | symbol is used to separate the different values.

If a port is not given while adding a server, port 22 is used as the default SSH port.

# **3\. Add SSH Connection**

The first operation is adding a new SSH connection.

The general command is:

./otssh \-a \-n \<name\> \-h \<host\> \-u \<user\> \[-p \<port\>\] \[-i \<identity\_file\>\]

## **Example**

./otssh \-a \-n server1 \-h 192.168.21.30 \-u kirti

Here:

* \`-a\` means add  
* \`-n\` is the name of the connection  
* \`-h\` is the server host/IP  
* \`-u\` is the SSH username  
* \`-p\` is the SSH port  
* \`-i\` is the private key file

I added the required SSH connections for the assignment.

## **Screenshot \- Add SSH Connection**

# **4\. List SSH Connections**

After adding the servers, I checked the saved connection names using:

./otssh ls

This displays only the names of the saved connections.

Example:

server1  
server2  
server3

This is useful when I only want to see which servers are saved.

## **Screenshot \- List Connections**

# **5\. List Connection Details**

To see the details of the saved SSH connections, I used:

./otssh ls \-d

This displays the saved server information and the SSH command that can be used to connect to each server.

For example:

server1: ssh kirti@192.168.21.30  
server2: ssh \-p 2022 kirti@192.168.42.34  
server3: ssh \-i /home/user/.ssh/server3.pem \-p 2022 ubuntu@192.168.46.34

## **Screenshot \- Detailed List**

# **6\. Update SSH Connection**

The update operation is used when the details of an already saved server need to be changed.

Example:

./otssh update \-n server1 \-h server1 \-u user1

After updating the connection, I checked the details again using:

./otssh ls \-d

This helped me verify that the old information was replaced with the updated information.

## **Screenshot \- Update Connection**

## **Screenshot \- Verify Updated Connection**

# **7\. Delete SSH Connection**

The delete operation removes a saved SSH connection.

For example:

./otssh rm server1

I also deleted another connection:

./otssh rm server2

After deleting the connections, I checked the remaining entries:

./otssh ls \-d

The remaining server should be displayed.

## **Screenshot \- Delete Connection**

## **Screenshot \- Verify Deleted Connections**

# **8\. Connect to SSH Server**

The main useful part of otssh is that I can connect to a saved server using only its name.

For example:

./otssh server3

The script reads the information of server3 from servers.db and uses it to create the SSH command.

If a private key and custom port are stored, the script also uses them.

For example, the SSH command can be similar to:

ssh \-i /home/user/.ssh/server3.pem \-p 2022 ubuntu@192.168.46.34

## **Screenshot \- Connect to Server**

# **9\. Testing Error Case**

I also checked what happens when I try to connect to a server that is not available in the database.

For example:

./otssh server1

after deleting server1.

The script should show an error message instead of trying to connect to an unknown server.

Example:

\[ERROR\]: Server information is not available, please add server first.

## **Screenshot \- Error Handling**

# **10\. How the Script Works**

The basic working of the script is:

User enters command  
        ↓  
otssh reads the command-line arguments  
        ↓  
The required operation is selected  
        ↓  
servers.db is read or updated  
        ↓  
Result is displayed  
        ↓  
For a connection, SSH is executed

The script uses Bash functions for different operations.

Some important Bash concepts used in this assignment are:

* Command-line arguments  
* \`getopts\`  
* Variables  
* \`if\` conditions  
* \`case\` statements  
* \`while\` loops  
* \`read\`  
* File handling  
* Temporary files  
* SSH commands

# **11\. Commands Tested**

I tested the main operations of the utility using commands similar to the following:

## **Add**

./otssh \-a \-n server1 \-h 192.168.21.30 \-u kirti

## **Add with custom port**

./otssh \-a \-n server2 \-h 192.168.42.34 \-u kirti \-p 2022

## **Add with private key**

./otssh \-a \-n server3 \-h 192.168.46.34 \-u ubuntu \-p 2022 \-i \~/.ssh/server3.pem

## **List**

./otssh ls

## **List details**

./otssh ls \-d

## **Update**

./otssh update \-n server1 \-h server1 \-u user1

## **Delete**

./otssh rm server1

## **Connect**

./otssh server3

# **12\. Conclusion**

In this assignment, I created a Bash based SSH utility named otssh.

The utility stores SSH connection details in servers.db, so I do not have to remember and type the complete SSH command every time.

I learned how to use Bash functions, command-line arguments, loops, file handling and SSH commands while making this assignment.

The main thing I understood from this assignment is how a Bash script can be used to make a small Linux utility for a real-world task like managing SSH connections.

[image1]: <data:image/png;base64,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>
