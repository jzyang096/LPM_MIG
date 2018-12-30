drop table CL_INFO_MIG_BASE;

-- Create table
create table CL_INFO_MIG_BASE
(
  lineid         VARCHAR2(40),
  divideserialno VARCHAR2(200),
  mfcustomerid   VARCHAR2(40),
  currency       VARCHAR2(18),
  linesum1       NUMBER(24,6),
  linesum2       NUMBER(24,6),
  businesstype   VARCHAR2(40),
  dividecurrency VARCHAR2(40),
  businesssum    NUMBER(24,6),
  exposuresum    NUMBER(24,6),
  parentlineid   VARCHAR2(40),
  sortno         VARCHAR2(40)
);
-- Add comments to the table 
comment on table CL_INFO_MIG_BASE
  is '����Ǩ���м��-����������ϸ��';
-- Add comments to the columns 
comment on column CL_INFO_MIG_BASE.lineid
  is '�������ű��';
comment on column CL_INFO_MIG_BASE.divideserialno
  is '�з���ˮ��';
comment on column CL_INFO_MIG_BASE.mfcustomerid
  is '�ͻ���';
comment on column CL_INFO_MIG_BASE.currency
  is '�������ű���';
comment on column CL_INFO_MIG_BASE.linesum1
  is '��������������';
comment on column CL_INFO_MIG_BASE.linesum2
  is '�������ų��ڽ��';
comment on column CL_INFO_MIG_BASE.businesstype
  is '�з�ҵ��Ʒ��';
comment on column CL_INFO_MIG_BASE.dividecurrency
  is '�зֱ���';
comment on column CL_INFO_MIG_BASE.businesssum
  is '�з�������';
comment on column CL_INFO_MIG_BASE.exposuresum
  is '�зֳ��ڽ��';
comment on column CL_INFO_MIG_BASE.parentlineid
  is '�����������ű��';
comment on column CL_INFO_MIG_BASE.sortno
  is '�����';
