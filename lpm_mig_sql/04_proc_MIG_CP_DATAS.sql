create or replace procedure MIG_CP_DATAS (P_TABLE_NAME IN VARCHAR2) IS
begin
  execute immediate 'truncate table ' || P_TABLE_NAME || '_MIG';
  if P_TABLE_NAME='GUARANTY_INFO' then
    MIG_CP_DATA(P_TABLE_NAME);
    --MIG_CP_DATA(P_TABLE_NAME||'_DEP');
    --MIG_CP_DATA(P_TABLE_NAME||'_PROP');
    --MIG_CP_DATA(P_TABLE_NAME||'_CAR');
    --MIG_CP_DATA(P_TABLE_NAME||'_GOLD');
  else
    MIG_CP_DATA(P_TABLE_NAME);
  end if;
end MIG_CP_DATAS;
/