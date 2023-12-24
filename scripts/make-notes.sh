#!/bin/bash
echo "Making Notes..."
for i in {2..8}
do
	pdftk notes.pdf cat "$i"-"$i" output 146"$i".pdf
	echo "Making copy $i"
done
