/*
single row
запрос который возвращает ноль или одну строку.
можно поместить подзапрос в предложение WHERE, предложение HAVING или предложение FROM оператора SELECT
в подзапросе должна быть 1 строка
*/

select max(e.salary) from employees e;
select * from employees e where e.salary < (select max(e.salary)/5 from employees e);
select * from employees e where e.salary < (select max(e.salary) from employees e)/5;
select * from employees e where e.salary > (select max(e.salary)/5 from employees e);
select * from employees e where e.salary > (select avg(e.salary) from employees e);

select * from employees e where e.salary >= (select e.salary from employees e where e.employee_id = 108);

select job_title from jobs j,
              employees e 
    where j.job_id = e.job_id
group by j.job_title
having avg(e.salary) = (select max(avg(e.salary)) from employees e group by job_id )

select avg(e.salary) from employees e group by job_id 
select max(avg(e.salary)) from employees e group by job_id 
