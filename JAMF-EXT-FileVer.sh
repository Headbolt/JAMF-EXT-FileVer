#!/bin/bash
#
###############################################################################################################################################
#
# ABOUT THIS PROGRAM
#
#	JAMF-EXT-FileVer.sh
#	https://github.com/Headbolt/JAMF-EXT-FileVer
#
#   This Script is designed for use in JAMF as an Extension Attribute
#		with a type set of "Integer"
#
#   - This script will ...
#       Look a specified File and return the Modified Date in a Specified format
#
###############################################################################################################################################
#
# HISTORY
#
#   Version: 1.0 - 16/07/2020
#
#   - 16/07/2020 - V1.0 - Created by Headbolt
#
###############################################################################################################################################
#
#   DEFINE VARIABLES & READ IN PARAMETERS
#
###############################################################################################################################################
#
File=" < FILENAME > " # Set File To Grab Modified Date For, eg /Library/Security/PolicyBanner.txt
#
###############################################################################################################################################
#
# Checking and Setting Variables Complete
#
###############################################################################################################################################
# 
# SCRIPT CONTENTS - DO NOT MODIFY BELOW THIS LINE
#
###############################################################################################################################################
#
ModStampUNIX=$(stat -s $File | awk '{ print $10 }' | cut -c 10-) # Grabs the file details in Raw Format and pulls out Modified Timestamp
ModStamp=$(date -jf "%s" "$ModStampUNIX" +"%Y%m%d%H%M%S") # Converts UNIX time formatted data and turning it into the format we want
/bin/echo "<result>$ModStamp</result>" # Return Result
