--==== SESSION 2

-- ���� ��� ��������
select * from wallet t where t.wallet_id = 1 for update nowait;

-- ���� � ��������� 3 ���
select * from wallet t where t.wallet_id = 1 for update wait 3;

-- ���� � ����������� ���������
select * from wallet t where t.wallet_id = 1 for update;


-- ������� ��������������� �����
select * from wallet t for update skip locked;
