<!-- Header -->
<div>
  <h1>Section 5 Machine Learning</h3>  
</div>

# Introduction
This section tackles the 5th section of the Data Engineer Tech Challenge TAP. 

The prompt is as follows:
>
>Using the dataset from https://archive.ics.uci.>edu/ml/datasets/Car+Evaluation, create a >machine learning model to predict the buying >price given the following parameters:
>
>- Maintenance = High
>- Number of doors = 4
>- Lug Boot Size = Big
>- Safety = High
>- Class Value = Good


Colab Access : https://drive.google.com/file/d/15w641U7lpIQBtaJTBRKOomdV-9L8nqM0/view?usp=sharing

# Assumptions Made

(1) Treatment of _persons_ Variable<br>
_persons_ was not stated to be used as a parameter according to the prompt. Hence it is dropped in the solution. <br>
The dropping of _persons_ however resulted in 856 pairs of rows having the same values. The duplicates are dropped.

(2) Ordinality of Variables<br>
As all variables appear to be ordinal, they have been subjected to ordinal encoding as opposed to other forms of encodings.

(3) Balanced Classes<br>
It is assumed that the classes of _buying_ is balanced for the original dataset as the current dataset provided seems to suggest that. Hence imbalanced classification techniques were not applied in this notebook.

# Results
The end model is an Adaboost model that achieved a test accuracy of **30%** which is slightly better than the null accuracy of **28%**. <br>
However, this is expected considering that the variables given were not especially helpful for the prediction of the dependent variable as suggested in the EDA section. <br>

The final prediction for
>- Maintenance = High
>- Number of doors = 4
>- Lug Boot Size = Big
>- Safety = High
>- Class Value = Good

is **low**