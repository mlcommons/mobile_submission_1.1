# MobileDet-SSD Quantization

This README file covers quantization process for MobileDet-SSD. Please setup the 
prerequisites as instructed at [OpenVINO calibration README](../../README.md) before
you attempt the instructions provided here.

# Initialize OpenVINO Environment

To initialize OpenVINO environment, setupvars script must be run. It is located 
at **PATH-TO-OPENVINO**\bin folder.

# Generate IR

Run the instructions provided below to generate .bin & .xml files.

You may obtain the ```.pb``` and ```pipeline.config``` files for SSD-MobileDet from [here](https://github.com/mlcommons/mobile/tree/master/vision/mobiledet/fp32/export_inference_graph)

```
set OPENVINO_INSTALL="<PATH-TO-OpenVINO>"

python %OPENVINO_INSTALL%\deployment_tools\model_optimizer\mo_tf.py ^
	--input_model frozen_inference_graph ^
	--output_dir IR ^
	--model_name ssd-mobiledet ^
	--output detection_classes,detection_boxes,detection_scores,num_detections ^
	--transformations_config %OPENVINO_INSTALL%\deployment_tools\model_optimizer\extensions\front\tf\ssd_support_api_v1.15.json ^
	--tensorflow_object_detection_api_pipeline_config pipeline.config ^
	--input_shape="[1,320,320,3]" ^
	--input image_tensor
```

# Run Post-Training Quantization
The required [mlperf calibration set](https://github.com/mlcommons/mobile/blob/master/calibration/COCO/coco_cal_images_list.txt) is a subset of the mscoco 2017 train set (about 18GB). You may download from [here](http://images.cocodataset.org/zips/train2017.zip)

We have generated the annotations file fro the calibration set: ```annotations/calibration_instances_train2017.json```

Before running the quantization app (```pot```), please adjust relevant paths in the ```.json``` and ```.yml``` files accordingly.

```
pot -c ssd-mobiledet.json --output-dir quantized-int8
```

After successful quantization, the quantized IRs are located in ```quantized-int8\ssd-mobiledet_int8_DefaultQuantization\yy-mm-dd_hh-mm-ss\optimized```

