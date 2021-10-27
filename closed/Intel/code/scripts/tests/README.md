# Run Tests

First modify the paths in ```setup_envs.bat``` as appropriate, then run it in the
command prompt.

## Performance

Below is the format in which **Performance** benchmark can be run.

```
tests\performance\<model>-<scenario>.bat
```

For instance to run ```MobileNetEdgeTPU``` **Offline**:
```
run-scripts\performance\MobileNetEdgeTPU-Offline.bat
```

+ For MobileDet-SSD:

Datasets for this workload can be obtained from the below links
1. [Annotations](http://images.cocodataset.org/annotations/annotations_trainval2017.zip)
2. [Training dataset](http://images.cocodataset.org/zips/trainl2017.zip)
3. [Validation dataset](http://images.cocodataset.org/zips/val2017.zip)

# Accuracy

The accuracy benchmarks follow the closely those of the MLPerf main inference:
+ User first runs the benchmark in ```Accuracy``` mode to generate ```mlperf_log_accuracy.json```
+ User then runs a dedicated accuracy calculation command

Syntax to generate Accuracy logs:

```
tests\accuracy\<model>-<scenario>.bat
```

For instance:

```
tests\accuracy\MobileNetEdgeTPU-Offline.bat
```

+ To compute the **Top-1** accuracy for MobileNetEdgeTPU, run the command below:
```
python <\path\to\mlperf-inference>\vision\classification_and_detection\tools\accuracy-imagenet.py --mlperf-accuracy-file mlperf_log_accuracy.json ^
    --imagenet-val-file <\path\to\dataset-imagenet-ilsvrc2012-val>\val_map.txt ^
    --dtype float32
```

+ For MobileDet-SSD:
```
python <\path\to\mlperf-inference>\vision\classification_and_detection\tools\accuracy-coco.py --mlperf-accuracy-file mlperf_log_accuracy.json ^
    --coco-dir <\path\to\dataset-coco-2017-val>
```

+ For MobileNetV2-DeepLabV3+
```
python ade20k-tools\accuracy-ade20k.py --mlperf-accuracy-file mlperf_log_accuracy.json ^
    --ade20k-dir <\path\to\ADE20K> ^
    --ade20k-val-list <\path\to\ADE20K-validation-list.txt>
    --num-classes 32 ^
```

+ For Mobile-BERT

This requires a specific setup instructions found in **measurements\TGL-i7-1195G7-OpenVINO\Mobile-BERT\Offline**
```
python <\path\to\mlperf-inference>\language\bert\accuracy-squad.py --vocab_file \path\to\SQuAD-dataset\vocab.txt --log_file mlperf_log_accuracy.json --val_data \path\to\SQuAD-dataset\dev-v1.1.json --out_file mobilebert.json
```