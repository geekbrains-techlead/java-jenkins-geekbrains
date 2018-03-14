#! /bin/bash
set +e
for word in $*; do parametr="$word" ; done
#Get file name 
cd "target/"
fileName=$(ls -1 *.war)
#Split file name
#echo $fileName | sed 's/-/\n/g' > /var/jenkins_home/scripts/test.txt

splitName=$(echo $fileName | sed 's/-/\n/g')
set -- $splitName
#echo $1 $2 $3 $4 $5 $6
VAR=( $splitName )
#Get number of words in the list "splitName"
numberOfWords=${#VAR[@]}
#echo $numberOfWords
#Calculate position of word with date
let datePosition=$numberOfWords-1
#Get commit's date from filename
date=$(echo $splitName | tr " " "\n"|sed -n "$datePosition"p)
#echo $date
#Get part with date and hash
timeAndHash=$(echo $splitName | tr " " "\n"|sed -n "$numberOfWords"p)
#echo $timeAndHash
timeOfCommit=$(echo $timeAndHash | cut -d'.' -f1 )
#echo $timeOfCommit
hashOfCommit=$(echo $timeAndHash | cut -d'.' -f2 )
#echo $hashOfCommit


if [ "$parametr" = "hash" ]; then 
   echo $hashOfCommit
fi
if [ "$parametr" = "date" ]; then
   echo $date-$timeOfCommit
fi

#numberOfStrings=$(cat test.txt | wc -l) 
#let penultString=$numberOfStrings-1
#date=$(sed -n  "$penultString"p test.txt)
#lastString=$(sed -n  "$strings"p test.txt)
#time1=$(echo $lastString | cut -d'.' -f1)
#hash=$(echo $lastString | cut -d'.' -f2)
#export HASH=$hash

#let a=$strings-1
#echo $penultString
#echo $date
#echo $time1
#echo $hash
#echo $lastString
#echo $splitName.1
