-- Drop table
drop table SQ_BAD_DATA;

-- Create table
create table SQ_BAD_DATA
(
  tablename             VARCHAR2(200),
  columnname            VARCHAR2(200),
  columnvalue           VARCHAR2(200),
  badreason             VARCHAR2(500),
  serialno              VARCHAR2(500),
  customerid            VARCHAR2(500),
  objectno              VARCHAR2(500),
  objecttype            VARCHAR2(500),
  guarantyid            VARCHAR2(500),
  relativeid            VARCHAR2(500),
  relationship          VARCHAR2(500),
  userid                VARCHAR2(500),
  orgid                 VARCHAR2(500),
  contractno            VARCHAR2(500),
  lineid                VARCHAR2(500),
  groupid               VARCHAR2(500),
  relativebatchserialno VARCHAR2(500)
);
-- Add comments to the table 
comment on table SQ_BAD_DATA
  is '����Ǩ���Լ����-�Ƿ����ݻ��ܱ�';
-- Add comments to the columns 
comment on column SQ_BAD_DATA.tablename
  is '����';
comment on column SQ_BAD_DATA.columnname
  is '����';
comment on column SQ_BAD_DATA.badreason
  is '��������';
comment on column SQ_BAD_DATA.serialno
  is '��ˮ��';
comment on column SQ_BAD_DATA.customerid
  is '�ͻ����';
comment on column SQ_BAD_DATA.objectno
  is '������';
comment on column SQ_BAD_DATA.objecttype
  is '��������';
comment on column SQ_BAD_DATA.guarantyid
  is 'ѺƷ���';
comment on column SQ_BAD_DATA.relationship
  is '������ϵ';
comment on column SQ_BAD_DATA.userid
  is '�ͻ�����';
comment on column SQ_BAD_DATA.orgid
  is '������';
comment on column SQ_BAD_DATA.lineid
  is '��ȱ��';
comment on column SQ_BAD_DATA.groupid
  is '���ű��';