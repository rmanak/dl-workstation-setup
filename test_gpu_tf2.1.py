import tensorflow as tf

if tf.test.is_gpu_available():
    print("Yes found GPU!")
else:
    print("Oh No!!! :-(")
