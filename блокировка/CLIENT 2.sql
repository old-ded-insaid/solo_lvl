--==== CLIENT 2

begin
  change_rest(p_product_id => 1, p_count => 100);
end;
/

select * from warehouse;
