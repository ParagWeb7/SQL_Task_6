
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);


CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50),
    Location VARCHAR(50)
);


INSERT INTO Employees VALUES (1, 'Amit', 'HR', 45000.00);
INSERT INTO Employees VALUES (2, 'Neha', 'IT', 60000.00);
INSERT INTO Employees VALUES (3, 'Ravi', 'IT', 70000.00);
INSERT INTO Employees VALUES (4, 'Kiran', 'Finance', 50000.00);
INSERT INTO Employees VALUES (5, 'Sita', 'HR', 40000.00);


INSERT INTO Departments VALUES (1, 'HR', 'Mumbai');
INSERT INTO Departments VALUES (2, 'IT', 'Pune');
INSERT INTO Departments VALUES (3, 'Finance', 'Delhi');

SELECT EmpName, Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

SELECT EmpName, Salary, 
       (Salary - (SELECT AVG(Salary) FROM Employees)) AS SalaryDifference
FROM Employees;

SELECT EmpName, Department
FROM Employees
WHERE Department IN (SELECT DeptName FROM Departments WHERE Location = 'Pune');

SELECT EmpName, Department, Salary
FROM Employees e
WHERE Salary = (
    SELECT MAX(Salary)
    FROM Employees
    WHERE Department = e.Department
);

SELECT Department, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Department;



