#!/bin/bash

echo "Do you have an existing key or want to create a new one?"
echo "0: Use existing key"
echo "1: Create new key"
read choice

if[$choice -eq '0'];
then 
	gpg --list-secret-keys --keyid-format LONG
	echo "enter the key ID"
	read id
elif [$choice -eq '1'];
then 
	gpg --full-generate-key
	id= 'gpg --list-secret-keys --keyid-format LONG| egrep "[0-9a-fA-F]{25,45}"'	
fi

git config --global user.signingkey $id
git config --global commit.gpgsign true
echo "gpg key successfully added"

gpg --armor --export $id
echo "Please Add this key in your Github account"
