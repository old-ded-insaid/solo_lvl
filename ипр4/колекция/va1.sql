/*
������ �������� ��� ��������
������������� � 1
���������������� ������������� collection_type ( [ value [, value ]... ] )
���� ��������� � ����������� �� ����������, ������������ ������ ���������
Datatype � ��� ����� ��� ������, ����� ref cursor

������������, ����:
����� ����������� ��������� ���������� ���������
������ � ��������� ����������������
*/
declare
  type ass is varray(4) of varchar2(20);
  ass1 ass := ass('����', '���', '���','�');
begin
  for i in ass1.first..ass1.last
    loop
  dbms_output.put_line(i || ' ' ||ass1(i));
  end loop;
  dbms_output.put_line( '--- ');
  ass1(3) := '���';
  ass1(4) := 'al';
  for i in ass1.first..ass1.last
    loop
  dbms_output.put_line(i || ' ' ||ass1(i));
  end loop;
  dbms_output.put_line( '--- ');
  ass1 := ass('�', '��','��','���');
  for i in ass1.first..ass1.last
    loop
  dbms_output.put_line(i || ' ' ||ass1(i));
  end loop;
end;
