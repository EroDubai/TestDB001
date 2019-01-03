set serveroutput on size 500000
spool COMPILA.lst
begin
  dbms_output.put_line ('  ---=== Objetos inválidos ===---' || chr (10));
end;
/

select object_name, object_type from user_objects where status = 'INVALID' and object_type not in ('SYNONYM')
/

declare
  cursor cur_invalidos is
    select object_name nombre,
           decode (object_type,
                   'PACKAGE BODY', 'PACKAGE',
                   object_type) tipo,
           decode (object_type,
                   'PACKAGE BODY', 'BODY',
                   null) sufijo
    from   user_objects
    where  status = 'INVALID' and object_type not in ('SYNONYM')
    order by 2, 1;
  v2_sql      varchar2 (200);
  i_cursor    integer;
  n_inv_antes number;
  n_inv_desp  number;
  n_pases     number := 1;
begin
  loop
    select count (object_name)
    into   n_inv_antes
    from   user_objects
    where  status = 'INVALID';
    if (n_inv_antes > 0)
    then
      i_cursor := dbms_sql.open_cursor;
      for c_invalidos in cur_invalidos
      loop
    begin
          v2_sql := 'ALTER ' || c_invalidos.tipo || ' ' || c_invalidos.nombre ||
                    ' COMPILE ' || c_invalidos.sufijo;
--    dbms_output.put_line ('Compilando objeto: ' || c_invalidos.nombre);
          dbms_sql.parse (i_cursor, v2_sql, dbms_sql.native);
        exception
          when others then
            null;
        end;
      end loop;
      dbms_sql.close_cursor (i_cursor);
      select count (object_name)
      into   n_inv_desp
      from   user_objects
      where  status = 'INVALID';
      if (n_inv_antes = n_inv_desp or
          n_inv_desp  = 0)
      then
        exit;
      end if;
    else
      exit;
    end if;
    n_pases := n_pases + 1;
  end loop;
  dbms_output.put_line ('====== OBJETOS INVALIDOS CON ERRORES ======' ||chr (10)
  ||'('||to_char (sysdate, 'dd/mm/yyyy:hh24:mi:ss') ||')'||' después de (' || to_char (n_pases) || ') pasadas ');
exception
  when others
  then
    if (dbms_sql.is_open (i_cursor))
    then
      dbms_sql.close_cursor (i_cursor);
    end if;
    dbms_output.put_line ('Ha cascado');
    
    raise;
end;
/


begin
  dbms_output.put_line (chr (10) || '  ---=== Objetos todavía inválidos ===---' || chr (10));
end;
/


select object_name from  user_objects where status = 'INVALID' and object_type not in ('SYNONYM'); 
select COUNT(*) from user_objects where status = 'INVALID' and object_type not in ('SYNONYM');

set serveroutput off
spool off