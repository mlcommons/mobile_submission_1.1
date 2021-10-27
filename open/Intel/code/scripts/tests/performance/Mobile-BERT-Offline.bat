@echo OFF

%OV_MLPERF_BIN% --scenario Offline ^
	--mode Performance ^
	--mlperf_conf <\path\to\mobilebert>\offline\mlperf.conf ^
	--user_conf <\path\to\mobilebert>\offline\user.conf ^
	--data_path <\path\to\SQuAD-dataset> ^
	--model_path <\path\to\mobilebert\mobilebert_int8.xml> ^
	--model_name mobilebert ^
	--device MULTI:GPU,CPU ^
	--total_sample_count 10833 ^
	--warmup_iters 50 ^
	--nireq 16 ^
	--nthreads 8 ^
	--nstreams GPU:2,CPU:4 ^
	--batch_size 1