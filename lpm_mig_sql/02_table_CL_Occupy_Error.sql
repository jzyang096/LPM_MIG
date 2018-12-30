--drop table
drop table CL_OCCUPY_ERROR;

-- Create table
create table CL_OCCUPY_ERROR
(
  serialno         VARCHAR2(32) not null,
  objectno         VARCHAR2(40),
  relativeserialno VARCHAR2(40),
  currency         VARCHAR2(10),
  businesssum      NUMBER(24),
  exposuresum      NUMBER(24),
  flag             VARCHAR2(10),
  sourcesysno      VARCHAR2(10)
);
-- Add comments to the table 
comment on table CL_OCCUPY_ERROR
  is '���ռ���쳣��';
-- Add comments to the columns 
comment on column CL_OCCUPY_ERROR.serialno
  is '��ˮ��';
comment on column CL_OCCUPY_ERROR.objectno
  is '��ݱ��';
comment on column CL_OCCUPY_ERROR.relativeserialno
  is '��ȱ��';
comment on column CL_OCCUPY_ERROR.currency
  is '����';
comment on column CL_OCCUPY_ERROR.businesssum
  is 'ռ��������';
comment on column CL_OCCUPY_ERROR.exposuresum
  is 'ռ�ó��ڽ��';
comment on column CL_OCCUPY_ERROR.flag
  is '1-���ռ��У�� 2-��ݽ��У��';
comment on column CL_OCCUPY_ERROR.sourcesysno
  is 'ϵͳ��Դ';
