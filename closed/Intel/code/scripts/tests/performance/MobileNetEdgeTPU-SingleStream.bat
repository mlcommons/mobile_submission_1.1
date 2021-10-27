@echo OFF

%OV_MLPERF_BIN% --scenario SingleStream ^
	--mode Performance ^
	--mlperf_conf <\path\to\mobilenet-edge>\singlestream\mlperf.conf ^
	--user_conf <\path\to\mobilenet-edge>\singlestream\user.conf ^
	--data_path <\path\to\dataset-imagenet-ilsvrc2012-val> ^
	--model_path <\path\to\mobilenet-edge\mobilenet-edge_int8.xml> ^
	--model_name mobilenet-edge ^
	--device CPU ^
	--total_sample_count 1024 ^
	--warmup_iters 50 ^
	--nireq 1 ^
	--nthreads 8 ^
	--nstreams 1