import pandas as pd
import numpy as np

data = {
    "product": ["computer", "monitor", "desk", "chair", "chair", "keyboard"],
    "price": [1000, 300, np.nan, 150, 150, 50],
    "quantity": [10, 5, 8, 3, 3, np.nan],
    "manufacturer": ["A", "B", "C", "D", "D", "A"],
    "category": ["electronics", "electronics", "furniture", "furniture", "furniture", "electronics"],
}

df = pd.DataFrame(data)

print(df)