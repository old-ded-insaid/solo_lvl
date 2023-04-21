-- объединение таблиц по inne join и добавл€ютс €записи которые в левой таблице
-- об€зательно писать из какой таблицы выводитс€ поле если по нему происходит объеденение

select e.employee_id, e.first_name, e.department_id, d.department_id from employees e
left join departments d on (e.department_id = d.department_id);

select e.employee_id, e.first_name, e.department_id, d.department_id from  departments d
left join employees e on  (d.department_id = e.department_id );


select e.employee_id, e.first_name, e.department_id, d.department_id, d.department_name from  departments d
left join employees e on  (d.department_id = e.department_id )
where d.department_name like '%i%';

select e.employee_id, e.first_name, j.min_salary, j.max_salary from  employees e
left join jobs j on  (e.job_id = j.job_id and e.salary * 2 < j.max_salary )
;

select * from departments d
left join employees e on (e.department_id = d.department_id)
where e.department_id is null;

select * from employees e
left join  departments d on (e.department_id = d.department_id)
where d.department_id is null;
