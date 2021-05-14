#! /bin/sh

# Ensure the following file is added to .gitignore and its permissions on disk
# are 0400.
#
# Files structure is:
#
# username=""
# password=""
#
CONFFILE="config.conf"

. $CONFFILE

echo "User: $username"
echo "Pass: $password"
