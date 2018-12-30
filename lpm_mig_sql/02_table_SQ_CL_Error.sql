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
  is '����Ǩ��-�ۺ����Ŷ���쳣��';
-- Add comments to the columns 
comment on column SQ_CL_ERROR.lineid
  is '�ۺ����ű��/�������ű��/ͬҵ��ȱ��';
comment on column SQ_CL_ERROR.cltypeid
  is '�������';
comment on column SQ_CL_ERROR.businesstype
  is 'ҵ��Ʒ��';
comment on column SQ_CL_ERROR.currency
  is '����';
comment on column SQ_CL_ERROR.expflag
  is '�Ƿ��쳣��־';
comment on column SQ_CL_ERROR.businesssum
  is '������';
comment on column SQ_CL_ERROR.exposuresum
  is '���ڽ��';
comment on column SQ_CL_ERROR.calcurrency
  is '�������';
comment on column SQ_CL_ERROR.calbusinesssum
  is '�������������';
comment on column SQ_CL_ERROR.calexposuresum
  is '������ĳ��ڽ��';
comment on column SQ_CL_ERROR.checkmode
  is '�˶�ģʽ 1-У���ۺ����Ž��
							 2-У����������зֽ��
							 3-У��ͬҵ��Ƚ��';
