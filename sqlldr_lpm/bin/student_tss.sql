set pages 0;
set feed off;
set heading off;
set feedback off;
set verify off;
set linesize 400;
set term off;
spool /home/lpmtask/ncb_mig/sqlldr_lpm/ctl/&file_name..ctl;	
select (case when data_type='CLOB' then column_name||' CHAR(100000)'||','
             when data_length>=256 then column_name||' CHAR('||DATA_LENGTH||') "trim(:'||column_name||')",'
ELSE  column_name||' "trim(:'||column_name||')",'
END) col from user_tab_columns  where TABLE_NAME = 'MIG_&actual_table' order by column_id;
spool off;
