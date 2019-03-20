#!/bin/bash
index = 1
echo >> $1.md
echo '## Photos' >> $1.md
echo >> $1.md
for f in $1/*
do
	echo "Processing $f file..." $index;
	index=$((index + 1))
	mv $f $1/$index.jpg
	echo >> $1.md
	echo "![$index]($1/$index.jpg)" >> $1.md
	echo >> $1.md
done