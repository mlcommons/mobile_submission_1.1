#  MobileNetV2-DeepLabV3+  Quantization

Quantization process for MobileNetV2-DeepLabV3+ is covered here. Please setup the prerequisites as instructed at [OpenVINO calibration README](../../README.md) before you attempt the instructions provided here.

# Initialize OpenVINO Environment

To initialize OpenVINO environment, setupvars script must be run. It is located 
at **PATH-TO-OPENVINO**\bin folder.

# Generate IR

Run the instructions provided below to generate .bin & .xml files. Please make 
sure the path to OpenVINO installation matches yours. Obtain MobileNetV2-DeepLabV3+ model.
Please also adjust the path to the input model using [--input_model](https://github.com/mlcommons/mobile/tree/master/vision/deeplab/models_and_code/checkpoints/float/freeze.pb) option. Once,
these are run three files are generated including .xml, .bin, and .mapping files.

```
set OPENVINO_INSTALL="<PATH-TO-OPENVINO>"

python %OPENVINO_INSTALL%\deployment_tools\model_optimizer\mo_tf.py ^
	--input_model PATH\TO\MODEL.pb ^
	--input_shape=[1,512,512,3] ^
	--output_dir FP16 ^
	--data_type FP16 ^
	--model_name deeplabv3_fp16 ^
	--mean_values "[127.5, 127.5, 127.5]" ^
	--scale_values "[127.5, 127.5, 127.5]"
```

# Run Post-Training Quantization

Obtain ADE20K dataset before running pot command below. ADE20K dataset may be obtained
from [here](http://data.csail.mit.edu/places/ADEchallenge/ADEChallengeData2016.zip).
Using [MLPERF Calibration List](https://github.com/mlcommons/mobile/blob/master/vision/deeplab/models_and_code/checkpoints/post_train_quant/ptq.txt), create validation set (You may use the ```organize_calibration_set.py``` script.)
Adjust paths according to your setup in .json and .yml files. 

```
pot -c deeplabv3.json --output-dir quantized-model
```

After successful quantization, model IR files are located in ```quantized-model/deeplabv3_int8_DefaultQuantization/<yy-mm-dd_hh-mm-ss/optimized```


