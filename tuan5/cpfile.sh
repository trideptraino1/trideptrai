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
			for argument in "$@" 
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
