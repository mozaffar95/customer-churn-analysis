import pandas as pd 

df = pd.read_csv("customer.csv")

# convert date columns
df['Acquisition_Date'] = pd.to_datetime(df['Acquisition_Date'])
df['Purchase_Date'] = pd.to_datetime(df['Purchase_Date'])

print("Display 10 rows of first.")
print(df.head(10))

print("Display 10 rows of last.")
print(df.tail(10))

print(f'shape:{df.shape}')
print(f'column name:{df.columns}')

print(df.info())

print(df.isnull().sum())

print(df.duplicated().sum())

print(df.dtypes)

print(df.describe())

print(df['Churned'].value_counts())

print(df.groupby('Product')['Revenue'].sum())

print(df['Customer_Segment'].value_counts())

print(df['Gender'].value_counts())

print(df.groupby('Marketing_Channel')['Revenue'].sum())

print(df.groupby('Loyalty_Tier')['Revenue'].sum())

print(df.groupby('Age_Group')['Revenue'].sum())

df.groupby('Product')['Quantity'].sum()

df.groupby('Payment_Method')['Revenue'].sum()

df.groupby('Season')['Revenue'].sum()

print(df.groupby('Product')['Quantity'].sum())

print(df.groupby('Payment_Method')['Revenue'].sum())

print(df.groupby('Season')['Revenue'].sum())

df.to_csv("clean_customer_data.csv", index=False,  encoding="utf-8")