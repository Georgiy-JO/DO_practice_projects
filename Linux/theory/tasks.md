# *TASKS (EN)*

Linux's system installation and updates. Administration basics.

## Contents

1. [Theory](#theory)  
   1.1. [Linux](#linux)  
   1.2. [Administration](#administration)  
   1.3. [Virtual machines](#virtual-machines)  
   1.4. [More theory](#more-theory)
2. [Tasks](#tasks)  
   2.1 [Installation of the OS](#part-1-installation-of-the-os)  
   2.2 [Creating a user](#part-2-creating-a-user)  
   2.3 [Setting up the OS network](#part-3-setting-up-the-os-network)   
   2.4 [OS Update](#part-4-os-update)  
   2.5 [Using the sudo command](#part-5-using-the-sudo-command)  
   2.6 [Installing and configuring the time service](#part-6-installing-and-configuring-the-time-service)  
   2.7 [Installing and using text editors](#part-7-installing-and-using-text-editors)  
   2.8 [Installing and basic setup of SSHD service](#part-8-installing-and-basic-setup-of-the-sshd-service)  
   2.9 [Installing and using the top, htop utilities](#part-9-installing-and-using-the-top-htop-utilities)   
   2.10 [Using the fdisk utility](#part-10-using-the-fdisk-utility)   
   2.11 [Using the df utility](#part-11-using-the-df-utility)    
   2.12 [Using the du utility](#part-12-using-the-du-utility)    
   2.13 [Installing and using the ncdu utility](#part-13-installing-and-using-the-ncdu-utility)    
   2.14 [Working with system logs](#part-14-working-with-system-logs)     
   2.15 [Using the CRON job scheduler](#part-15-using-the-cron-job-scheduler)


## Theory

### Linux
The history of Linux dates back to 1991, when a Finnish graduate programmer named Linus Torvalds began working on his own operating system kernel.

He put his work on a public server and it became a milestone in the history of Linux. First dozens, then hundreds and thousands of developers supported his project, and that's how a complete operating system was born.

The first official version, Linux 1.0, was released in 1994. From the beginning to the present day, Linux has been distributed as free software under the GPL licence. This means that the source code of the operating system can be viewed by anyone - and not just viewed, but modified. The only condition is that the modified code must also be available to everyone and distributed under the GPL. This is important because it allows developers to use the code without worrying about copyright issues.

Today, Linux is the most popular and widely used open source operating system. As an operating system, Linux is software that sits below other software on a computer, receiving requests from those programs and passing those requests on to the computer's hardware.

### Administration

Administration, without going into too much detail, is the support and improvement of all computer and office equipment, peripherals, network connectivity, etc. When administering Linux, most of the work is done in the terminal.

### Virtual machines

"A virtual machine (VM) is just like a physical computer, it has a CPU, memory, disks for storing files, and can connect to the Internet if necessary. The only difference is that the components of your computer (the hardware) are tangible, while virtual machines exist only as code.

Virtualization is the process of creating a software (virtual) version of a computer with dedicated CPU, memory and storage resources that are 'borrowed' from a physical computer. A virtual machine is a computer file (image) that works like a normal computer.

_VirtualBox_ is a virtualization software product, i.e. a tool for creating virtual machines."

### More theory

* [CRON](/Linux/theory/pieces/CRON.md)
* [df](/Linux/theory/pieces/df.md)
* [du](/Linux/theory/pieces/du.md)
* [fdisk](/Linux/theory/pieces/fdisk.md)
* [logs](/Linux/theory/pieces/logs.md)
* [ncdu](/Linux/theory/pieces/ncdu.md)
* [Network_configuration](/Linux/theory/pieces/OS_network_configure.md)
* [ssh](/Linux/theory/pieces/SSHD.md)
* [Time management](/Linux/theory/pieces/time_management.md)
* [top and htop](/Linux/theory/pieces/top_and_htop.md)






## Tasks

As a result of the work you should provide a report with completed tasks. Each part of the task describe what should be added to the report once it has been completed. This can be screenshots, some data, etc.


### Part 1. Installation of the OS

##### Install **Ubuntu 20.04 Server LTS** without GUI. (Use VirtualBox).
- There should be no GUI.
- Check Ubuntu version by running the command \
  `cat /etc/issue`
- Add a screenshot of the command output to the report.






### Part 2. Creating a user

##### Create a user other than the one created during installation. The user must be added to `adm` group.
- Add a screenshot of command call to create user.
- The new user must be in the output of the command: \
  `cat /etc/passwd`
- Add a screenshot of the command output.






### Part 3. Setting up the OS network

##### Set the machine name as user-1
##### Set the time zone corresponding to your current location.

##### Output the names of the network interfaces using a console command.
- In the report give an explanation for the presence of the lo interface.
##### Use the console command to get the ip address of the device you are working on from the DHCP server.
- Decode DHCP in the report.
##### Define and display the external ip address of the gateway (ip) and the internal IP address of the gateway, aka default ip address (gw).
##### Set static (manually set, not received from DHCP server) ip, gw, dns settings (use public DNS servers, e.g. 1.1.1.1 or 8.8.8.8).

##### Reboot the virtual machine. Make sure that the static network settings (ip, gw, dns) correspond to those set in the previous point.
- Describe in the report what you have done to complete all seven points (you can do it in text or with screenshots);
- Successfully ping 1.1.1.1 and ya.ru remote hosts and add a screenshot of the output command to the report. There should be "0% packet loss" phrase in command output.






### Part 4. OS Update

##### Update the system packages to the latest version
- After updating the system packages, if you enter the update command again, a message should appear saying there are no updates;
- Add a screenshot of this message to the report.






### Part 5. Using the **sudo** command

##### Allow user created in [Part 2](#part-2-creating-a-user) to execute sudo command.
- In the report explain the *true* purpose of sudo command (don’t write about the fact that this word is "magic" one);
- Change the OS hostname via the user created in [Part 2](#part-2-creating-a-user) (using sudo);
- Add screenshot with changed hostname to the report.






### Part 6. Installing and configuring the time service

##### Set up the automatic time synchronisation service.
- Output the time of the time zone in which you are currently located.
- The output of the following command must contain `NTPSynchronized=yes`: \
  `timedatectl show`
- Add screenshots of the correct time and command output to the report.






### Part 7. Installing and using text editors

##### Install **VIM** text editor (+ any two others if you like **NANO**, **MCEDIT**, **JOE** etc.)

##### Using each of the three selected editors, create a *test_X.txt* file, where X is the name of the editor in which the file is created. Write your nickname in it, close the file and save the changes.
- Add screenshots to the report:
    - Of each editor with the contents of the file before closing;
- Write down in the report what you have done to exit with the changes saved.

##### Using each of the three selected editors, open the file for editing, edit the file by replacing the nickname with the "21 School 21" string, close the file without saving the changes.
- Add screenshots to the report:
    - Of each editor with the contents of the file after editing;
- Write down in the report what you have done to exit without saving the changes.
##### Using each of the three selected editors, edit the file again (similar to the previous point) and then master the functions of searching through the contents of a file (a word) and replacing a word with any other one.
- Add screenshots to the report:
    - Of each editor with word search results;
    - Of each editor with commands entered to replace a word with another.






### Part 8. Installing and basic setup of the **SSHD** service

##### Install the SSHd service.
##### Add an auto-start of the service whenever the system boots.
##### Reset the SSHd service to port 2022.
##### Show the presence of the sshd process using the ps command. To do this, you need to match the keys to the command.
- Explain in the report the meaning of the command and each key in it.
##### Reboot the system.
- Describe in the report what you have done to complete all five points (you can do this in text or with screenshots);
- The output of the netstat -tan command should contain \
  `tcp 0 0.0.0.0:2022 0.0.0.0:* LISTEN` \
  (if there is no netstat command, it needs to be installed);
- Add a screenshot of the command output to the report;
- Explain the meaning of the -tan keys, the value of each output column, the value 0.0.0.0. in the report.






### Part 9. Installing and using the **top**, **htop** utilities

##### Install and run the top and htop utilities.
- From the output of the top command determine and write in the report:
    - uptime
    - number of authorised users
    - total system load
    - total number of processes
    - cpu load
    - memory load
    - pid of the process with the highest memory usage
    - pid of the process taking the most CPU time
- Add a screenshot of the htop command output to the report:
    - sorted by PID, PERCENT_CPU, PERCENT_MEM, TIME
    - filtered for sshd process
    - with the syslog process found by searching
    - with hostname, clock and uptime output added






### Part 10. Using the **fdisk** utility

##### Run the fdisk -l command.
- In the report write the name of the hard disk, its capacity and number of sectors, and also the swap size.






### Part 11. Using the **df** utility

##### Run the df command.
- In the report write for the root partition (/):
    - partition size
    - space used
    - space free
    - percentage used
- Determine and write the measurement unit in the report.

##### Run the df -Th command.
- In the report write for the root partition (/):
    - partition size
    - space used
    - space free
    - percentage used
- Determine and write the file system type for the partition in the report.





### Part 12. Using the **du** utility

##### Run the du command.
##### Output the size of the /home, /var, /var/log folders (in bytes, in human readable format)
##### Output the size of all contents in /var/log (not the total, but each nested element using *)
- Add screenshots with the output of all used commands to the report.





### Part 13. Installing and using the **ncdu** utility

##### Install the ncdu utility.
##### Output the size of the /home, /var, /var/log folders.
- The size should be approximately the same as in [Part 12](#part-12-using-the-du-utility);

- Add screenshots of the used commands to the report.



### Part 14. Working with system logs

##### Open for viewing:
##### 1. /var/log/dmesg
##### 2. /var/log/syslog
##### 3. /var/log/auth.log
- Write the last successful login time, user name and login method in the report;
- Restart SSHd service;
- Add a screenshot of the service restart message to the report (search for it in the logs).




### Part 15. Using the **CRON** job scheduler

##### Using the job scheduler, run the uptime command in every 2 minutes.
- Find lines in the system logs (at least two within a given time range) about the execution;
- Display a list of current jobs for CRON;
- Add screenshots of the execution lines and the list of current tasks to the report.

##### Remove all tasks from the job scheduler.
- Add a screenshot of the list of current tasks for CRON to the report.
