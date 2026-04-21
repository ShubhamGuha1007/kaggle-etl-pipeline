# load.py
import pandas as pd
from sqlalchemy import create_engine

def load_data():
    engine = create_engine(
        "mssql+pyodbc://DESKTOP-R6LR1KA\\SQLEXPRESS/masterDB1"
        "?driver=ODBC+Driver+18+for+SQL+Server&Encrypt=no"
    )

    df = pd.read_csv('clean_orders.csv')

    df.to_sql('orders', con=engine, if_exists='replace', index=False)

    print("Data loaded into SQL Server")

if __name__ == "__main__":
    load_data()