/*
union all
объеденяет 2 выходных множества в одно простым присоеденением
*/

select * from jobs j where j.job_id like '%MAN%'
union all
select * from jobs j where j.job_id like '%MAN%'

select * from jobs j where j.job_id like '%MAN%'
union all
select * from jobs j where j.job_id like '%MAN%'
order by 2

select j.max_salary, j.job_title from jobs j where j.job_id like '%MAN%'
union all
select j.min_salary, j.job_id from jobs j where j.job_id like '%MAN%'
order by 2
