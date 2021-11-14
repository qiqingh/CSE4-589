#!/bin/bash

#Title           :assignment2_init_script.sh
#description     :This script will download and install the template for assignment2.
#Author		     :Swetank Kumar Saha <swetankk@buffalo.edu>
#Version         :1.2
#====================================================================================

# https://gist.github.com/davejamesmiller/1965569
function ask {
	while true; do

		if [ "${2:-}" = "Y" ]; then
			prompt="Y/n"
			default=Y
		elif [ "${2:-}" = "N" ]; then
			prompt="y/N"
			default=N
		else
			prompt="y/n"
			default=
		fi

		# Ask the question
		read -p "$1 [$prompt] " REPLY

		# Default?
		if [ -z "$REPLY" ]; then
			REPLY=$default
		fi

		# Check if the reply is valid
		case "$REPLY" in
			Y*|y*) return 0 ;;
			N*|n*) return 1 ;;
		esac

	done
}

echo -n "Enter your UBIT username (without the @buffalo.edu part) and press [ENTER]: "
read ubitname

while true; do
	echo -n "Enter 1 (for C) OR 2 (for C++): "
	read -n 1 lang_choice

	if [ -z $lang_choice ]; then
		continue
	elif [ $lang_choice == "1" ]; then
			language="C"
			lang_option="c"
		break
	elif [ $lang_choice == "2" ]; then
			language="C++"
			lang_option="cpp"
		break
	else
		continue
	fi
done

echo
echo
echo "UBIT username: $ubitname"
echo "Programming language: $language"

if ask "Do you want to continue?" Y; then
	wget --no-check-certificate https://raw.githubusercontent.com/qiqingh/CSE4-589/main/PA2/assignment2_package.sh
	chmod +x assignment2_package.sh

	wget --no-check-certificate https://raw.githubusercontent.com/qiqingh/CSE4-589/main/PA2/assignment2_update_grader.sh
	chmod +x assignment2_update_grader.sh

	wget --no-check-certificate https://raw.githubusercontent.com/qiqingh/CSE4-589/main/PA2/assignment2_template_${lang_option}.tar.gz
	tar -xvf assignment2_template_${lang_option}.tar.gz

	mv ./ubitname $ubitname

	rm assignment2_template_${lang_option}.tar.gz

	mkdir grader
	cd grader
	wget https://raw.githubusercontent.com/qiqingh/CSE4-589/main/PA2/grader/run_experiments -O run_experiments
	wget https://raw.githubusercontent.com/qiqingh/CSE4-589/main/PA2/grader/sanity_tests -O sanity_tests
	wget https://raw.githubusercontent.com/qiqingh/CSE4-589/main/PA2/grader/basic_tests -O basic_tests
	wget https://raw.githubusercontent.com/qiqingh/CSE4-589/main/PA2/grader/advanced_tests -O advanced_tests
	chmod +x run_experiments
	chmod +x sanity_tests
	chmod +x basic_tests
	chmod +x advanced_tests
	cd ..

	echo
	echo "Installation ... Success!"
else
	exit 0
fi
