# transform.py
import pandas as pd

def transform_data():
    df = pd.read_csv('orders.csv', na_values=['Not Available', 'unknown'])

    # clean column names
    df.columns = df.columns.str.strip().str.lower().str.replace(" ", "_")

    # create new column
    df['profit'] = df['sale_price'] - df['cost_price']

    # convert date
    df['order_date'] = pd.to_datetime(df['order_date'])

    # drop unwanted columns
    df.drop(columns=['list_price', 'cost_price', 'discount_percent'], inplace=True)

    df.to_csv('clean_orders.csv', index=False)
    print("Transformation complete")

if __name__ == "__main__":
    transform_data()