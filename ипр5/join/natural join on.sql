/*
плюсы: 1. можно выбрать по какому столбцу делать объеденение
       2. можно выбирать разные названия столбцов
       3. объеденение может происходить по нескольким столбцам
       4. не обязательно писать из какой таблицы если нужные столбцы есть только в одной таблице
минусы: 1. может произойти cross join если нет одинаковых названий столбцов

факт: 1. нужно указывать из какой таблицы столбец, если он есть во всех таблицах
      2. не выводит повторно столбец который присутствует в обеих таблицах

*/

select * from  employees e join departments d on (d.department_id = e.department_id);


select * from departments d join regions r on (r.region_id*10 = d.department_id)


select * from employees e  join job_history j on (e.employee_id = j.employee_id 
and e.department_id = j.department_id);

select * from employees e  join job_history j on (e.employee_id = j.employee_id 
and e.department_id = j.department_id) and e.salary >10000;

select * from  employees e join departments d on (d.manager_id = e.employee_id);
