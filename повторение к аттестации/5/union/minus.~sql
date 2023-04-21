-- минус 2х выходных множеств возвращает только те строки, которые есть в первом множестве, но нет во втором, удаляя при этом 
-- дубликаты и сортируя
-- не включает дубликаты и отсортирован


select * from jobs j1 where j1.job_id like '%MAN%'
minus
select * from jobs j2 where j2.job_id like '%MAN%'


select * from jobs j1 where j1.min_salary between 4500 and 8000
minus
select * from jobs j2 where j2.max_salary between 10000 and 15000


select * from jobs j2 where j2.max_salary between 10000 and 15000
minus
select * from jobs j1 where j1.min_salary between 4500 and 8000
