#!/bin/zsh

while read line
do
    cp -R ~/$line .
done < list.txt