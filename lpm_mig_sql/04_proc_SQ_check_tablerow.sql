create or replace procedure sq_check_tablerow is
  cursor cur_tableName is select tableName from sq_table_row;
  num_actualRowCount number;
  v_tableName varchar(200);
  v_sql varchar(1000);
begin
   open cur_tableName;
  loop
    fetch cur_tableName into v_tableName;
    exit when cur_tableName%notfound;
          v_sql:=' select count(*)  from ' || v_tableName ;
          execute immediate v_sql into num_actualRowCount;
          v_sql:=' update sq_table_row set actualRowCount=' || num_actualRowCount || ' where tablename= '''|| v_tableName ||'''';
          execute immediate v_sql;
          commit;
  end loop;
  close cur_tableName;
end sq_check_tablerow;
/