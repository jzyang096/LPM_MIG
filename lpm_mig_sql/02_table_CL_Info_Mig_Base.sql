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
  is '数据迁移中间表-基本授信明细表';
-- Add comments to the columns 
comment on column CL_INFO_MIG_BASE.lineid
  is '基本授信编号';
comment on column CL_INFO_MIG_BASE.divideserialno
  is '切分流水号';
comment on column CL_INFO_MIG_BASE.mfcustomerid
  is '客户号';
comment on column CL_INFO_MIG_BASE.currency
  is '基本授信币种';
comment on column CL_INFO_MIG_BASE.linesum1
  is '基本授信名义金额';
comment on column CL_INFO_MIG_BASE.linesum2
  is '基本授信敞口金额';
comment on column CL_INFO_MIG_BASE.businesstype
  is '切分业务品种';
comment on column CL_INFO_MIG_BASE.dividecurrency
  is '切分币种';
comment on column CL_INFO_MIG_BASE.businesssum
  is '切分名义金额';
comment on column CL_INFO_MIG_BASE.exposuresum
  is '切分敞口金额';
comment on column CL_INFO_MIG_BASE.parentlineid
  is '所属基本授信编号';
comment on column CL_INFO_MIG_BASE.sortno
  is '排序号';
