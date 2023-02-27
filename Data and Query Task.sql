CREATE TABLE Employee (
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    EmployeeId VARCHAR(10) NOT NULL UNIQUE,
    FullName VARCHAR(100) NOT NULL,
    BirthDate DATE NOT NULL,
    Address VARCHAR(500)
);

CREATE TABLE Position (
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    PosId VARCHAR(10) NOT NULL,
    PosTitle VARCHAR(100) NOT NULL,
    EmployeeId VARCHAR(10) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL
);


INSERT into employee (EmployeeId,FullName, BirthDate, Address)
values ('10105001','Ali Anton',('1982-08-19'),'Jakarta Utara'),
('10105002','Rara Siva',('1982-01-01'),'Mandalika'),
('10105003','Rini Aini',('1982-02-20'),'Sumbawa Besar'),
('10105004','Budi',('1982-02-22'),'Mataram Kota');

INSERT INTO position (PosId,PosTitle,EmployeeId,StartDate,EndDate)
values('50000',	'IT Manager','10105001','2022-01-01','2022-02-28'),
('50001','IT Sr. Manager','10105001','2022-03-01','2022-12-31'),
('50002','Programmer Analyst','10105002','2022-01-01','2022-02-28'),
('50003','Sr. Programmer Analyst','10105002','2022-03-01','2022-12-31'),
('50004','IT Admin','10105003','2022-01-01','2022-02-28'),
('50005','IT Secretary','10105003','2022-03-01','2022-12-31');

SELECT 
    e.id,
    e.EmployeeId,
    e.FullName,
    e.BirthDate,
    e.Address,
    p.PosId,
    p.PosTitle,
    DATE_FORMAT(MAX(p.StartDate), '%d-%b-%y') AS Start_date,
    DATE_FORMAT(p.EndDate, '%d-%b-%y') AS EndDate
FROM
    employee e
        LEFT JOIN
    position p ON e.EmployeeId = p.EmployeeId
GROUP BY 2;