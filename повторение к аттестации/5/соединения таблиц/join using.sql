-- ����� ������� ���� ��� �����������
-- ����� 2 ���� � ����������� ���������� � ������
-- ����� ��������� �� ����� ������� ����
-- ��� ������ ������� �� ����� ������ ������ ��� ����
-- ��������� ���� ��� ���� �� �������� ���� �����������


select e.department_id, d.department_id from employees e
join departments d using (department_id);

select * from regions t
join countries c using(region_id); 

select * from employees e
join job_history j using(employee_id); 
