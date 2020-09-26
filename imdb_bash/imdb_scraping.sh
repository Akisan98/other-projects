#!/bin/bash

input="h"
input2="h"
filew="yes"
printf "\nWelcome to the IMDB image scraping script written\n
in Bash by Akisan, this script loads in the provided webpage\n
and then find the title of that page aka the movie or series name\n
and the image URL of the sharpest / the one with highest resolution.\n\n\n"

imdb_scraping() {
	titleC=$(curl -s ${input2} | grep '<h1' | cut -d '>' -f 2 | cut -d '<' -f 1 | sed 's/&nbsp;//g' | tr -s " ")
	imageC=$(curl -s ${input2} | grep ".jpg" | head -n 3 | grep '"image":' | cut -d '"' -f 4)
	
	if [ "$filew" == "yes" ]; then
			printf "$titleC -  $imageC\n" | tee -a output.txt
	elif [ "$filew" == "no" ]; then
		printf "$titleC -  $imageC\n"
	fi
	
}

toogle_writing()
{
	if [ "$filew" == "yes" ]; then
		filew="no"
		printf "\n\nWriting: OFF\n\n\n"
	elif [ "$filew" == "no" ]; then
		filew="yes"
		printf "\n\nWriting: ON\n\n\n"
	fi
}

print_mainMenu() {
	printf "Menu:\n
		file - To toogle writing t file, file is named\n
			output.txt, default=ON\n
		multi - To enable a loop of multiple searches\n
		single - To make a single search\n
		quit - To exit the program\n\n"
}

while [ "$input" != "quit" ]
do
	print_mainMenu
	read -p "Enter Command: " input
	
	if [ "$input" == "file" ]; then
		toogle_writing
	elif [ "$input" == "multi" ]; then
		input2="h"
		while [ "$input2" != "quit" ]
		do
			read -p "URL for IMDB page: " input2
			
			if [ "$input2" != "quit" ]; then
				imdb_scraping
			fi
		done
	elif [ "$input" == "single" ]; then
		read -p "URL for IMDB page: " input2
		imdb_scraping
	fi
done




# ------------------------------------------DEAD CODE------------------------------------------

#while [ "$input" != "quit" ]
#do
	#read -p "Command / URL for IMDB page: " input
	
	#if [ "$input" != "quit" ]; then
	#	imdb_scraping
	#fi
#done

#read -p "Input: " input


#titleC=$(curl -s ${input} | grep '<h1' | cut -d '>' -f 2 | cut -d '<' -f 1 | sed 's/&nbsp;//g' | tr -s " ")
#echo $titleC

#imageC=$(curl -s ${input} | grep ".jpg" | head -n 3 | grep '"image":' | cut -d '"' -f 4)
#echo $imageC

#echo "$titleC -  $imageC" | tee -a output.txt

# Henter HTML filen
# curl -s ${input}

# Regex sok 
# grep ".jpg"

# Velger nr 3
# head -n 3

# regex
# grep '"image":'

# Kutter res
# cut -d '"' -f 4

#htmlDoc="curl -s ${input}"
#html=$(eval "$htmlDoc")

#htmlDoc2=$(curl -s ${input}) 
#html=$(eval "$htmlDoc2")
#echo $htmlDoc2 | tee test.txt
#echo "HTMÅ Loaded..."



#"$(eval "$html") | grep '<h1' | cut -d '>' -f 2 | cut -d '<' -f 1 | sed 's/&nbsp;/ /g'"
#title=$(eval "$titleC")

#echo $html

#imageC=" $html | grep '.jpg' "
#image=$(eval "$imageC")

#echo $image

#printf "\nBest Poster Image on IMDB page for $title: \n"




#echo image

#curl -s ${input} | grep ".jpg" | head -n 3 | grep '"image":' | cut -d '"' -f 4
#tr -s '$%' '  '
#| perl -MHTML::Entities -pe 'decode_entities($_);' | cut -d '\n' -f 1 | tr -s '&nbsp' 'Q'
#printf "\n"
# printf "${rr}\n\n"
# https://www.imdb.com/title/tt4016454/?ref_=nv_sr_srsg_0

# ------------------------------------------DEAD CODE------------------------------------------