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
  is '数据迁移自检程序-非法数据汇总表';
-- Add comments to the columns 
comment on column SQ_BAD_DATA.tablename
  is '表名';
comment on column SQ_BAD_DATA.columnname
  is '列名';
comment on column SQ_BAD_DATA.badreason
  is '问题详情';
comment on column SQ_BAD_DATA.serialno
  is '流水号';
comment on column SQ_BAD_DATA.customerid
  is '客户编号';
comment on column SQ_BAD_DATA.objectno
  is '对象编号';
comment on column SQ_BAD_DATA.objecttype
  is '对象类型';
comment on column SQ_BAD_DATA.guarantyid
  is '押品编号';
comment on column SQ_BAD_DATA.relationship
  is '关联关系';
comment on column SQ_BAD_DATA.userid
  is '客户经理';
comment on column SQ_BAD_DATA.orgid
  is '机构号';
comment on column SQ_BAD_DATA.lineid
  is '额度编号';
comment on column SQ_BAD_DATA.groupid
  is '集团编号';