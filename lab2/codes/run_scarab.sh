#!/bin/bash

if [ $# -lt 2 ]
then
	echo "invalid number of arguments $#, should be 2"
	exit
fi

input_new_dir=$1
input_param_file=$2
input_bench_location="/mnt/d/github/210_arch/benchamrks"
input_excutable=$(command -v scarab)

if [ ! -f $input_param_file ]
then
	echo "$input_param_file does not exist"
#	exit
fi

if [ ! -d $input_file_location ]
then 
	echo "$input_file_location is not a directory"
#	exit
fi

if [ ! -d $input_bench_location ]
then 
	echo "$input_bench_location is not a directory"
#	exit
fi

if [ ! -f $input_excutable ]
then 
	echo "$input_excutable does not exist"
#	exit
fi

mkdir -p $input_new_dir

declare -A bench_list=(
["drmemtrace.deepsjeng.553743.1618.dir"]="drmemtrace.deepsjeng.553743.6815.trace.gz"
["drmemtrace.exchange2.553888.1738.dir"]="drmemtrace.exchange2.553888.0626.trace.gz"
["drmemtrace.leela_s_base.mytest-m64.555086.8417.dir"]="drmemtrace.leela_s_base.mytest-m64.555086.2935.trace.gz"
["drmemtrace.mcf_s_base.mytest-m64.554166.9011.dir"]="drmemtrace.mcf_s_base.mytest-m64.554166.7956.trace.gz"
["drmemtrace.omnetpp.552936.5555.dir"]="drmemtrace.omnetpp.552936.3514.trace.gz"
["drmemtrace.perlbench_s_base.mytest-m64.554262.0160.dir"]="drmemtrace.perlbench_s_base.mytest-m64.554262.9223.trace.gz"
["drmemtrace.sgcc_base.mytest-m64.555062.6619.dir"]="drmemtrace.sgcc_base.mytest-m64.555062.3859.trace.gz"
["drmemtrace.specrand_i.553922.3230.dir"]="drmemtrace.specrand_i.553922.2837.trace.gz"
["drmemtrace.x264.555077.8155.dir"]="drmemtrace.x264.555077.8068.trace.gz"
["drmemtrace.xalancbmk_s_base.mytest-m64.555084.9837.dir"]="drmemtrace.xalancbmk_s_base.mytest-m64.555084.7482.trace.gz"
)

for bench in "${!bench_list[@]}"
do
#	echo "bench: $bench"
	executing_location="${input_new_dir}/${bench}"
	mkdir -p $executing_location
done

for bench in "${!bench_list[@]}"
do
	executing_location="${input_new_dir}/${bench}"
	executing_param_file="${executing_location}/PARAMS.in"
	cp $input_param_file $executing_param_file
done

round=1
for bench in "${!bench_list[@]}"
do
	executing_location="${input_new_dir}/${bench}"
	trace_location="${input_bench_location}/${bench}/trace/${bench_list[$bench]}"
	module_location="${input_bench_location}/${bench}/raw/"
	printf "%s th run\n" $round
	let "round+=1"
	printf "%-25s %s\n" "excuting in" $executing_location
	printf "%-25s %s\n" "trace location" $trace_location
	printf "%-25s %s\n" "module log location" $module_location
	
	(cd $executing_location && exec $input_excutable --frontend memtrace --cbp_trace_r0=$trace_location --memtrace_modules_log=$module_location)
	
	printf "finished\n\n"
	#break
done

# if [ $(ps -ef | grep -c "ssh") -gt 1 ]; then echo "true"; fi

:<<!
mkdir input_new_dir
new_dir=current+input_new_dir

bench_list={}

foreach bench
exec_location=new_dir+bench
mkdir $exec_location

foreach bench
exec_location=new_dir+bench
cp input_param_name location

foreach bench
exec_location=new_dir+bench
cd location
trace_location=input_file_location+bench
cmd = ...trace_location+...
exec cmd
cd ..
!
