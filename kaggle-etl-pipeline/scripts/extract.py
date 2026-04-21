# extract.py
import zipfile
import os

def extract_data():
    zip_path = "orders.csv.zip"

    if not os.path.exists("orders.csv"):
        with zipfile.ZipFile(zip_path, 'r') as zip_ref:
            zip_ref.extractall()
        print("Extraction complete: orders.csv created")
    else:
        print("File already exists, skipping extraction")

if __name__ == "__main__":
    extract_data()