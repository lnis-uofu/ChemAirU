# Week11 Notes

- Study PhD Student Thesis.

## Artificial intelligence (AI)study.

Videos to learn about how to make AI.

https://www.youtube.com/watch?v=z1PGJ9quPV8


## Comments:

Web to use coding online:

https://colab.research.google.com/drive/143nk-xWfLxMR0e2CqtwFd9Gsk6d5V80M?authuser=5#scrollTo=2ltleEoPnjxW

If you get an error at the end that is something like 
"ValueError: Input 0 of layer "sequential_1" is incompatible with 
the layer: expected shape=(None, 455, 30), found shape=(None, 30)" 
then replace the 1st line the segment "model.add" instead of 
"model.add(tf.keras.layers.Dense(256, input_shape=x_train.shape, activation='sigmoid'))" 
use "model.add(tf.keras.layers.Dense(256, input_shape=x_train.shape[1:], activation='sigmoid'))"
. Most importantly recompile all segments both from start to finish after making this change.


