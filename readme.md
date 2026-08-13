# **Assignment 4 \- OTSSH**

## **About the Assignment**

In this assignment, we are asked to create a simple Bash utility called `otssh` to manage SSH server connections.

### **What the Utility Should Do**

The utility should provide the following operations:

1. **Add** an SSH connection and save its details.  
2. **List** all saved SSH connections.  
3. **Display** the details of saved connections.  
4. **Update** an existing SSH connection.  
5. **Delete** a saved SSH connection.  
6. **Connect** to a server using its saved connection name.

### **How We Are Solving It**

We are using:

* `otssh` \- the main Bash script that performs all the operations.  
* `servers.db` \- a simple database file used to store the SSH connection details.

The sections below explain each operation one by one and show the commands used to test it. A space is left at the required screenshot locations so the actual output screenshots can be added later.

---

## **Introduction**

In this assignment, I created a small Bash utility called `otssh`.

The main purpose of this utility is to save SSH server details with a simple name. After saving a server, I can use its name instead of writing the complete SSH command every time.

For example, instead of writing a long SSH command, I can use:

./otssh server3

The server information is stored in a file called `servers.db`.

---

## **Objective of the Assignment**

The main objective of this assignment was to create an `otssh` utility with the following operations:

* Add an SSH connection  
* List saved SSH connections  
* Display connection details  
* Update an existing SSH connection  
* Delete an SSH connection  
* Connect to a server using its saved name

---

## **Project Files**

My assignment folder contains:

assignment4.0/

│

├── otssh

├── servers.db

└── README.md

### **`otssh`**

This is the main Bash script.

### **`servers.db`**

This file stores the SSH connection information.

### **`README.md`**

This file contains the explanation and screenshots of my assignment.

---

# **1\. Creating the Script**

First, I created the `otssh` file.

touch otssh

Then I opened the file and wrote the Bash script.

I also gave execute permission:

chmod \+x otssh

I checked the permission using:

ls \-l otssh

The `x` permission means that the script can be executed.

### **Screenshot \- Script and Execute Permission**

---

# **2\. Database File**

The script uses `servers.db` to store the SSH connection details.

The basic format of one record is:

ServerName|Host|Username|Port|PrivateKey

For example:

server1|192.168.21.30|kirti|22|

server2|192.168.42.34|kirti|2022|

server3|192.168.46.34|ubuntu|2022|/home/user/.ssh/server3.pem

The `|` symbol is used to separate the different values.

If a port is not given while adding a server, port `22` is used as the default SSH port.

---

# **3\. Add SSH Connection**

The first operation is adding a new SSH connection.

The general command is:

./otssh \-a \-n \<name\> \-h \<host\> \-u \<user\> \[-p \<port\>\] \[-i \<identity\_file\>\]

### **Example**

./otssh \-a \-n server1 \-h 192.168.21.30 \-u kirti

Here:

* `-a` means add  
* `-n` is the name of the connection  
* `-h` is the server host/IP  
* `-u` is the SSH username  
* `-p` is the SSH port  
* `-i` is the private key file

I added the required SSH connections for the assignment.

### **Screenshot \- Add SSH Connection**

---

# **4\. List SSH Connections**

After adding the servers, I checked the saved connection names using:

./otssh ls

This displays only the names of the saved connections.

Example:

server1

server2

server3

This is useful when I only want to see which servers are saved.

### **Screenshot \- List Connections**

---

# **5\. List Connection Details**

To see the details of the saved SSH connections, I used:

./otssh ls \-d

This displays the saved server information and the SSH command that can be used to connect to each server.

For example:

server1: ssh kirti@192.168.21.30

server2: ssh \-p 2022 kirti@192.168.42.34

server3: ssh \-i /home/user/.ssh/server3.pem \-p 2022 ubuntu@192.168.46.34

### **Screenshot \- Detailed List**

---

# **6\. Update SSH Connection**

The update operation is used when the details of an already saved server need to be changed.

Example:

./otssh update \-n server1 \-h server1 \-u user1

After updating the connection, I checked the details again using:

./otssh ls \-d

This helped me verify that the old information was replaced with the updated information.

### **Screenshot \- Update Connection**

### **Screenshot \- Verify Updated Connection**

---

# **7\. Delete SSH Connection**

The delete operation removes a saved SSH connection.

For example:

./otssh rm server1

I also deleted another connection:

./otssh rm server2

After deleting the connections, I checked the remaining entries:

./otssh ls \-d

The remaining server should be displayed.

### **Screenshot \- Delete Connection**

### **Screenshot \- Verify Deleted Connections**

---

# **8\. Connect to SSH Server**

The main useful part of `otssh` is that I can connect to a saved server using only its name.

For example:

./otssh server3

The script reads the information of `server3` from `servers.db` and uses it to create the SSH command.

If a private key and custom port are stored, the script also uses them.

For example, the SSH command can be similar to:

ssh \-i /home/user/.ssh/server3.pem \-p 2022 ubuntu@192.168.46.34

### **Screenshot \- Connect to Server**

---

# **9\. Testing Error Case**

I also checked what happens when I try to connect to a server that is not available in the database.

For example:

./otssh server1

after deleting `server1`.

The script should show an error message instead of trying to connect to an unknown server.

Example:

\[ERROR\]: Server information is not available, please add server first.

### **Screenshot \- Error Handling**

---

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
* `getopts`  
* Variables  
* `if` conditions  
* `case` statements  
* `while` loops  
* `read`  
* File handling  
* Temporary files  
* SSH commands

---

# **11\. Commands Tested**

I tested the main operations of the utility using commands similar to the following:

### **Add**

./otssh \-a \-n server1 \-h 192.168.21.30 \-u kirti

### **Add with custom port**

./otssh \-a \-n server2 \-h 192.168.42.34 \-u kirti \-p 2022

### **Add with private key**

./otssh \-a \-n server3 \-h 192.168.46.34 \-u ubuntu \-p 2022 \-i \~/.ssh/server3.pem

### **List**

./otssh ls

### **List details**

./otssh ls \-d

### **Update**

./otssh update \-n server1 \-h server1 \-u user1

### **Delete**

./otssh rm server1

### **Connect**

./otssh server3

---

# **12\. Conclusion**

In this assignment, I created a Bash based SSH utility named `otssh`.

The utility stores SSH connection details in `servers.db`, so I do not have to remember and type the complete SSH command every time.

I learned how to use Bash functions, command-line arguments, loops, file handling and SSH commands while making this assignment.

The main thing I understood from this assignment is how a Bash script can be used to make a small Linux utility for a real-world task like managing SSH connections.

