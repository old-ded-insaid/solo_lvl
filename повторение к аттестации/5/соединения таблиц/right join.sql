-- ����������� ������ �� inne join � ����������� ������ ������� � ������ �������
-- ����������� ������ �� ����� ������� ��������� ���� ���� �� ���� ���������� �����������

select * from employees e
right join departments d on (e.department_id = d.department_id); 

select * from countries c
right join locations l on (c.country_id = l.country_id)
; 
