# Mobile-BERT  Quantization

This README file covers quantization process for Mobile-BERT. Please setup the 
prerequisites as instructed at [OpenVINO calibration README](../../README.md) before
you attempt the instructions provided here.

# Initialize OpenVINO Environment

To initialize OpenVINO environment, setupvars script must be run. It is located 
at **PATH-TO-OPENVINO**\bin folder.

# Generate IR of the Network

Run the instructions provided below to generate .bin & .xml files. Please make 
sure the path to OpenVINO installation matches yours. Please also adjust the path
to your input model using --input_model option. [Mobile-BERT ONNX model](https://github.com/mlcommons/mobile/blob/master/language/bert/models_and_code/checkpoints/quant/mobilebert_squad11_int8_qdq_89.4f1.onnx) is in INT8 and quantized. Thus, an intermediate representation of the network suffices.

```
set OPENVINO_INSTALL="<PATH-TO-OpenVINO>"

python "%OPENVINO_INSTALL%\deployment_tools\model_optimizer\mo_onnx.py" ^
  --input_model <PATH-TO-Mobile-BERT-MODEL>  ^
  -b 1  ^
  --model_name mobilebert_int8 --keep_shape_op ^
  --output "Squeeze_7015,Squeeze_7016"
```




