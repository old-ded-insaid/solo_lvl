-- ��;�� �������� ������� � ������� ����������
-- ��������� ���� �� ������� ���������� ����������
-- ���� ������� �� ��������� � ����������� ������ �� ����� ��� ������ � where

select * from employees e
join job_history j on (e.employee_id = j.employee_id); 

select * from regions r
join departments d on (r.region_id*10 = d.department_id)
