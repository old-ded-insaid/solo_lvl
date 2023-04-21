--create type list_of_names_t is table of varchar2(100);
/*/
declare
hf list_of_names_t := list_of_names_t();
ch list_of_names_t := list_of_names_t();
pa list_of_names_t := list_of_names_t();
begin
hf.extend(4);
hf(1) := 'qwe';
hf(2) := 'asd';
hf(3) := 'zxc';
hf(4) := 'xcv';

ch.extend(2);
ch(1) := 'zxc';
ch(2) := 'qwe';
  
pa := hf

end;*/

declare
hf list_of_names_t := list_of_names_t();
begin
hf.extend(9);
hf(1) := 'qwe';
hf(2) := 'asd';
hf(3) := 'zxc';
hf(4) := 'xcv';
hf(5) := 'dfg';
hf(6) := 'ert';
hf(7) := 'rty';
hf(8) := 'fgh';
hf(9) := 'vbn';

for i in hf.first..hf.last loop
  dbms_output.put_line(i || ' = ' || hf(i));
end loop;
hf.trim(2);
dbms_output.put_line('------');

for q in hf.first..hf.last loop
  dbms_output.put_line(q || ' = ' || hf(q));
end loop;
dbms_output.put_line('------');
dbms_output.put_line(hf.count);

hf.delete(2);

for e in hf.first..hf.last loop
  if hf.exists(e) then
          dbms_output.put_line(e || ' = ' || hf(e));
      else
          dbms_output.put_line(e ||' = does not exist');
      end if;
end loop;
