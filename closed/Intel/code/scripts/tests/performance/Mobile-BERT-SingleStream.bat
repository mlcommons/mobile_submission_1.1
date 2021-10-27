@echo OFF

%OV_MLPERF_BIN% --scenario SingleStream ^
	--mode Performance ^
	--mlperf_conf <\path\to\mobilebert>\singlestream\mlperf.conf ^
	--user_conf <\path\to\mobilebert>\singlestream\user.conf ^
	--data_path <\path\to\SQuAD-dataset> ^
	--model_path <\path\to\mobilebert\mobilebert_int8.xml> ^
	--model_name mobilebert ^
	--device CPU ^
	--total_sample_count 10833 ^
	--warmup_iters 50 ^
	--nireq 1 ^
	--nthreads 8 ^
	--nstreams 1 ^