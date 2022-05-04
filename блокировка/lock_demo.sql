create or replace procedure lock_demo is
  v_lockname   varchar2(128 char) := 'LOCK$HR$DEMO';-- �������� ����������
  v_lockresult number;
  v_lockhandle varchar2(128 char);
  v_timeout    number := 5; -- ��������, ���
begin
  -- �������� ��������� �� ����������
  dbms_lock.allocate_unique(lockname   => v_lockname,
                            lockhandle => v_lockhandle);
  -- �������� ����������
  v_lockresult := dbms_lock.request(v_lockhandle,
                                    lockmode          => dbms_lock.x_mode,
                                    timeout           => v_timeout,
                                    release_on_commit => false);

  case v_lockresult
    when 0 then
      --�� ������, ���� ������, ���������� ������� ���������
      dbms_output.put_line('������� ��������� ���������� :)');
    when 1 then
      raise_application_error(-20102, '������ ' || v_lockname || ' ������������! ������� = ' || v_timeout);
    else
      raise_application_error(-20102, '������ ���������� ������� ' || v_lockname || ' ���  = ' || v_lockresult);
  end case;

  -- ����� ���������� ��� -> ������ ����
  dbms_session.sleep(10);

  -- ��������� ����������
  v_lockresult := dbms_lock.release(v_lockhandle);

exception
  when others then
    -- ��������� ����������
    v_lockresult := dbms_lock.release(v_lockhandle);
    raise;
end;
/
