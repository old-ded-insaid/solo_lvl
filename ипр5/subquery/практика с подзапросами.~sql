select * from COUNTRIES t;
select * from LOCATIONS t;
select * from departments t;
select * from jobs t;
select * from job_history t;
select * from REGIONS t;

select * from employees e where e.department_id= (
select d.department_id from departments d where d.location_id = (
select l.location_id from locations l where l.country_id = (
select c.country_id from COUNTRIES c where c.country_name = 'Germany')))


select * from employees e 
 where e.job_id in (select j.job_id from jobs j where j. job_title like '%Manager%') -- сколько человек менеджеры
 and e.salary > (select avg(e1.salary) from employees e1 );-- сколько человек зарабатывают больше среднего
 
 select * from employees e 
 where e.salary > any (select e1.salary from employees e1 where e1.first_name = 'David' );
 
  select * from employees e 
 where e.salary > all (select e1.salary from employees e1 where e1.first_name = 'David' );

select * from employees e where length(e.first_name) = (select max(length(e.first_name)) from employees e)


select * from employees e where e.salary > (select avg(e.salary) from employees e)


Получить город/города, где сотрудники в сумме зарабатывают меньше
всего.
select l.city from employees e
                 , departments d
                 , locations l
             where e.department_id = d.department_id
                 and d.location_id = l.location_id
             group by l.city
             having sum(e.salary) = (select min(sum(e.salary)) from employees e
                                                 , departments d
                                                 , locations l
                                             where e.department_id = d.department_id
                                                 and d.location_id = l.location_id
                                                 group by l.city)
                                                 
Выведите всю информацию о сотрудниках, у которых менеджер
получает зарплату больше 15000.
select * from employees e where e.manager_id = any (select e.employee_id from employees e where e.salary > 15000)

Выведите всю информацию о департаментах, в которых нет ни одного
сотрудника.
select d.* from departments d
            , employees e
          where d.department_id = e.department_id (+)
             and e.department_id is null;
             
select * from departments d where d.department_id in (select distinct d.department_id from departments d where d.manager_id is null )

Выведите всю информацию о сотрудниках, которые не являются
менеджерами.

select * from employees e where e.manager_id not in (select distinct e.employee_id from employees e where e.manager_id is not null)

Выведите всю информацию о менеджерах, которые имеют в
подчинении больше 6ти сотрудников.

select * from employees e where e.employee_id = any(  select e.manager_id from employees e group by e.manager_id
                                     having count(e.manager_id) >6)
select e.manager_id, count(e.manager_id) from employees e group by e.manager_id
having count(e.manager_id) >6
2 вариант
select * from employees e where  (select count(*) from employees e1 where e1.manager_id = e.employee_id) > 6

Выведите всю информацию о сотрудниках, которые работают в
департаменте с названием IT .
select * from employees e where e.department_id in (
select d.department_id from departments d where d.department_name like '%IT%')

Выведите всю информацию о сотрудниках, менеджеры которых
устроились на работу в 2005ом году, но при это сами работники
устроились на работу до 2005 года.
select * from employees e where e.manager_id in ( select e.employee_id from employees e where to_char(e.hire_date, 'YYYY') = '1998')
and e.hire_date < to_date('01011998', 'DDMMYYYY')

Выведите всю информацию о сотрудниках, менеджеры которых
устроились на работу в январе любого года, и длина job_title этих
сотрудников больше 15ти символов.

select * from employees e where e.manager_id in ( select e.employee_id from employees e where to_char(e.hire_date, 'MM') = '01')
and e.job_id in (select j.job_id from jobs j where length(j.job_title) >15)

select j.job_id from jobs j where length(j.job_title) >15
