#!/bin/bash

if [ "$1" = "--sudo" ]; then
    SUDO=""
else
    SUDO="sudo"
fi

$SUDO apt-get install -y gcc
$SUDO apt-get install -y g++
$SUDO apt-get install -y make
$SUDO apt-get install -y cmake

