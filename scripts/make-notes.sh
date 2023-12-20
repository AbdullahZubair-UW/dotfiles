#!/bin/bash
echo "Making Notes..."
for i in {2..22}
do
	pdftk 230notes.pdf cat "$i"-"$i" output 230"$i".pdf
	echo "Making copy $i"
done
