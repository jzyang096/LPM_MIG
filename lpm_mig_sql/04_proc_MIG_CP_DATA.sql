create or replace procedure MIG_CP_DATA (P_TABLE_NAME IN VARCHAR2) IS
   cursor c_cols is
     select tc.column_name from user_tab_columns tc where table_name = 'MIG_'||p_table_name order by column_id;
  v_sql varchar2(20000);
  v_cols varchar2(20000);
  v_table_name varchar2(200);
begin
  execute immediate 'truncate table ' || P_TABLE_NAME || '_MIG';
  v_table_name:=replace(p_table_name,'_DEP','');
  v_table_name:=replace(v_table_name,'_PROP','');
  v_table_name:=replace(v_table_name,'_CAR','');
  v_table_name:=replace(v_table_name,'_GOLD','');
  for rec in c_cols loop
    v_cols:=v_cols || rec.column_name ||',';
  end loop;
  v_cols:=substr(v_cols,1,length(v_cols)-1);
  v_sql:= 'insert into ' || v_table_name || '_mig ('||v_cols||')';
  v_sql:= v_sql || ' select ' || '*' || '  from mig_'||p_table_name;
  --dbms_output.put_line(v_sql);
  execute immediate v_sql;
  commit;
end MIG_CP_DATA;
/