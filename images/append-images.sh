#!/bin/bash
index = 1
echo "Using" $1
ls $1
echo >> ../notes/$1.md
echo '## Photos' >> ../notes/$1.md
echo >> ../notes/$1.md
for f in $1/*
do
	echo "Processing $f file..." $index;
	index=$((index + 1))
  mv $f $1/$index.jpg
	echo >> ../notes/$1.md
	echo "![$index](/images/$1/$index.jpg)" >> ../notes/$1.md
	echo >> ../notes/$1.md
done

