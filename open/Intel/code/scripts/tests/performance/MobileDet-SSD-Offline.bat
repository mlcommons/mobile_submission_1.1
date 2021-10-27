@echo OFF

%OV_MLPERF_BIN% --scenario Offline ^
	--mode Performance ^
	--mlperf_conf <\path\to\ssd-mobiledet>\offline\mlperf.conf ^
	--user_conf <\path\to\ssd-mobiledet>\offline\user.conf ^
	--data_path <\path\to\dataset-coco-2017-val> ^
	--model_path <\path\to\ssd-mobiledet\ssd-mobiledet_int8.xml ^
	--model_name ssd-mobiledet ^
	--device GPU ^
	--total_sample_count 1024 ^
	--warmup_iters 50 ^
	--nireq 16 ^
	--nthreads 8 ^
	--nstreams 8 ^
	--batch_size 8