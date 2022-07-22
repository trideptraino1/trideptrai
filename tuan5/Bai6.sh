function defile(){
	arr=("$@")
	i=1;
	for argument in "${arr[@]}";
	do
	    head -1 $argument
	    i=$((i + 1));
	done	
    echo "ban co muon xoa cac file tren: y/n?"
	read choice
	case $choice in
		y)
			i=1;
			for argument in "${arr[@]}"
			do
			    rm $argument
			    i=$((i + 1));
			done
			echo "cac file tren da xoa"
		;;
		n)
			echo "ban da khong xoa cac file"
		;;
	esac
}
function cpfile(){
	arr=("$@")
	echo "Nhap vao ten mot folder: "
	read DIR
	if [ -d "$DIR" ]; then
	  ### Take action if $DIR exists ###
		echo "Thu muc nhap vao ton tai"
		if [ -w ${DIR} ]
			then
				echo "Thu muc co quyen gi"
				i=1;
				copyCount=0;
				for argument in "${arr[@]}"
				do
					if [ -f $DIR/$argument ] ; then
				    		echo "file $argument da ton tai."
					else
						cp $argument $DIR
						echo "file $argument da duoc copy."
						copyCount=$((copyCount + 1))
					fi
				done
						echo "So luong file da copy: $copyCount"
					exit 1
		fi
	else
	  ###  Control will jump here if $DIR does NOT exists ###
	  mkdir $DIR
	  exit 1
	fi
}
function countfile(){
	echo "Nhap vao ten mot folder: "
	read DIR
	if [ -d "$DIR" ]; then
	  ### Take action if $DIR exists ###
		echo "Thu muc nhap vao ton tai"
		
		if [ -r ${DIR} ]
			then
				echo "Thu muc co quyen doc"
				echo -e "So luong folder trong thu muc la: $(find $DIR -type d | wc -l)"
				echo -e "So luong file trong thu muc la:$(find $DIR ! -type d ! -name '.*' | wc -l) "		
				echo -e "So luong hard link trong thu muc la: $(find $DIR -type f -links +1 | wc -l)"
				echo -e "So luong symbolic link trong thu muc la: $(find $DIR -type l | wc -l)"
				
		fi
	else
	  ###  Control will jump here if $DIR does NOT exists ###
	  exit 1
	fi
}
function renamefile(){
	arr=("$@")
	stt=0
	echo "nhap phan dau ten file moi: "
	read name	
	echo "Cac File da doi ten: "
	for argument in "${arr[@]}"
	do
		stt=$((stt + 1))
		if [ -f $argument ] ; then
			
			newName="$name$stt"
			mv $argument $newName && echo -e "$argument -> $newName"
			
		else
			echo "file $argument khong ton tai"
		fi
	done
}
function calculate(){
	result=$(($1))
	echo "$1 = $result"
}
echo "1. Xoa cac file
2. Copy file vao mot thu muc bat ky
3. Dem file, thu muc, hardlink va symbolic link
4. Doi ten file theo yeu cau
5. Basic calculator"
echo "Nhap yeu cau:"
read choice;
case $choice in 
	1)	
		defile $@
	;;
	2)
		cpfile $@
	;;
	3)	
		countfile
	;;
	4)
		renamefile $@
	;;
	5)	
		echo "Nhap vao doi so thu nhat: "
		read soThuNhat
		echo "Nhap vao phep toan: "
		read phepToan
		echo "Nhap vao doi so thu hai: "
		read soThuHai
		argument="${soThuNhat}${phepToan}${soThuHai}"
		calculate $argument
	;;
esac  
