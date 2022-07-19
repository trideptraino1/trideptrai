stt=0
echo "nhap phan dau ten file moi: "
read name	
echo "Cac File da doi ten: "
for argument in "$@" 
do
	stt=$((stt + 1))
	if [ -f $argument ] ; then
		
		newName="$name$stt"
		mv $argument $newName && echo -e "$argument -> $newName"
		
	else
		echo "file $argument khong ton tai"
	fi
done
