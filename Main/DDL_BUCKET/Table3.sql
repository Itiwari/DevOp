spool "C:/Users/itiwari/Desktop/Project/Table3.txt"
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_NAME = N'employee_id')
BEGIN
  drop table employee_id
END

ELSE

BEGIN
 CREATE TABLE employee_id (
        emp_nm nvarchar(30) not null,
             emp_id nvarchar(8),
             b_emp_id nvarchar(8)
             PRIMARY KEY(emp_nm) );

INSERT INTO employee_id
       (emp_nm, emp_id)
VALUES
       ('Bob', 'A1234567'),
       ('Lisa', 'A1234568')

INSERT INTO employee_id
       (emp_nm, b_emp_id)
VALUES
       ('Priyanka', 'B1234567');
End
spool off;
