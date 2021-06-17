#!/bin/bash

# Check if running the script as root. Exit if not.
if [ $UID -ne 0 ]
then
  echo "Please run this script with sudo."
  exit
fi

# Script variables
output=$HOME/research/sys_info.txt
ip=$(ifconfig | grep inet | grep -v inet6 | grep -v 127.0 | tail -1)
execs=$(find / -type f -perm 777 2>/dev/null)

# Script Lists
files=('/etc/passwd' '/etc/shadow')
commands=(
  'date'
  'uname -a'
  'hostname -s'
  )

# Create the research directory under the user home directory if needed.
if [ ! -d $HOME/research ]
then
  mkdir $HOME/research
fi

# Remove the output file if it exists.
if [ -f $output ]
then
  rm $output
fi

### Script main body ###
echo -e "\nSystem Summary Information\n" > $output

# Display output of multiple commands using a for loop
for x in {0..2}
do
  results=$(${commands[$x]})
  echo -e "\nResults of the \"${commands[$x]}\" command:" >> $output
  echo $results >> $output
done

#date >> $output

# Display the complete system uname information
#echo -e "\nUname: $(uname -a) \n" >> $output

# Display the system hostname
#echo -e "Hostname: $(hostname -s) \n" >> $output

# Display the machine type
echo -e "\nMachine Type:" >> $output
echo $MACHTYPE >> $output

# Display the system IP address
echo -e "IP Address: " >> $output
echo -e "$ip \n" >> $output

# Display the defined DNS servers on the system
echo "DNS Servers:" >> $output
cat /etc/resolv.conf | grep -v '\#' >> $output

# Display system memory information
echo -e "\nMemory Statistics:" >> $output
free >> $output

# Display system CPU information
echo -e "\nCPU: " >> $output
lscpu | grep CPU >> $output

# Display system disk usage information
echo -e "\nDisk Info:" >> $output
df -h >> $output

# Display all the users logged into the system
echo -e "\nLogged in users: \n $(who -u)" >> $output

# Display all the 777 (read-write-execute) files on the system using a for loop
echo -e "\n777 Permission Files:" >> $output
for exec in ${execs[@]}
do
  echo $exec >> $output
done

# Display the top 10 running process on the system
echo -e "\nTop 10 Processes:" >> $output
ps aux -m | awk {'print $1, $2, $3, $4, $11'} | head -11 >> $output

# Display the user id and password file permissions
echo -e "\nFile permissions for user id and password files:" >> $output
for file in ${files[@]}
do
  ls -l $file >> $output
done

# Display the sudo permissions for each user with a /home directory
echo -e "\nSudo permissions for each user on the system:" >> $output
for user in $(ls /home)
do
  sudo -lU $user >> $output
done

# Display output of multiple commands using a for loop
for x in {0..2}
do
  results=$(${commands[$x]})
  echo -e "\nResults of the \"${commands[$x]}\" command:" >> $output
  echo $results >> $output
done
