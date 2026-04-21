# End-to-End Data Pipeline (Kaggle → SQL Server)

## 📌 Project Overview
This project demonstrates an end-to-end ETL (Extract, Transform, Load) pipeline using Kaggle API, Python, and SQL Server.

## ⚙️ Tech Stack
- Python (pandas)
- Kaggle API
- SQL Server (SSMS)
- SQLAlchemy, pyodbc

## 🔄 Pipeline Flow
1. Extract data from Kaggle using API
2. Transform data using pandas (cleaning, formatting)
3. Load data into SQL Server
4. Perform SQL analysis using queries

## 📂 Project Structure
- `extract.py` → Fetch data from Kaggle
- `transform.py` → Clean and preprocess data
- `load.py` → Load data into SQL Server
- `analysis.sql` → SQL queries for insights


## 🖼️ Architecture Diagram
![ETL Pipeline](kaggle-etl-pipeline/data/img.png)

## ▶️ How to Run
1. Install dependencies:
   ```bash
   pip install -r requirements.txt
