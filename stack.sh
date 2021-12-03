#!/bin/bash

declare -a STACK
read -rep $'\nEnter the size of the stack ?\n' stack_size

while [ 1 ]
do
	read -rep $'\nwhich operation do you want to perform\n1.push \n2.pop\n3.Number of elements in stack\n4.exit\n' option
	
	if [ $option == 1 ]
	then
		read -rep $'\nEnter the element that you want to add to stack ?\n' item
		if [ ${#STACK[@]} -ge $stack_size ]
		then
			echo -e "\nOverflow. Stack is full \n"
			exit 1
		elif [[ " ${STACK[*]} " =~ " ${item} " ]]; then
			echo -e "\nStack already contains the item\n"
		else
			STACK+=($item)
			echo -e "\nItem added to stack\n"
		fi
	elif [ $option == 2 ]
	then
		if [ ${#STACK[@]} -eq 0 ]; then
			echo -e "\nStack empty\n"
		else
			echo -e "\nItem at  the top of the stack -> ${STACK[-1]}\n"
		fi
	elif [ $option == 3 ]
	then
		echo -e "\nThe number of elements in stack ${#STACK[@]}\n"
		( IFS=$'\n'; echo "${STACK[*]}" )
	else
		exit 1
	fi

done
