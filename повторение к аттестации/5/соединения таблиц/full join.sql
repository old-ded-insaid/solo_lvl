-- ������������ ��� ������ ������� ����� ������������, ����������� ������ ������� ���� ������ � ����� �������
--, ����� ����������� ������ �� ������ �������

select * from employees e 
full join departments d on (d.department_id = e.department_id)
