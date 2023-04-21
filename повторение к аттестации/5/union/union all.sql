-- ���������� 2 output ��������� � ���� ������� �������������
-- �������������� �� ������ ����������
-- ������� ������ �� ������ �������
-- ��� ���������� �� ���� ����� ��� ���� ������� � �������
-- ����� �������� ���� � ������� ������ �� �� ������ ����������
-- ��������� ���������� ���������� �������� �� ������

select * from jobs j1 where j1.job_id like '%MAN%'
union all
select * from jobs j2 where j2.job_id like '%MAN%'

select j1.max_salary from jobs j1 where j1.job_id like '%MAN%'
union all
select j2.min_salary from jobs j2 where j2.job_id like '%MAN%'


select j1.max_salary, j1.job_id from jobs j1 where j1.job_id like '%MAN%'
union all
select j2.min_salary, j2.job_title from jobs j2 where j2.job_id like '%MAN%'
order by max_salary desc


select j1.max_salary, j1.job_id from jobs j1 where j1.job_id like '%MAN%'
union all
select j2.min_salary, j2.job_title from jobs j2 where j2.job_id like '%MAN%'

select c.country_id from countries c
union all
select c2.country_name from countries c2
