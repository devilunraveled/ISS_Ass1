#!/bin/bash

size=$(stat -c%s "$1")
cp $1 t.txt
echo "Size of file is : $size bytes"

echo "Number of lines in the file is : $(sed -n '$=' $1)"

echo "Number of words in the file is : $(wc --words < $1)"

num=1
while IFS= read -r line
do
	echo "Line $num: $(wc -w <<< "$line") words"
	let "num++"
done < $1

sed -e  ' s/[^A-Za-z]/ /g' $1 | tr 'A-Z' 'a-z' | tr ' ' '\n' | grep -v '^$'| sort | uniq -c | sort -rn > temp.txt

sed "s/^[ \t]*//" -i temp.txt

while IFS= read -r quote;
do
        Num=${quote% *}
	Word=${quote#* }
	if [ $Num>$1 ];
	then 		
       		echo "Word: $Word - Count Of Repetition: $Num"
        fi
done < temp.txt
rm temp.txt
cp t.txt $1
rm t.txt
