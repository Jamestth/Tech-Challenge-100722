import pandas as pd
import re

print("Pipeline Started")

######################### LOAD FILES #########################
df1 = pd.read_csv("dataset1.csv")
df2 = pd.read_csv("dataset2.csv")
df_raw = df1.append(df2)
df_raw = df_raw.reset_index(drop=True)
df_cleaned = df_raw.copy()


######################### INITAL CLEANING #########################
# Task 1: Swap Name from price to name column if misplaced
# Checks if both name column is na and price column is a str for each row
# Swaps name and price columns if both conditions met.

def price_is_number(price):
    if type(price) != str:
        return True
    return not re.match(r'^-?\d+(?:\.\d+)$', price) is None

# Set Conditions
price_is_not_number = df_cleaned["price"].apply(lambda x: not price_is_number(x))
no_name = df_cleaned["name"].isna()
name_price_swap_condition = no_name & price_is_not_number


# Swap name and price if conditions met
df_cleaned["name"][name_price_swap_condition] = df_cleaned["price"][name_price_swap_condition]
df_cleaned["price"][name_price_swap_condition] = None


# Task 2 Clean name of any suffixes
# Check for suffixes and other issues with name to remove them
def clean_names(text):
    # Create Regex for suffixes
    suffixes = ["Dr", "Ms", "Mr", "Jr","Miss", "Mrs", "DVM", "PhD", "MD", "DDS", "I", "II", "III", "IV"]
    suffixes = [r"\b" + x + r"\b" for x in suffixes]

    suffixes_pattern = re.compile(f'({"|".join(suffixes)})')

    # Replace Suffixes with space
    text = re.sub(suffixes_pattern, "", text)

    # Remove punctuations characters:
    text = re.sub(r'[^\w\s]', "", text)

    # Trim Spaces
    return " ".join(text.split())

df_cleaned["clean_name"] = df_cleaned["name"].apply(clean_names)
df_cleaned["clean_name"] = df_cleaned["clean_name"].apply(clean_names)


######################### PROCESSING #########################
# Perform Processing tasks
df_processed = df_cleaned.copy()


# Task 1: Delete any rows which do not have a name
# Assumption: Initial cleaning we swapped the price and name if there is a name in price.
# This name is considered to be part of the data and the row should not be deleted.
df_processed.dropna(subset=["name"], axis = 0) 


# Task 2: Split the name field into first_name, and last_name
first_last_names = df_processed["clean_name"].str.split(expand=True)
df_processed["first_name"] = first_last_names[0]
df_processed["last_name"] = first_last_names[1]


# Task 3: Remove any zeros prepended to the price field 
# Case 1: 09 --> 9
# Converting Price to numeric will remove any prepended 0s from a number more than 1 i.e. 09 --> 9
df_processed["price"] = pd.to_numeric(df_processed["price"])


# Skip to task 4 first before continuing with task 3 due to string conversion.
# Task 4: Create a new field named above_100, which is true if the price is strictly greater than 100
df_processed["above_100"] = df_processed["price"] > 100


# Back to Task 3
# Case 2: 0.1234 --> .1234
# Assumes data requirment requires numbers less than 1 to be transformed i.e. 
def remove_prepend_0(price):
    # Converting to str for removing 0
    str_price = str(price)
    if str_price[0] == "0":
        return str_price[1:]
    return str_price

df_processed["price"] = df_processed["price"].apply(remove_prepend_0)


df_output = df_processed[["first_name", "last_name", "price", "above_100"]]

df_output.to_csv("data/output.csv", index = False)

print("Pipeline Finished")