gawk '!seen[$0]++' $1 > temp.txt
sed -i '/^$/d' temp.txt
cat temp.txt
rm temp.txt
