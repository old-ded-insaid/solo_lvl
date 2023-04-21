select * from employees e
where e.job_id in (select j.job_id from jobs j where j.min_salary > 8000);

select * from employees e
where e.salary > any (select salary from employees s2 where s2.department_id = 100); -- любой

select * from employees e
where e.salary < any (select salary from employees s2 where s2.department_id = 100); -- любой

select * from employees e
where e.salary > all (select salary from employees s2 where s2.department_id = 100); -- всех


select * from employees e
where e.salary < all (select salary from employees s2 where s2.department_id = 100); -- всех

select * from departments d where d.department_id in (select e.department_id from employees e )
; 
