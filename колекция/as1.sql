/*����� ��� ����-��������

������ �������� � ��������������� �� ����� �������

�� ������������ DML-�������� (�� ����� ����������� � ��������, �� ����� ��������� � ��������)

��� ���������� ��� ��������� ������ ���� ����� ��������������� ��������

������� ��������� � ������������� ������� � ��������� �������� ������� �� ���������� NLS_SORT � NLS_COMP

������ �������� ��� �� ������ �����, �� ����� � ������

�� ����� ������������

������ �� ����� ��������� �������� null (�� ��������� ������ ������ � ����������� � ������ �� ������ � ������ �����������)

Datatype � ��� ����� ��� ������, ����� ref cursor

������������ ���:
��� ��������� � ������ ��������� ������-������������
��� �������� � �������� ��������� ���������

*/
declare
 type ass_mass is table of number index by pls_integer;
 ass1 ass_mass := ass_mass(1,2,3);
 ass2 ass_mass := ass_mass(3,2,1);
 ass3 ass_mass := ass_mass(2,1,3,4);
begin
  for i in ass1.first..ass1.last
    loop
      dbms_output.put_line(ass1(i));
   end loop;
  ass1.delete(3);--������� �������� �� �� ����������� ������
    for i in ass1.first..ass1.last
    loop
      dbms_output.put_line(ass1(i));
   end loop;
  --ass1.TRIM(3); �� �������� ���
  --ass1.extend(3); �� �������� ���
  ass1(3) := 33;
    for i in ass1.first..ass1.last
    loop
      dbms_output.put_line(ass1(i));
   end loop;
   dbms_output.put_line(ass1.count || ' count');
   dbms_output.put_line(ass1.LIMIT || ' LIMIT -  �������� ������� � ��� �� null');
   dbms_output.put_line(ass1.prior(2) || ' prior ���������� ����� �������');
   dbms_output.put_line(ass1.next(2) || ' next ��������� ����� �������');
end;
/
begin
  dbms_output.put_line('-----');
end;
/
declare
  type ass_mass is table of number index by varchar2(100);
  ass1 ass_mass;
  i varchar2(100);
begin
  ass1('qw') := 11;
  ass1('we') := 22;
  ass1('er') := 33;
  
  /*for i in ass1.first..ass1.last
    loop
       dbms_output.put_line(ass1(i) /*|| ' ' || i);
    end loop;*/
  --ass1.delete(2);
   /* for i in ass1.first..ass1.last
    loop
       dbms_output.put_line(ass1(i));
    end loop;*/
    i := ass1.first;
    while i is not null loop
      dbms_output.put_line(ass1(i) || ' ' || i);
      i := ass1.next(i);
      end loop;
exception
  when no_data_found then
    dbms_output.put_line('��� �������� �������');
end;
/
/*
DECLARE
  -- ������������� ������, ��������������� �������:
  
  TYPE population IS TABLE OF NUMBER  -- ��� �������������� �������
    INDEX BY VARCHAR2(64);            --  ��������������� �� ������
  
  city_population  population;        -- ���������� �������������� �������
  i  VARCHAR2(64);                    -- ��������� ����������
  
BEGIN
  -- ���������� ��������� (���� ����-��������) � ������������� ������: 
  city_population('�������')   := 2000;
  city_population('��������')  := 750000;
  city_population('���������') := 1000000;
 
-- ������� ��������, ��������� � ������ ���������: 
  city_population('�������')  := 2001;
 
  -- �������� ������������� ������:
 
  i := city_population.FIRST;  -- ������� ������ ������� �������
 
  WHILE i IS NOT NULL LOOP
    DBMS_Output.PUT_LINE
      ('��������� ' || i || ' ����� ' || city_population(i)||' �������');
    i := city_population.NEXT(i);  -- ������� ��������� ������� �������
  END LOOP;
END;*/
/
declare
  type assss is table of number index by varchar2(100);
  ass assss;
  i varchar2(200);
begin
  ass('���') := 100;
  ass('������') := 200;
  ass('����') := 300;
  i := ass.first;
  while i is not null 
    loop
      dbms_output.put_line(i || ' ����� ' || ass(i));
      i := ass.next(i);
    end loop;
 end;
