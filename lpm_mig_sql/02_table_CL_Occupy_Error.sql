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
  is '额度占用异常表';
-- Add comments to the columns 
comment on column CL_OCCUPY_ERROR.serialno
  is '流水号';
comment on column CL_OCCUPY_ERROR.objectno
  is '借据编号';
comment on column CL_OCCUPY_ERROR.relativeserialno
  is '额度编号';
comment on column CL_OCCUPY_ERROR.currency
  is '币种';
comment on column CL_OCCUPY_ERROR.businesssum
  is '占用名义金额';
comment on column CL_OCCUPY_ERROR.exposuresum
  is '占用敞口金额';
comment on column CL_OCCUPY_ERROR.flag
  is '1-额度占用校验 2-借据金额校验';
comment on column CL_OCCUPY_ERROR.sourcesysno
  is '系统来源';
