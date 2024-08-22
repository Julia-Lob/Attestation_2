import pandas as pd
import psycopg2
from sqlalchemy import create_engine

def process_data(engine):
    conn = engine.connect()

    data = pd.read_sql('SELECT * FROM test_table WHERE LENGTH(name)<6', conn)
    min_value = data["age"].min()
    max_value = data["age"].max()
    values = [min_value, max_value]

    return values

if __name__ == "__main__":
    db_user = 'postgres'
    db_password = '999999'
    db_host = 'db'
    db_port = '5432'
    db_name = 'lobanova'

    engine = create_engine(f'postgresql://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}')

    result = process_data(engine)

    print(f"Минимальный возраст: {result[0]}")
    print(f"Максимальный возраст: {result[1]}")
   # print(result)