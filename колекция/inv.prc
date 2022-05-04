create or replace procedure inv is
  type ass_mass is table of employees%rowtype;
  a_m ass_mass;
  a_m2 ass_mass;
  cursor cur_ass is
    (select * from employees e);
  cur_ass_row cur_ass%rowtype;
  cur_ass_row2 cur_ass%rowtype;
  cur_ass_nom pls_integer;
begin
  a_m := ass_mass();
  open cur_ass;
  loop
    fetch cur_ass into cur_ass_row;
    exit when cur_ass%notfound;
  
    a_m.extend;
    a_m(a_m.last) := cur_ass_row;
  dbms_output.put_line((a_m.last));
  end loop;
  close cur_ass;
  
  cur_ass_nom := a_m.first;
  loop
    exit when cur_ass_nom is null;
    
    dbms_output.put_line(a_m.last);
  
    cur_ass_nom := a_m.next(cur_ass_nom);
  
  end loop;
  --
  cur1 in (select * from departments);
  open cur1;
  loop
    cur_ass_nom := a_m.first;
    /*fetch cur1 into cur_ass_row2
    a_m2.extend;
    a_m2(a_m2.last) := cur_ass_row2;
    exit when cur1%notfound;*/
     
    loop
      exit when cur_ass_nom is null;
      
      if cur1
        -- сделать проверку по manager id среди empl и dep
      end if;
        
      cur_ass_nom := a_m.next(cur_ass_nom);
    end loop;
    
  end loop;
  
end inv;
/
