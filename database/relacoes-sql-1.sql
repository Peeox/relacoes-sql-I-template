-- Active: 1676481354066@@127.0.0.1@3306


-- Práticas

CREATE TABLE users (
    id TEXT UNIQUE PRIMARY KEY NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL
);

-- Lembrar que ao referenciar, deve estar dentro da table criada

CREATE TABLE phones (
    id TEXT UNIQUE PRIMARY KEY NOT NULL,
    phone_number TEXT UNIQUE NOT NULL,
    user_id TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Inserindo valores nas tabelas

INSERT INTO users (id, name, email, password)
VALUES  (1, "Xablau", "xablauzinho@email.com", "Ualbax123"),
        (2, "Deviznho", "devoluto@devoltado.com", "Dengo0");

INSERT INTO phones (id, phone_number, user_id)
VALUES  (1001, "123456789", 1),
        (2002, "987654321", 1),
        (3003, "336699885", 2);

-- Fazendo a junção das duas tabelas acima

SELECT * FROM phones
INNER JOIN users
ON phones.user_id = users.id;

-- Criando novas tabelas

CREATE TABLE table_licenses (
    id TEXT UNIQUE PRIMARY KEY NOT NULL,
    register_number TEXT UNIQUE NOT NULL,
    category TEXT NOT NULL
);

CREATE TABLE table_drivers (
    id TEXT UNIQUE PRIMARY KEY NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    license_id TEXT UNIQUE NOT NULL,
    FOREIGN KEY (license_id) REFERENCES table_licenses(id)
);

SELECT * FROM table_licenses;

SELECT * FROM table_drivers;

INSERT INTO table_licenses (id, register_number, category)
VALUES  ("11", "1938400993", "B"),
        ("22", "9845556978", "A"),
        ("33", "5599048456", "B");

INSERT INTO table_drivers (id, name, email, password, license_id)
VALUES  ("0001", "Pedro", "pedrinho@email.com", "Pontiagudo222", "11"),
        ("0002", "Astrodev", "devaneio@email.com", "Astrozinho11", "22"),
        ("0003", "Xablau", "Xablau@email.com", "Ualbax123", "33");


SELECT * FROM table_drivers
INNER JOIN table_licenses
ON table_drivers.license_id = table_licenses.id;

-- Exercício de fixação

CREATE TABLE classrooms (
	id TEXT PRIMARY KEY UNIQUE NOT NULL, 
	name TEXT UNIQUE NOT NULL
);

CREATE TABLE students (
	id TEXT PRIMARY KEY UNIQUE NOT NULL,
	name TEXT NOT NULL,
	email TEXT NOT NULL,
	classroom_id TEXT NOT NULL,
    FOREIGN KEY (classroom_id) REFERENCES classrooms(id)
);

INSERT INTO classrooms (id, name)
VALUES ("c001", "A");

INSERT INTO students (id, name, email, classroom_id)
VALUES ("s002", "Ciclano", "ciclano@email.com", "c001");

SELECT * FROM students