<!-- Header -->
<div>
  <h1>Section 1 Machine Learning</h3>  
</div>

# Introduction
This section tackles the 1st section of the Data Engineer Tech Challenge TAP. 

The prompt is as follows:
>The objective of this section is to design and implement a solution to process a data file on a regular interval (e.g. daily). Assume that there are 2 data files `dataset1.csv` and `dataset2.csv`, design a solution to process these files, along with the scheduling component. The expected output of the processing task is a CSV file including a header containing the field names.
>You can use common scheduling solutions such as `cron` or `airflow` to implement the scheduling component. You may assume that the data file will be available at 1am everyday. Please provide documentation (a markdown file will help) to explain your solution.
>
>Processing tasks:
>
>- Split the `name` field into `first_name`, and `last_name`
>- Remove any zeros prepended to the `price` field
>- Delete any rows which do not have a `name`
>- Create a new field named `above_100`, which is `true` if the price is strictly greater than 100
>
>_Note: please submit the processed dataset too._


# Assumptions

(1) Additional cleaning is required before the tasks in the prompt can be performed.
<br>
Additional Cleaning performed:<br>
1. Swap price and name if name is in the price column.
i.e.  <br>

| Name  | Price |
| ------------- | ------------- |
| NA  | Mr. John Wick  |
| Mr. John Wick  | NA  |

Where the first row refers to the Orginal and the second row refers to the swaped.

2. Name suffixes and titles should be removed. I.e. Mr., Ms., PhD, I, II, III, etc. The first_names and last_names should not include them.

3. Puntuations are removed 

(2) Deletion of prepended 0 is also applied to numbers below 1. i.e. 0.1234 --> .1234

(3) Data required only consist of the transformed fields in the prompt. Namely: first_name, last_name, price and above_100

(4) Files are accessible prior to 1am. i.e. Running the pipeline at 1am sharp is intended.


# Access
Processed Data can be found in _output.csv_

Pipeline can be found in _pipeline.py_

Crontab is can be found in _crontab_

# Usage
Once docker is started up, the _crontab_ would be scheduled and will run everyday at 1am. The schduled crontab would run _pipeline.py_ which will process dataset1.csv and dataset2.csv as per the instructions given in the prompt and will output a new file: _output.csv_ in the same folder<br>
The docker container is bind mounted on to the machine and the files would be accessible via the same folder on the machine.


**To Start docker**
1. Build image
```
docker build -t datapipe . 
```

2. Start docker container
```
docker run --mount src="$(pwd)",target=/data,type=bind datapipe
```
