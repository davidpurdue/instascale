# instascale
Scale all jpeg images in a directory to optimal Instagram size, adding white bars if needed to get an acceptable aspect ratio.

## Purpose
Images on Instaram are best sized to 1080 pixels wide and between 566 and 1350 pixels high (aspect ratio between 1.91:1 and 4:5)[^1].

This script will take all the jpeg files in the current directory and create scaled copies in an Instagram subdirectory (the directory will be created if needed).
White bars will be added top and bottom or to the sides to make sure the copied image has an aspect ratio that fit the Instagram limitations.

## Prerequisites
Imagemagick[^2] version 7 must be installed and the `magick` command must be in the `PATH`

## Installation
Copy `instascale.sh` into a directory on you `PATH`, e.g. `$HOME/bin`

## Usage
1. `cd` to the directory with the jpeg files that need resizing
1. run `instascale.sh`
1. check the `Instagram` folder for modified jpeg files

## References
[^1]: [The Best Instagram Image Size Guide 2022: All You Need](https://louisem.com/37587/whats-the-best-instagram-image-size)
[^2]: [ImageMagick](https://imagemagick.org/)
