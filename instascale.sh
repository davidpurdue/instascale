#!/usr/bin/env bash

#
# instascale.sh - resize images for Instagram
#

# Copyright 2022 David Purdue
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# START SCRIPT
#

# check that the Instagram directory is there.
if [ ! -d Instagram ]
then
    mkdir Instagram
fi

for image in *.jpg
do
    if [ -f "Instagram/$image" ]
    then
        echo "Skipping $image - already done"
        continue
    fi

    echo "Working on $image"

    # Get the dimensions of the original image
    old_width=$(magick identify -format "%[fx:w]" "$image")
    old_height=$(magick identify -format "%[fx:h]" "$image")

    # Calculate the dimentions of the new image
    new_width=1080
    new_height=$(($old_height * $new_width / $old_width))

    # Check that new height is within the accepted bounds for Instagram aspect ratios.
    if [ $new_height -gt 1350 ]
    then
        new_height=1350
    fi
    if [ $new_height -lt 566 ]
    then
        new_height=566
    fi

    # Resize the image
    magick "$image" -resize ${new_width}x${new_height} -background white -compose Copy -gravity center -extent ${new_width}x${new_height} -quality 90 "Instagram/$image"
done
