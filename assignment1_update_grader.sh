#!/bin/bash

#Title           :assignment1_update_verifier.sh
#description     :This script will update the verifier scripts for assignment1.
#Author		     :Swetank Kumar Saha <swetankk@buffalo.edu>
#Version         :1.0
#====================================================================================

cd grader
wget --no-check-certificate -r -c https://github.com/qiqingh/test/raw/main/grader_controller -O grader_controller
