--drop table
drop table SQ_TABLE_ROW;

-- Create table
create table SQ_TABLE_ROW
(
  tablename      VARCHAR2(200) not null,
  improwcount    NUMBER,
  actualrowcount NUMBER
);
-- Add comments to the table 
comment on table SQ_TABLE_ROW
  is '����Ǩ����ʱ������������¼��';
-- Add comments to the columns 
comment on column SQ_TABLE_ROW.tablename
  is '�������';
comment on column SQ_TABLE_ROW.improwcount
  is 'Ӧ�����¼��';
comment on column SQ_TABLE_ROW.actualrowcount
  is 'ʵ�ʵ����¼��';
-- Create/Recreate primary, unique and foreign key constraints 
alter table SQ_TABLE_ROW
  add constraint SQ_TABLE_ROW_PK primary key (TABLENAME);