#  Generic Setup for Model Quantization using OpenVINO (Windows Only)

In order to generate quantized model, OpenVINO, Model Optimizer & Post-Training 
Optimization toolkit must be setup first. This explains general OpenVINO INT8  
workflow. Model dependent instructions are provided under specific model folder.


#  OpenVINO Installation

## Pre-requisites

+ Microsoft Visual Studio 2019 (with MSBuild)
+ cmake 3.14 or higher
+ Python 3.6 (64-bit)

OpenVINO toolkit must be installed first. Please download [OpenVINO 2021.3](https://software.seek.intel.com/openvino-toolkit?os=windows). You need to register before being able to
download the installer.

Follow the [OpenVINO Installation](https://docs.openvinotoolkit.org/2021.3/openvino_docs_install_guides_installing_openvino_windows.html) instructions to make sure OpenVINO
is fully setup including its dependencies.

To be able to run inference benchmarks using OpenVINO, an internal representation 
of the model must be obtained first. This is handled by Model Optimizer.

# Setting up OpenVINO Model Optimizer & Generating Intermediate Representation (IR)

In order to have a better understanding of Model Optimizer, please have a look at
[Model Optimizer](https://docs.openvinotoolkit.org/2021.3/openvino_docs_MO_DG_Deep_Learning_Model_Optimizer_DevGuide.html).

Follow the [Model Optimizer Configuration](https://docs.openvinotoolkit.org/2021.3/openvino_docs_MO_DG_prepare_model_Config_Model_Optimizer.html) instructions at to configure the
Model Optimizer.

When running install_prerequisites or any other framework specific install_prerequisites,
please pay special attention to compatibility issues of some of installed packages
including numpy package. Make sure you install a compatible version of the package.

# Setting up Post-Training Optimization Toolkit

## Requires
+ Pip packages: ```scipy==1.2.1```, ```scikit-image==0.17.2```, ```numpy==1.17.5```

To setup Post-Training Optimization, follow these [instructions](https://docs.openvinotoolkit.org/2021.3/pot_InstallationGuide.html). As mentioned in the link, POT uses accuracy checker internally. Make sure
accuracy checker is installed according to the instructions provided in the link.