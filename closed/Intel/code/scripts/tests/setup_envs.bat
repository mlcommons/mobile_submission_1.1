@echo OFF

set OV_MLPERF_BIN=<\path\to\ov_mlperf.exe>

set GFLAGS_LIB_DIR=<\path\to\gflags>\gflags-build\bin\Release
set OPENVINO_LIB_DIR=<\path\to\openvino>\bin\intel64\Release
set OPENCV_LIB_DIR=<\path\to\openvino>\inference-engine\temp\opencv_4.5.1\opencv\bin
set OMP_LIB_DIR=<\path\to\openvino>\inference-engine\temp\omp\lib

set PATH=%GFLAGS_LIB_DIR%;%OPENVINO_LIB_DIR%;%OPENCV_LIB_DIR%;%OMP_LIB_DIR%;%PATH%
