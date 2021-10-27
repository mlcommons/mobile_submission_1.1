@echo OFF

%OV_MLPERF_BIN% --scenario SingleStream ^
	--mode Accuracy ^
	--mlperf_conf <\path\to\ssd-mobilenet-v2>\singlestream\mlperf.conf ^
	--user_conf <\path\to\ssd-mobilenet-v2>\singlestream\user.conf ^
	--data_path <\path\to\dataset-coco-2017-val> ^
	--model_path <\path\to\ssd-mobilenet-v2\ssd-mobilenet-v2_int8.xml ^
	--model_name ssd-mobilenet-v2 ^
	--device CPU ^
	--total_sample_count 5000 ^
	--warmup_iters 0 ^
	--nireq 1 ^
	--nthreads 8 ^
	--nstreams 1