-- неравнозначное соединение
-- используется оператор сравнения

select * from jobs j;

select * from employees e
join jobs j on (j.job_id = e.job_id and e.salary * 2 < j.max_salary);


select * from employees e
join jobs j on (j.job_id = e.job_id and e.salary < j.max_salary);  

select * from employees e
join jobs j on (j.job_id = e.job_id and e.salary between j.min_salary+2000 and j.max_salary-3000);  
