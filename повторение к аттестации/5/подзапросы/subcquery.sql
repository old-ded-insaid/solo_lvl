--

select * from employees e
where e.salary > (select avg(e2.salary) from employees e2 );

select (select min(min_salary) from jobs)
     , (select max(length(e.first_name)) from employees e) length_name
  from dual; 
  
select * from employees e
where e.employee_id in (select z.employee_id from employees z );

select de.department_name, min(de.salary), max(de.salary) from (select d.department_name, e.salary from employees e
                           , departments d
                           where e.department_id = d.department_id) de
                           group by de.department_name; 
