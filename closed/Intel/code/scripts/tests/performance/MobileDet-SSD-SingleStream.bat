@echo OFF

%OV_MLPERF_BIN% --scenario SingleStream ^
	--mode Performance ^
	--mlperf_conf <\path\to\ssd-mobiledet>\singlestream\mlperf.conf ^
	--user_conf <\path\to\ssd-mobiledet>\singlestream\user.conf ^
	--data_path <\path\to\dataset-coco-2017-val> ^
	--model_path <\path\to\ssd-mobiledet\ssd-mobiledet_int8.xml ^
	--model_name ssd-mobiledet ^
	--device CPU ^
	--total_sample_count 1024 ^
	--warmup_iters 50 ^
	--nireq 1 ^
	--nthreads 8 ^
	--nstreams 1