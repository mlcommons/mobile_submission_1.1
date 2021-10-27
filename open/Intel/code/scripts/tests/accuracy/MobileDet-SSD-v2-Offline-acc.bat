@echo OFF

%OV_MLPERF_BIN% --scenario Offline ^
	--mode Accuracy ^
	--mlperf_conf <\path\to\ssd-mobilenet-v2>\offline\mlperf.conf ^
	--user_conf <\path\to\ssd-mobilenet-v2>\offline\user.conf ^
	--data_path <\path\to\dataset-coco-2017-val> ^
	--model_path <\path\to\ssd-mobilenet-v2\ssd-mobilenet-v2_int8.xml ^
	--model_name ssd-mobilenet-v2 ^
	--device GPU ^
	--total_sample_count 5000 ^
	--warmup_iters 0 ^
	--nireq 16 ^
	--nthreads 8 ^
	--nstreams 8 ^
	--batch_size 8