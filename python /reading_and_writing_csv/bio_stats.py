import csv 

# Constants 
FILE_PATH = 'biostats.csv' # or the path that this file was saved 

# class to represent the csv file "biostats.csv"
class BioStats:
  HAS_HEADERS = True # To remind us this CSV file does have headers (we'll assume they start at row 0)
  # Column locations in the CSV file
  NAME_COL = 0 # First column
  SEX_COL = 1
  AGE_COL = 2
  HEIGHT_COL = 3
  WEIGHT_COL = 4

# Next we'll need to open up the csv file
with open(FILE_PATH, mode='r') as f:                     
    reader = csv.reader(f)
    headers = [] # We'll store the headers in a seperate list
    
    if BioStats.HAS_HEADERS:   # We know this file as headers, so we'll grab 
      headers = next(reader)   # the first line, and start the iterable at the next row.
       
    # Otherwise if there are no headers we'll just start reading in the data.
    for line in reader: #  Now we'll quickly be able to reference the data we care about. 
        if line and len(line) > BioStats.WEIGHT_COL: # check to make sure the line isn't empty
                                                     # and its length is at least as long as the last column value.                              
            name = line[BioStats.NAME_COL] 
            age = int(line[BioStats.AGE_COL]) # When reading from a CSV file the default type is string, we want age to be an integer.
        
            # I want to only see people in their 20's
            if age > 19 and age < 30:
                print(f'student name is {name} and student is {age} years old.')