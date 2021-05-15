#! /bin/sh
#
# PENV is a plain text key=value pair used to encrypt and decrypt the
# aes-256-cbc encrypted string. It can be specified in the config or in the
# environment
#
# Add the file below to .gitignore. Set its permissions on disk to 0400.
# Get a aes-256-cbc encrypted password thusly:
#
# `echo 'plaintextpassword' | openssl enc -e -aes-256-cbc -a -k $PENV`
#
# Files structure is:
#
# PENV=""     # plain text
# username="" # plain text
# password="" # aes-256-cbc encrypted password
#
CONFFILE="config.conf"
. $CONFFILE

[ $PENV ] && \
  # decrypt the password
  passwd="`echo $password | openssl base64 -d | \
  openssl enc -d -aes-256-cbc -pass env:PENV`"

echo "User: $username"
echo "Encrypted pass: $password"
echo "Decrypted pass: $passwd"
