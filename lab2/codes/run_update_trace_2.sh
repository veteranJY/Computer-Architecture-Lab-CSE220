#!/bin/bash

input_bench_location="/mnt/d/github/210_arch/benchamrks"

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
	python2 updateTraceModulePaths.py "${input_bench_location}/${bench}"
done