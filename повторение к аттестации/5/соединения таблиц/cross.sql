-- ��� ������ �� ����� ������� ����������� �� ����� �������� �� ������ �������
-- ������� �� ������
-- ����� ��������� ���������� ���� �� ����� �������

select * from countries c
cross join employees e
order by 1 asc; 

select * from countries c
natural join jobs j;  
