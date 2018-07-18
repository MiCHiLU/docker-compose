#!/bin/bash
set -x
o=$(cd src && git remote -v | head -n1 | awk '{print $2}')
e=${o#*//*/}
p=${e%.*}
mkdir -p build/${p%/*}
ln -s ${PWD}/src build/$p
