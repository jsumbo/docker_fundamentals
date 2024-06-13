#!/bin/bash 

# add user bob 
sudo useradd bob 

# remove user bob 
sudo userdel bob 

# change user bob password 
passwd bob

# numerical permission: 4: read permission | 2: write permission | 1: execute permission = 775
chmod 775 file name 

# Compressing files with gzip 
gzip mycoolfile

# To decompress the file:
gunzip mycoolfile.gz

# Creating archives with tar
tar cvf mytarfile.tar mycoolfile1 mycoolfile2

# Unpacking archives with tar
tar xvf mytarfile.tar

"
x - extract
v - tell the program to be verbose and let us see what it's doing
f - the file you want to extract
"

# Create a compressed tar file:
$ tar czf myfile.tar.gz

# Uncompress and unpack:
$ tar xzf file.tar

