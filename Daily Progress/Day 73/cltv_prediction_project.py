# CLTV Prediction Project Using Python Only

import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from xgboost import XGBRegressor
from sklearn.metrics import r2_score, mean_squared_error
import matplotlib.pyplot as plt

# Step 1: Load Dataset
data = pd.read_csv('../data/train_BRCpofr.csv')

# Step 2: Convert 'income' range to numeric value
income_mapping = {
    '3L-5L': 4,
    '5L-10L': 7.5,
    '10L-20L': 15,
    '20L+': 25
}
data['income_numeric'] = data['income'].map(income_mapping)

# Step 3: Select Features and Target
features = ['income_numeric', 'vintage', 'claim_amount', 'num_policies']
X = data[features]
y = data['cltv']

# Step 4: Scale Features
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

# Step 5: Train-Test Split
X_train, X_test, y_train, y_test = train_test_split(X_scaled, y, test_size=0.2, random_state=42)

# Step 6: Train XGBoost Model
model = XGBRegressor()
model.fit(X_train, y_train)

# Step 7: Evaluate Model
y_pred = model.predict(X_test)
print("R2 Score:", r2_score(y_test, y_pred))
print("RMSE:", np.sqrt(mean_squared_error(y_test, y_pred)))

# Step 8: Feature Importance Plot
XGBRegressor().fit(X_scaled, y)  # Refit on all data for visualization
plt.figure(figsize=(8, 6))
plt.bar(features, model.feature_importances_)
plt.title('Feature Importance')
plt.show()

# Step 9: Export Predictions
final_predictions = pd.DataFrame({
    'CustomerID': data.loc[X_test.index, 'id'],
    'Predicted_CLTV': y_pred
})
final_predictions.to_csv('../outputs/final_cltv_predictions.csv', index=False)
print("Final predictions saved.")
