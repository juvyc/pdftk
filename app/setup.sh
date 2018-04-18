#!/bin/bash

set -ex

# Download and untar bundle. Don't use timestamps from the deployer's computer:
# if their clock is in the future, this can seriously confuse build systems like
# make.
cd /app && curl -sS "$1" | tar xz -m
cd /app/bundle

# Run PDFtk
sudo apt-get update
sudo apt-get install pdftk

# Run custom setup.sh in programs/server if provided, as ROOT.
if [ -x ./setup.sh ]; then
  bash ./setup.sh
fi
popd

# Run custom setup.sh in bundle if provided, as ROOT.
if [ -x ./setup.sh ]; then
  bash ./setup.sh
fi
