-- SQLite
-- Creating tables
CREATE TABLE Users (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    age INTEGER,
    gender TEXT
);

CREATE TABLE Workouts (
    workout_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    date TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users (user_id)
);

CREATE TABLE Exercises (
    exercise_id INTEGER PRIMARY KEY AUTOINCREMENT,
    workout_id INTEGER NOT NULL,
    exercise_type TEXT NOT NULL,
    duration_minutes INTEGER NOT NULL,
    calories_burned REAL NOT NULL,
    FOREIGN KEY (workout_id) REFERENCES Workouts (workout_id)
);

-- 

-- Add Users
INSERT INTO Users (name, email, age, gender)
VALUES 
('Alice', 'alice@example.com', 30, 'Female'),
('Bob', 'bob@example.com', 25, 'Male');

-- Add Workouts
INSERT INTO Workouts (user_id, date)
VALUES 
(1, '2024-12-25'),
(1, '2024-12-26'),
(2, '2024-12-25');

-- Add Exercises
INSERT INTO Exercises (workout_id, exercise_type, duration_minutes, calories_burned)
VALUES 
(1, 'Cardio', 30, 250),
(1, 'Strength', 20, 150),
(2, 'Yoga', 40, 200),
(3, 'Cycling', 45, 400);

-- select queries
Select * from Exercises

SELECT quote('O\'Reilly');
