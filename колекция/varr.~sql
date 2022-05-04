declare
  type varr is varray(10) of number;-- обьявить макс элменты в коллекции
  l_varr varr;
begin
  l_varr := varr();-- пустая коллекция

  l_varr.extend;

  l_varr(l_varr.last) := 666;
  
  dbms_output.put_line( l_varr(1) );
  
  l_varr.extend;
  l_varr(l_varr.last) := 222;
  dbms_output.put_line( l_varr(2));
  
  l_varr.delete;-- очизщает всю коллекцию и она становится пустой

end;
