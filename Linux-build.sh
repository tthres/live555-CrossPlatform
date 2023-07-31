#!/bin/bash

# Create 'build' directory if it doesn't exist
mkdir -p build
cd build

# Remove all files in the 'build' directory
rm -rf *

# Run cmake and make
cmake ..
make -j4
