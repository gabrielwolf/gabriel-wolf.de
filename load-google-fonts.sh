#!/bin/bash

# Script to load a google font to a specific directory.
# Autor: gabriel.wolf@wolfzeit.com, License: MIT
#
# See https://google-webfonts-helper.herokuapp.com/fonts
# to get a correct url with all variants you need

# declare fonts
declare -a fonts=(
    "saira?download=zip&subsets=latin&variants=600,regular"
    "lusitana?download=zip&subsets=latin&variants=700,regular"
    )

# set directory to copy to
to="./public/fonts"

# base url
url="https://google-webfonts-helper.herokuapp.com/api/fonts/"

# now loop through all fonts
i=${#fonts[@]}
for font in "${fonts[@]}"
do
  curl -o font$i.zip ${url}"$font"
  ((i--))
done

# Check target directory.
if [ ! -d ${to} ]; then
  mkdir -p ${to};
fi

# Move and extract font
mv font*.zip ${to}
cd ${to}
i=${#fonts[@]}
for font in "${fonts[@]}"
do
  unzip font$i.zip
  ((i--))
done
rm font*.zip
