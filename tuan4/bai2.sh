#!/bin/sh
echo "Nhap vao mot so:"
	read so
	if [ $so -lt 0 ]
	then
	 echo "$so la so am"
	else
	 if [ $so -gt 0 ]
	  then
	   echo "$so la so duong"
	 else
	   echo "$o la so 0"
	 fi
	fi
