select * from employees e
where e.salary > (select avg(e2.salary) from employees e2);
-- очень ресурсоемкий

select * from employees e1 where e1.salary > (select avg(e2.salary) from employees e2 where e2.department_id = e1.department_id ); 
