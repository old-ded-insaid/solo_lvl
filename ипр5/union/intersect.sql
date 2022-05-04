/*
intersect
пересечение 2х выходных множетв возвращает только общие строки, удаляя при этом дубликаты и сортируя результат
*/

select * from jobs j where j.min_salary between 4500 and 8000
intersect
select * from jobs j where j.max_salary between 10000 and 15000
order by 3

select * from jobs j where j.min_salary between 4500 and 8000;
select * from jobs j where j.max_salary between 10000 and 15000;


select * from jobs j where j.job_id like '%MAN%'
intersect
select * from jobs j where j.job_id like '%MAN%'
