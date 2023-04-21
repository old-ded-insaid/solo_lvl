-- должен вернуть 1 строку в запросе

select max(e.salary) from employees e;
select * from employees e where e.salary < (select max(e1.salary)/5 from employees e1); 


select * from employees e where e.salary > (select avg(e1.salary) from employees e1); 

select * from employees e where e.salary >= (select e1.salary from employees e1 where e1.employee_id = 180); 

select job_title from jobs j
            , employees e
            where e.job_id = j.job_id
            group by j.job_title
            having avg(e.salary) = (select max(avg(e2.salary)) from employees e2 group by e2.job_id); 
