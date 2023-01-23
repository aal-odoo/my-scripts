#!/bin/bash

# $1 = version
# $2 = directory
# $3 = module name


version=$1
dir="workspace15/$2"

echo "$1 $dir"
if [ $version -eq 16 ];
then
    echo "directing into version 16"
    dir="workspace16/$2"
elif [ $version -eq 14 ]
then
    echo "directing into version 14"
    dir="workspace14/$2"
else
    echo "directing into version 15"
fi

mkdir $dir/$3
cd $dir/$3

# create base of modules
mkdir models
mkdir views
touch __init__.py
touch __manifest__.py


echo "from . import models" > __init__.py
~/basemanifest.py > __manifest__.py
