## Requirements

+ Microsoft Visual Studio: 16 2019 (with MSBuild)
+ [cmake](https://cmake.org/download/): 3.15.4 or higher. Download Windows installer, Make sure to check option to add cmake to PATH. Alternatively, Microsoft Visual Studio cmake may be used. You only need to add it to PATH.
+ [Boost](https://www.boost.org/users/history/version_1_72_0.html)
+ [wget](https://eternallybored.org/misc/wget/): Add wget bin folder to PATH.
+ [shellcheck tool](https://github.com/koalaman/shellcheck#installing): If you download pre-compiled binaries and execution file is shellcheck-stable.exe,rename the execution file to shellcheck and make sure you add it to PATH.
+ Numpy

## Build Instructions

There are several components to build before building MLPerf inference benchmark.
Follow the instructions given bellow.

### Build Gflags

```
    git clone https://github.com/gflags/gflags.git
    cd gflags
    mkdir gflags-build && cd gflags-build
    cmake -DBUILD_SHARED_LIBS=ON ..
    cmake --build . --config Release
```

### Build Boost-Filesystem
    
+ Download [Boost 1.72.0](https://www.boost.org/users/history/version_1_72_0.html)
+ Unzip to boost_1_72_0
+ Build the ```filesystem``` library:
```
    cd boost_1_72_0
    bootstrap --with-libraries=filesystem 
    b2 --with-filesystem
```

### Build OpenVINO Runtime

First download and install [wget](https://eternallybored.org/misc/wget/). Add wget bin folder to your user PATH.

+ Generate OpenVINO.sln
```
    git clone https://github.com/openvinotoolkit/openvino.git
    cd openvino
    git checkout 60059f2c755
    git submodule update --init --recursive
    mkdir build && cd build
    cmake -DENABLE_VPU=OFF ^
    	-DENABLE_CLDNN=ON ^
    	-DENABLE_GNA=OFF ^
    	-DENABLE_TESTS=OFF ^
    	-DNGRAPH_ONNX_IMPORT_ENABLE=OFF ^
        -DTHREADING=OMP ..
````

+ Open OpenVINO.sln in Visual Studio (16 2019), and build ```Release``` configuration
+ Build projects one by one 
+ Runtime libraries are located in ```openvino\bin\intel64\Release```

### Build MLPerf Loadgen
Loadgen version: commit ```10aa90b319bd7f921dedb6050d12041aefd75c7e```

```
    pip install absl-py numpy
    git config --global core.longpaths true
    git clone --recurse-submodules https://github.com/mlcommons/inference.git mlperf-inference
    cd mlperf-inference\loadgen
    git checkout 8507b86bb
    mkdir build && cd build
    cmake ..
    cmake --build . --config Release
    copy Release\mlperf_loadgen.lib ..\
```

### Build MLPerf-OpenVINO Backend

```
    cd <INTEL-MLEPRF-MOBILE-BENCHMARK>\closed\intel\code\common
    mkdir build && cd build
    set MSBUILD="<PATH-TO-MSBuild.exe>"
    cmake -G "Visual Studio 16 2019" ^
    		-DInferenceEngine_DIR=<PATH-TO-OPENVINO>\build ^
    		-DLOADGEN_DIR=<PATH-TO-MLPERF-INFERENCE>\loadgen ^
    		-DBOOST_INCLUDE_DIRS=<PATH-TO-boost_1_72_0> ^
    		-DBOOST_FILESYSTEM_LIB=<PATH-TO-boost_1_72_0>\stage\lib\libboost_filesystem-vc142-mt-x64-1_72.lib ^
    		-Dgflags_DIR=<PATH-TO-gflags>\gflags-build ^
    		-DOpenCV_DIR=<PATH-TO-OPENVINO>\inference-engine\temp\opencv_4.5.1\opencv\cmake ^
    		-DCMAKE_BUILD_TYPE=Release ^
    		..
    		
    call %MSBUILD% ov_mlperf.sln /p:Configuration=Release /p:Platform=x64 /clp:ErrorsOnly /m
```

The built binary will be located at ```common\Release\ov_mlperf.exe```

## Run Benchmark
Refer to [tests README](scripts/tests/README.md) to find out how to run the tests.