@echo OFF

%OV_MLPERF_BIN% --scenario Offline ^
	--mode Performance ^
	--mlperf_conf <\path\to\mobilenet-edge>\offline\mlperf.conf ^
	--user_conf <\path\to\mobilenet-edge>\offline\user.conf ^
	--data_path <\path\to\dataset-imagenet-ilsvrc2012-val> ^
	--model_path <\path\to\mobilenet-edge\mobilenet-edge_int8.xml> ^
	--model_name mobilenet-edge ^
	--device MULTI:GPU,CPU ^
	--total_sample_count 1024 ^
	--warmup_iters 50 ^
	--nireq 16 ^
	--nthreads 8 ^
	--nstreams GPU:4,CPU:4 ^
	--batch_size 16