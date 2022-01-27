#!/bin/bash

if [ $# -lt 1 ]
then
	echo "invalid number of arguments $#, should be 1"
	exit
fi

input_param_file=$1

if [ ! -f $input_param_file ]
then
	echo "$input_param_file does not exist"
	exit
fi

new_dir_list=(conf1 conf2 conf3 conf4 conf5 conf6 conf7)

cache_size_list=($((32*1024)) $((4*1024)) $((4*1024)) $((4*1024)) $((256*1024)) $((256*1024)) $((256*1024)))

assoc_list=(4 1 4 64 1 4 64)

if [ ${#cache_size_list[*]} != ${#assoc_list[*]} -o ${#cache_size_list[*]} != ${#new_dir_list[*]} ]
then
	echo "list size ${#cache_size_list[*]}, ${#assoc_list[*]}, ${#new_dir_list[*]} mismatch!"
fi

for ((i=0;i<${#cache_size_list[*]} ;i++))
do
	echo "./run_scarab.sh ${new_dir_list[i]} $input_param_file --dcache_size=${cache_size_list[i]} --dcache_assoc=${assoc_list[i]}"
	./run_scarab.sh ${new_dir_list[i]} $input_param_file --dcache_size=${cache_size_list[i]} --dcache_assoc=${assoc_list[i]}
done	

