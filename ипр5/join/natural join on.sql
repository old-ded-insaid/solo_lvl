/*
�����: 1. ����� ������� �� ������ ������� ������ �����������
       2. ����� �������� ������ �������� ��������
       3. ����������� ����� ����������� �� ���������� ��������
       4. �� ����������� ������ �� ����� ������� ���� ������ ������� ���� ������ � ����� �������
������: 1. ����� ��������� cross join ���� ��� ���������� �������� ��������

����: 1. ����� ��������� �� ����� ������� �������, ���� �� ���� �� ���� ��������
      2. �� ������� �������� ������� ������� ������������ � ����� ��������

*/

select * from  employees e join departments d on (d.department_id = e.department_id);


select * from departments d join regions r on (r.region_id*10 = d.department_id)


select * from employees e  join job_history j on (e.employee_id = j.employee_id 
and e.department_id = j.department_id);

select * from employees e  join job_history j on (e.employee_id = j.employee_id 
and e.department_id = j.department_id) and e.salary >10000;

select * from  employees e join departments d on (d.manager_id = e.employee_id);
