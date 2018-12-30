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
  is '数据迁移临时表导入数据量记录表';
-- Add comments to the columns 
comment on column SQ_TABLE_ROW.tablename
  is '导入表名';
comment on column SQ_TABLE_ROW.improwcount
  is '应导入记录数';
comment on column SQ_TABLE_ROW.actualrowcount
  is '实际导入记录数';
-- Create/Recreate primary, unique and foreign key constraints 
alter table SQ_TABLE_ROW
  add constraint SQ_TABLE_ROW_PK primary key (TABLENAME);