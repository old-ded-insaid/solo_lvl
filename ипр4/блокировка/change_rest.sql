-- ���������, ���������� �������� �� ������
create or replace procedure change_rest
(
  p_product_id warehouse.product_id%type
 ,p_count      warehouse.rest%type
) is
  v_current_rest warehouse.rest%type; -- ������� �������
begin
  -- �������� ������� �������
  select t.rest
    into v_current_rest
    from warehouse t
   where t.product_id = p_product_id
     for update;
  
  -- ������� ������� � ����� ������
  dbms_output.put_line('Current rest = '||v_current_rest);

  -- ��������� ������� �� ������
  if v_current_rest - p_count < 0
  then
    raise_application_error(-20100, '������� �� ������� �� �������!');
  end if;

  -- ��������� �� ����� ��������
  update warehouse t
     set t.rest = t.rest - p_count
   where t.product_id = p_product_id;
end;
/
