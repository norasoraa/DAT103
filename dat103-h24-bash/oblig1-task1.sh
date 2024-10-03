#!/bin/bash

#task1
if [ -d task1-bash ]; then
rm -r task1-bash
fi 
mkdir task1-bash

#task2
cp jurassicParkCast.txt task1-bash/cast.txt

#task3
ls task1-bash

#task4
printf "\e[1;4m%*s\e[0m\n" "$(tput cols)"

#task5
tail +2 task1-bash/cast.txt | sort -t ',' -k5 -n

#task6
printf "\e[1;4m%*s\e[0m\n" "$(tput cols)"

#task7
tail +2 task1-bash/cast.txt | grep "L"

#task8
printf "\e[1;4m%*s\e[0m\n" "$(tput cols)"

#task9
awk '/F/ {print}' task1-bash/cast.txt > task1-bash/women.txt
cat task1-bash/women.txt

#task10
printf "\e[1;4m%*s\e[0m\n" "$(tput cols)"

#task11
awk '/M/ {print}' task1-bash/cast.txt > task1-bash/man.txt
cat task1-bash/man.txt

#task12
printf "\e[1;4m%*s\e[0m\n" "$(tput cols)"

#task13
for file in task1-bash/*.txt
do
baseName=$(basename "$file" .txt)
cp "$file" task1-bash/"$baseName"-1.txt
cp "$file" task1-bash/"$baseName"-2.txt
done

#task14
wc task1-bash/*
