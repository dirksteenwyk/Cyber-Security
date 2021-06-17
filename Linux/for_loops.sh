#!/bin/bash

# Script variables
states=('Michigan' 'Florida' 'Hawaii' 'Alaska' 'Washington')
nums=$(echo {0..9})
ls_list=$(ls)
execs_list=$(find /home -type f -perm 777 2> /dev/null)

# For loop examples
# A loop that prints a message for a specific state 'Michigan'.
for state in ${states[@]}
do
  if [ $state == 'Michigan' ]
  then
    echo "Michigan is the best!"
  else
    echo -e "I'm not a fan of $state."
  fi
done

# A loop that prints specific numbers 3, 5, or 7.
for num in ${nums[@]}
do
  if [ $num = 3 ] || [ $num = 5 ] || [ $num = 7 ]
  then
    echo $num
  fi
done

# A loop that prints out the list of files in the current directory.
for ls_item in ${ls_list[@]}
do
  echo $ls_item
done

# A loop that looks for 777 permission files and lists them one on each line.
for exec_filename in ${execs_list[@]}
do
  echo $exec_filename
done

