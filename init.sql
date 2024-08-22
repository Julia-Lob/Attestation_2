CREATE TABLE IF NOT EXISTS test_table (
    id SERIAL PRIMARY KEY,
    name VARCHAR(10),
    surname VARCHAR(50),
    city VARCHAR(50),
    age INT
);


-- Создаем массивы с именами и фамилиями
DO $$
DECLARE
    names TEXT[] := ARRAY['Alice', 'Bobic', 'Charlie', 'David', 'Evana', 'Frank', 'Grace', 'Hannah', 'Ivyka', 'Jack'];
    surnames TEXT[] := ARRAY['Smith', 'Johnson', 'Williams', 'Jones', 'Brown', 'Davis', 'Miller', 'Wilson', 'Moore', 'Taylor'];
    cities TEXT[] := ARRAY['New York', 'Los Angeles', 'Chicago', 'Houston', 'Phoenix', 'Philadelphia', 'San Antonio', 'San Diego', 'Dallas', 'San Jose'];
    num_records INT := 25;
BEGIN
    -- Вставка случайных данных в таблицу
    INSERT INTO test_table (name, surname, city, age)
    SELECT
        -- Выбираем случайное имя из массива имен
        names[ceil(random() * array_length(names, 1))] AS name,
        
        -- Выбираем случайную фамилию из массива фамилий
        surnames[ceil(random() * array_length(surnames, 1))] AS surname,
        
        -- Выбираем случайный город из массива городов
        cities[ceil(random() * array_length(cities, 1))] AS city,
        
        -- Генерируем случайный возраст от 1 до 150
        trunc(random() * 149 + 1) AS age
    FROM generate_series(1, num_records);
END $$;


-- select * from test_table;