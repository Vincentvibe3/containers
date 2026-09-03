#!/bin/bash

export VERSION_PATH=$(echo $MATLAB_VERSION | sed 's/r/R/g')
sed -i -e 's/MATLAB_VERSION/'"$VERSION_PATH"'/g' /build/matlab.desktop