/*
natural join
inner join
join
 это все одно соединение
*/

select *
  from regions r
 natural join countries c;
 -- не дает возможность объеденить по моему полю, объеденяет по общему полю который одинаково называется
 -- не погут объеденяться поля с одними ланными но с разными названиями полей
 -- может объеденить поля с одинаковыми названиями но с разными типами
 
select *
  from departments d
  natural join employees e;
  
select * from employees e
natural join job_history j
