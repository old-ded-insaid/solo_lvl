declare
  type varr is varray(10) of number;-- �������� ���� ������� � ���������
  l_varr varr;
begin
  l_varr := varr();-- ������ ���������

  l_varr.extend;

  l_varr(l_varr.last) := 666;
  
  dbms_output.put_line( l_varr(1) );
  
  l_varr.extend;
  l_varr(l_varr.last) := 222;
  dbms_output.put_line( l_varr(2));
  
  l_varr.delete;-- �������� ��� ��������� � ��� ���������� ������

end;
