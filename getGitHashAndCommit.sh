#!/bin/bash
#echo "hello-world-servlet-example-20180305-112904.bd74846.war" | sed 's/-/\n/g' > test.txt 
splitName=$(echo "hello-world-servlet-example-20180305-112904.bd74846.war" | sed 's/-/\n/g')
strings=$(cat /opt/java_test_app/hello-world-servlet/target/test.txt | wc -l) 
let penultString=$strings-1
date=$(sed -n  "$penultString"p test.txt)
lastString=$(sed -n  "$strings"p test.txt)
time1=$(echo $lastString | cut -d'.' -f1)
hash=$(echo $lastString | cut -d'.' -f2)
export HASH=$hash

#let a=$strings-1
#echo $a # 9
echo $penultString
echo $date
echo $time1
echo $hash
echo $lastString
echo $splitName.1
