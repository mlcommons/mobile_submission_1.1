@echo OFF

%OV_MLPERF_BIN% --scenario Offline ^
	--mode Performance ^
	--mlperf_conf <\path\to\deeplabv3>\offline\mlperf.conf ^
	--user_conf <\path\to\deeplabv3>\offline\user.conf ^
	--data_path <\path\to\ADE20K\images\validation> ^
	--model_path <\path\to\deeplabv3\deeplabv3_int8.xml> ^
	--model_name deeplabv3 ^
	--device GPU ^
	--total_sample_count 2000 ^
	--warmup_iters 50 ^
	--nireq 32 ^
	--nthreads 8 ^
	--nstreams 32 ^
	--batch_size 1