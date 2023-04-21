-- объеден€ет 2 output множества в одно, удал€€ будликаты и сортиру€ его

select * from jobs j1 where j1.job_id like '%MAN%'
union 
select * from jobs j2 where j2.job_id like '%MAN%'

select * from jobs j1 where j1.min_salary between 4500 and 8000
union
select * from jobs j2 where j2.max_salary between 10000 and 15000

select * from jobs j1 where j1.min_salary between 4500 and 8000
union
select * from jobs j2 where j2.max_salary between 10000 and 15000
order by 3 desc


