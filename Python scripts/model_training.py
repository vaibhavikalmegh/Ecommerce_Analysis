# E-Commerce Return Prediction Model

# Import Libraries
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score, confusion_matrix, classification_report, roc_curve, roc_auc_score
import matplotlib.pyplot as plt
import seaborn as sns


# Load Dataset

df = pd.read_csv('../data/ecommerce_sales_cleaned.csv')

print("Dataset Loaded Successfully")
print(df.head())

# Data Preprocessing

# Convert date column
df['Order Date'] = pd.to_datetime(df['Order Date'], dayfirst=True)

# Remove 'In Transit'
df = df[df['Shipping Status'] != 'In Transit'].copy()

# Create target variable
df['Returned'] = (df['Shipping Status'] == 'Returned').astype(int)

print("\nTarget Variable Created")
print(df['Returned'].value_counts())


# Feature Selection

df_model = df[['Quantity', 'Total Price', 'Category', 'Region', 'Age', 'Shipping Fee', 'Returned']]

# One-hot encoding
df_model = pd.get_dummies(df_model, columns=['Category', 'Region'], drop_first=True)

# Split features & target
X = df_model.drop('Returned', axis=1)
y = df_model['Returned']


# Train-Test Split

X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)

# Feature Scaling

scaler = StandardScaler()

X_train = scaler.fit_transform(X_train)
X_test = scaler.transform(X_test)


# Model Training

model = LogisticRegression(class_weight='balanced', max_iter=1000)
model.fit(X_train, y_train)

print("\nModel Trained Successfully")

# Predictions

y_pred = model.predict(X_test)
y_prob = model.predict_proba(X_test)[:, 1]

# Evaluation

print("\nAccuracy:", accuracy_score(y_test, y_pred))

print("\nClassification Report:")
print(classification_report(y_test, y_pred))

# Confusion Matrix
cm = confusion_matrix(y_test, y_pred)

sns.heatmap(cm, annot=True, fmt='d')
plt.title("Confusion Matrix")
plt.xlabel("Predicted")
plt.ylabel("Actual")
plt.show()

# ROC Curve
fpr, tpr, _ = roc_curve(y_test, y_prob)
auc = roc_auc_score(y_test, y_prob)

plt.plot(fpr, tpr)
plt.title(f"ROC Curve (AUC = {auc:.2f})")
plt.xlabel("False Positive Rate")
plt.ylabel("True Positive Rate")
plt.show()


# Feature Importance

importance = pd.DataFrame({
    'Feature': X.columns,
    'Coefficient': model.coef_[0]
})

importance = importance.sort_values(by='Coefficient', ascending=False)

print("\nFeature Importance:")
print(importance.head(10))