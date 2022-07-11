#!/bin/bash
i=1;
for argument in "$@" 
do
    head -1 $argument
    i=$((i + 1));
done	

echo "ban co muon xoa cac file tren: y/n?"
read choice
case $choice in
	y)
		i=1;
		for argument in "$@" 
		do
		    rm $argument
		    i=$((i + 1));
		done
		echo "cac file tren da xoa"
	;;
	n)
		echo"ban da khong xoa cac file"
	;;
esac
