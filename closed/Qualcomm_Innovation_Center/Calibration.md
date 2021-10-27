# Post-Training Quantization

SNPE uses following post-training quantization procedures. In general, uniform, asymmetric, per-tensor quantization is used for both weights and activations.

## Weights and Biases
Each weight tensor is quantized using the standard tensorflow quantization method described in the SNPE documentation. 

## Activations
For each activation tensor, the dynamic range is determined based on min and max values obtained when running inference over a set of representative input dataset (e.g., calibration images). This dynamic range sets the clipping boundaries for the uniform quantizer.
