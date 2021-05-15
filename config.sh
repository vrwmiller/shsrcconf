#! /bin/sh

# PENV must be set in the environment
#
# Ensure the file below is added to .gitignore and its permissions on disk
# are 0400. Get a aes-256-cbc encrypted password thusly:
#
# `echo 'plaintextpassword' | openssl enc -e -aes-256-cbc -a -k $PENV`
#
# Files structure is:
#
# username="" # plain text
# password="" # aes-256-cbc encrypted password
#
CONFFILE="config.conf"
. $CONFFILE

[ $PENV ] && \
  passwd="`echo $password | openssl base64 -d | \
  openssl enc -d -aes-256-cbc -k $PENV`"

echo "User: $username"
echo "Encrypted pass: $password"
echo "Unencrypted pass: $passwd"
