echo > speech.txt
rm speech.txt

while IFS= read -r quote;
do
	if [ ! -z "$quote" ];
	then
		Quote=${quote% ~*}
		Person=${quote#*~}
		echo "$Person once said \"$Quote\"" >> speech.txt
	else
	        echo  >> speech.txt
	fi	       
done < quotes.txt
