/*
right outer join
��������� ���������� ����������� �� ������ �������
�����: 1. ����� ������� �� ������ ������� ������ �����������
       2. ����� �������� ������ �������� ��������
       3. ����������� ����� ����������� �� ���������� ��������
       4. ����� �� ��������� ������ �������, ���� �� ���� ������ � ����� �������
������: 1. ����� ��������� cross join ���� ��� ���������� ��������
����: 1. ����� ��������� �� ����� ������� �������, ���� �� ���� �� ���� ��������
*/

select * from employees e   join departments d on (e.department_id = d.department_id);

select * from employees e  right join departments d on (e.department_id = d.department_id);-- ���������� ����� ��� �������������

select * from departments d right join employees e on (e.department_id = d.department_id); --���������� ������������ ��� �����

select * from departments d right join employees e on (e.department_id = d.department_id)
where d.department_name like '%i%'; --���������� ������������ ��� �����

select e.first_name, e.salary, j.min_salary, j.max_salary 
from  employees e right join jobs j on (e.job_id = j.job_id and salary between j.min_salary+2000 and j.max_salary+3000);

select l.postal_code, city, d.department_name from locations l right join departments d on (d.location_id = l.location_id);
select l.postal_code, city, d.department_name from locations l right outer join departments d on (d.location_id = l.location_id);

select * from departments d 
right join employees e on (e.department_id = d.department_id)
where e.department_id is null; 

select c.country_name, city, l.street_address from   locations l right outer join countries c on (l.country_id = c.country_id);

select * 
  from employees e
     , departments d
where d.department_id = e.department_id(+); --���������� ������������ ��� �����
