--drop table
drop table SQ_CL_ERROR;

-- Create table
create table SQ_CL_ERROR
(
  lineid         VARCHAR2(40),
  cltypeid       VARCHAR2(40),
  businesstype   VARCHAR2(40),
  currency       VARCHAR2(40),
  expflag        VARCHAR2(10),
  businesssum    NUMBER(24,6),
  exposuresum    NUMBER(24,6),
  calcurrency    VARCHAR2(40),
  calbusinesssum NUMBER(24,6),
  calexposuresum NUMBER(24,6),
  checkmode      VARCHAR2(40)
);
-- Add comments to the table 
comment on table SQ_CL_ERROR
  is '数据迁移-综合授信额度异常表';
-- Add comments to the columns 
comment on column SQ_CL_ERROR.lineid
  is '综合授信编号/基本授信编号/同业额度编号';
comment on column SQ_CL_ERROR.cltypeid
  is '额度类型';
comment on column SQ_CL_ERROR.businesstype
  is '业务品种';
comment on column SQ_CL_ERROR.currency
  is '币种';
comment on column SQ_CL_ERROR.expflag
  is '是否异常标志';
comment on column SQ_CL_ERROR.businesssum
  is '名义金额';
comment on column SQ_CL_ERROR.exposuresum
  is '敞口金额';
comment on column SQ_CL_ERROR.calcurrency
  is '计算币种';
comment on column SQ_CL_ERROR.calbusinesssum
  is '计算出的名义金额';
comment on column SQ_CL_ERROR.calexposuresum
  is '计算出的敞口金额';
comment on column SQ_CL_ERROR.checkmode
  is '核对模式 1-校验综合授信金额
							 2-校验基本授信切分金额
							 3-校验同业额度金额';
