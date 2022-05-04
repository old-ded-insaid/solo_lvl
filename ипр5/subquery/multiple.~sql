/*
multiple row
возвращает одну или несколько строк во внешнюю инструкцию SQL. 
Вы можете использовать оператор IN, ANY или ALL во внешнем запросе для обработки подзапроса, возвращающего несколько строк
*/

select * 
  from employees e 
 where e.job_id in (select job_id 
                      from jobs j 
                     where j.min_salary > 8000);
select * 
  from employees e 
 where e.job_id not in (select job_id 
                          from jobs j 
                         where j.min_salary >8000);-- not in использовать когда знаешь что подзапрос не null

select e.first_name, e.salary from employees e 
 where e.salary > all /*всех*/ (select e.salary from employees e where e.department_id = 100);
-- или
select e.first_name, e.salary from employees e 
 where e.salary > (select max(e.salary) from employees e where e.department_id = 100);

 select e.first_name, e.salary from employees e
 where e.salary > any /*любой*/ (select e.salary from employees e where e.department_id = 100);
-- или
select e.first_name, e.salary from employees e 
 where e.salary > (select min(e.salary) from employees e where e.department_id = 100);
 
select distinct * from employees e
            , departments d
        where e.department_id =  d.department_id;
--равнозначно
select * from employees e where e.department_id in (select distinct e.department_id from employees e )
