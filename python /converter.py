import pandas as pd

# Read the .xls file into a DataFrame
df = pd.read_excel("teeket_users.xlsx")

# Save the DataFrame as a .csv file
df.to_csv("teeket_users.csv", index=False)
