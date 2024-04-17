-- Criação das tabelas.
CREATE DATABASE BlueCompany;

USE BlueCompany;

CREATE TABLE Departments 
(
    DepartmentId BIGINT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE Employees 
(
    EmployeeId BIGINT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2),
    DepartmentId BIGINT,
    FOREIGN KEY (DepartmentId) REFERENCES Departments(DepartmentId)
);

-- Inserção de dados nas tabelas.
INSERT INTO Departments 
    (DepartmentId, Name) 
VALUES
     (1, 'Finance'),
     (2, 'Human Resources'),
     (3, 'Marketing'),
     (4, 'Engineering');
     
INSERT INTO Employees 
    (EmployeeId, FirstName, LastName, salary, DepartmentId) 
VALUES
    (1, 'John', 'Doe', 60000.00, 1),
    (2, 'Jane', 'Smith', 55000.00, 2),
    (3, 'Michael', 'Johnson', 65000.00, 3),
    (4, 'Emily', 'Williams', 70000.00, 4),
    (5, 'David', 'Brown', 50000.00, 1),
    (6, 'Sarah', 'Jones', 58000.00, 2),
    (7, 'Chris', 'Davis', 62000.00, 3),
    (8, 'Jennifer', 'Miller', 68000.00, 4),
    (9, 'Matthew', 'Wilson', 52000.00, 1),
    (10, 'Amanda', 'Taylor', 59000.00, 2);
-- Consultas.	
-- 1. Selecione todos os dados de todos os Funcionários.
SELECT * FROM Employees;

-- 2. Selecione o Sobrenome e o Salário de todos os Funcionários que ganham mais de R$ 50.000 por ano.
SELECT LastName, Salary 
FROM Employees 
WHERE Salary > 50000;

-- 3. Selecione o número de Funcionários em cada Departamento.
SELECT d.Name AS DepartmentName, COUNT(e.EmployeeId) AS NumberOfEmployees
FROM Departments d
LEFT JOIN Employees e ON d.DepartmentId = e.DepartmentId
GROUP BY d.Name;

-- 4. Selecione o Nome do Departamento e o número de Funcionários em cada Departamento, apenas para Departamentos com mais de 2 Funcionários.
SELECT d.Name AS DepartmentName, COUNT(e.EmployeeId) AS NumberOfEmployees
FROM Departments d
LEFT JOIN Employees e ON d.DepartmentId = e.DepartmentId
GROUP BY d.Name
HAVING COUNT(e.EmployeeId) > 2;

-- 5. Selecione o primeiro nome, sobrenome e salário do funcionário mais bem pago.
SELECT FirstName, LastName, Salary
FROM Employees
ORDER BY Salary DESC
LIMIT 1;