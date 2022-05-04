CREATE TABLE emp1 (
empno NUMBER(5) PRIMARY KEY,
ename VARCHAR2(15) NOT NULL,
ssn NUMBER(9),
sal NUMBER(7,2),
 hrly_rate NUMBER(7,2) generated always as (sal/2080));
 
 select * from  emp1;
 insert into emp1 (empno,ename, ssn, sal ) values (1, 'vavan', 111, 20050);
 
 
CREATE TABLE emp3
 (sal number (7,2),
 hrly_rate number (7,2) generated always as (sal/2080)
 VIRTUAL
 CONSTRAINT HourlyRate CHECK (hrly_rate > 8.00));

 insert into emp3 (sal ) values (  2080);

select * from emp3

create table p_emp as select * from emp

select * from p_emp

CREATE TABLE employee_new
 AS SELECT * FROM employees
 PARALLEL DEGREE 4
 NOLOGGING;
 
 CREATE INDEX gender_dx ON p_emp(empno)
 drop INDEX gender_dx 
