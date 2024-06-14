# First we'll need to import the csv module
import csv 

# Constants 
FILE_PATH = 'biostats.csv' # or the path that this file was saved 

# Next we'll need to open up the csv file
with open(FILE_PATH, 'r') as f:                        # We're going going to read to it, so we'll pass the 'r' argument. 
    reader = csv.reader(f)                             # The open file object is being assigned to the variable f. 
    for line in reader:                                # We then use the csv module method ".reader()" and pass in the open
       print(line)    