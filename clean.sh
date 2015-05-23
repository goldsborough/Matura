f=( 'aux' 'log' 'gz' 'fdb' );

count=0

for i in $(find . -type f); do

    if [ ! $(echo $i | egrep ".git" ) ]; then

	for j in ${f[@]}; do

	    if [ $(echo ${i##*.} | egrep $j) ]; then
	   	echo "Removing $i"
		rm $i
		let count++
	    fi
	done
    fi
done

echo "Removed $count file(s)"
