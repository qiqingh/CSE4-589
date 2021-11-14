#!/bin/bash

#Title           :assignment2_update_grader.sh
#description     :This script will update the experiment scripts for assignment2.
#Author		     :Swetank Kumar Saha <swetankk@buffalo.edu>
#Version         :1.2
#====================================================================================

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
