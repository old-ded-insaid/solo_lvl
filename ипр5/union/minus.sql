/*
minus
����� ���� �������� �������� ���������� ������ �� ������, ������� ���� � ������ ���������,
�� ��� �� ������, ������ ��� ���� ��������� � �������� ���������
*/
select * from jobs j where j.min_salary between 4500 and 8000
minus
select * from jobs j where j.max_salary between 10000 and 15000
order by 3

select * from jobs j where j.job_id like '%MAN%'
minus
select * from jobs j where j.job_id like '%MAN%'
