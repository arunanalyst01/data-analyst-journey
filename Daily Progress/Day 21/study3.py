import pandas as pd
import numpy as np

# 1. Read the three CSV files
math_df = pd.read_csv('MathScoreTerm1.csv')
ds_df = pd.read_csv('DSScoreTerm1.csv')
physics_df = pd.read_csv('PhysicsScoreTerm1.csv')

# 2. Remove 'Name' and 'Ethnicity' columns to protect student identity
cols_to_remove = ['Name', 'Ethnicity']
math_df = math_df.drop(columns=[col for col in cols_to_remove if col in math_df.columns])
ds_df = ds_df.drop(columns=[col for col in cols_to_remove if col in ds_df.columns])
physics_df = physics_df.drop(columns=[col for col in cols_to_remove if col in physics_df.columns])

# 3. Fill missing scores with zero
math_df = math_df.fillna(0)
ds_df = ds_df.fillna(0)
physics_df = physics_df.fillna(0)

# 4. Merge the three dataframes on 'StudentID' (or common key)
# Assuming 'StudentID' column exists in all files
merged_df = math_df.merge(ds_df, on='StudentID', suffixes=('_Math', '_DS'))
merged_df = merged_df.merge(physics_df, on='StudentID')

# 5. Convert Sex column values: 'M' -> 1, 'F' -> 2
if 'Sex' in merged_df.columns:
    merged_df['Sex'] = merged_df['Sex'].map({'M': 1, 'F': 2})

# 6. Save the cleaned dataframe to a new CSV file
merged_df.to_csv('ScoreFinal.csv', index=False)

# --- Enhancements ---

# Enhancement 1: Convert ethnicity to numerical (if needed)
# Since we dropped 'Ethnicity', let's assume you want to keep it for encoding first
# Here’s how to do it if you had kept 'Ethnicity' before dropping:

# Example:
# If you want to encode ethnicity before dropping (for future use):
# from sklearn.preprocessing import LabelEncoder
# le = LabelEncoder()
# math_df['EthnicityEncoded'] = le.fit_transform(math_df['Ethnicity'])

# Enhancement 2: Fill missing scores with class average instead of zero

def fill_missing_with_class_avg(df, score_columns):
    for col in score_columns:
        class_avg = df[col].mean()
        df[col].fillna(class_avg, inplace=True)
    return df

# Reload original data to try enhancement 2
math_df = pd.read_csv('MathScoreTerm1.csv').drop(columns=[col for col in cols_to_remove if col in math_df.columns])
ds_df = pd.read_csv('DSScoreTerm1.csv').drop(columns=[col for col in cols_to_remove if col in ds_df.columns])
physics_df = pd.read_csv('PhysicsScoreTerm1.csv').drop(columns=[col for col in cols_to_remove if col in physics_df.columns])

# Identify score columns (excluding StudentID and Sex)
math_scores_cols = [col for col in math_df.columns if col not in ['StudentID', 'Sex']]
ds_scores_cols = [col for col in ds_df.columns if col not in ['StudentID', 'Sex']]
physics_scores_cols = [col for col in physics_df.columns if col not in ['StudentID', 'Sex']]

# Fill missing values with class average
math_df = fill_missing_with_class_avg(math_df, math_scores_cols)
ds_df = fill_missing_with_class_avg(ds_df, ds_scores_cols)
physics_df = fill_missing_with_class_avg(physics_df, physics_scores_cols)

# Merge again
merged_avg_df = math_df.merge(ds_df, on='StudentID', suffixes=('_Math', '_DS'))
merged_avg_df = merged_avg_df.merge(physics_df, on='StudentID')

# Convert Sex column
if 'Sex' in merged_avg_df.columns:
    merged_avg_df['Sex'] = merged_avg_df['Sex'].map({'M': 1, 'F': 2})

# Save this enhanced version
merged_avg_df.to_csv('ScoreFinal_AvgImputed.csv', index=False)
