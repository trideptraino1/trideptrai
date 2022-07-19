@@ -4,7 +4,30 @@ function dem(){
	so_tm=0
	so_symbolic_link=0
	so_hard_link=0
	echo -e "\n=>Dang nghien cuu "
	file_khac=0
	for name in `ls $1`
		do
			if [ -L $1/$name ]
				then
					so_symbolic_link=$((so_symbolic_link+1))
			elif [ "$(stat -c %h -- "$1/$name")" -gt 1 ]
				then
					so_hard_link=$((so_hard_link+1))
			elif [ -f $1/$name ]
				then 
					so_file=$((so_file+1))
			elif [ -d $1/$name ]
				then
					so_tm=$((so_tm+1))
			else
				file_khac=$((file_khac+1))
			fi
	done
	echo -e "So file la: $so_file"
	echo -e "\nSo thu muc là: $so_tm"
	echo -e "\nSo symbolic link là: $so_symbolic_link"
	echo -e "\nSo hardlink là: $so_hard_link"
	echo -e "\nSo file khong thuoc cac dang tren: $file_khac"
}
function kiemtra(){
	if [ -d $1 ]
@@ -21,6 +44,5 @@ function kiemtra(){
		echo "$1 khong phai la mot thu muc"
	fi
}
echo -n "Nhap ten thu muc: "
read thumuc
thumuc=$1
kiemtra $thumuc 
