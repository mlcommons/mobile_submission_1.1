#  MobileNetEdgeTPU Quantization

This README file covers quantization process for MobileNetEdgeTPU. Please setup the 
prerequisites as instructed at [OpenVINO calibration README](../../README.md) before
you attempt the instructions provided here.

# Initialize OpenVINO Environment

To initialize OpenVINO environment, setupvars script must be run. It is located 
at **PATH-TO-OPENVINO**\bin folder. For OpenVINO version 2021.3,it is typical installed at "C:\Program Files (x86)\Intel\openvino_2021.3.394".

# Generate IR of the Network

Run the instructions provided below to generate .bin & .xml files. 

You may obtain ```.pb``` file for MobileNetEdgeTPU from [here](https://github.com/mlcommons/mobile/tree/master/vision/mobilenet/models_and_code/checkpoints/float/edge_frozen_graph.pb) option. Once these are run three files are generated including .xml, .bin, and .mapping files.

```
set OPENVINO_INSTALL="<PATH-TO-OpenVINO>"

python "%OPENVINO_INSTALL%\deployment_tools\model_optimizer\mo_tf.py" ^
	--input_model PATH\TO\MOBILENET-EDGE-MODEL ^
	--output_dir IR ^
	--data_type FP32 ^
	--model_name mobilenet-edge ^
	--mean_values [127.5,127.5,127.5] ^
	--scale_values [127.5,127.5,127.5]
```

# Run Post-Training Quantization

The post-training quantization requires the 2012 imagenet validation dataset and a calibration list of images to use.

The required set of calibration images may be obtained from [here](https://github.com/mlcommons/mobile/tree/master/calibration/ImageNet/cal_image_list_option_1.txt).

Since it does not have ground truth labels, we have provided same list with assigned labels in ```cal_image_list_option_1.txt```.

Before running the ```pot``` app, please adjust relevant paths in ```mobilenetEdgeTPU.yml``` as well as ```mobilenetEdgeTPU.json``` files accordingly.

```
pot -c mobilenetEdgeTPU.json --output-dir quantized-int8
```

After successful quantization, the quantized IRs are located in ```quantized-int8\mobilenet-edge_int8_DefaultQuantization\yy-mm-dd_hh-mm-ss\optimized```.
