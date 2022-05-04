/*
correlated subqueries
запрос связан с внешним запросом, сначала выполнякется часть внешнего запроса, внешний запрос передает необходимую инфу subqueries,
 потом срабатывает subqueries и происходит сравнение, после чего внешний запрос выводит или не выводит инфу.
 будет выполняться столько раз сколько строк в таблице
 
*/

select * from employees e 
      where e.salary > (select avg(e.salary) from employees e )
      
select e.first_name, e.salary, e.department_id from employees e 
where e.salary > (select avg(e2.salary) from employees e2 where e2.department_id = e.department_id);

select distinct d.department_id from departments d
