import pandas as pd

file_paths = ['branch_a.csv', 'branch_b.csv', 'branch_c.csv']
df = pd.concat((pd.read_csv(file) for file in file_paths), ignore_index=True)

df.dropna(subset=['transaction_id', 'date', 'customer_id'], inplace=True)

df['date'] = pd.to_datetime(df['date'], errors='coerce')

df.sort_values(by='date', ascending=False, inplace=True)
df.drop_duplicates(subset='transaction_id', keep='first', inplace=True)

df['total'] = df['quantity'] * df['price']
total_sales_per_branch = df.groupby('branch', as_index=False)['total'].sum()

total_sales_per_branch.to_csv('total_sales_per_branch.csv', index=False)

print(total_sales_per_branch)
