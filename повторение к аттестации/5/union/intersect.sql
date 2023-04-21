-- интерсект 2х выходных множеств возвращает общие строки, удаляя дубликаты и сортируя

select * from jobs j1 where j1.job_id like '%MAN%'
intersect
select * from jobs j2 where j2.job_id like '%MAN%'

select * from jobs j1 where j1.min_salary between 4500 and 8000
intersect
select * from jobs j2 where j2.max_salary between 10000 and 15000


select j1.job_id, j1.job_title, j1.min_salary from jobs j1 where j1.min_salary between 4500 and 8000
intersect
select j2.job_id, j2.job_title, j2.min_salary from jobs j2 where j2.max_salary between 10000 and 15000
order by 1 desc
