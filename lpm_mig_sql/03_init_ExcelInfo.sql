--ɾ������ǰ�ȱ���ԭ����
drop table Excelinfo_MIG;
create table Excelinfo_MIg as select * from excelInfo;
--��ʼ��������
truncate table Excelinfo;

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1000', 'SQ_BAD_DATA', '�Լ�Ƿ�����', '�Լ�Ƿ�����', '1000', '2', '1', '�Լ�Ƿ�����');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1001', 'SQ_TABLE_ROW', 'Ǩ�������ܼ�¼��', 'Ǩ�������ܼ�¼��', '1001', '1', '1', 'Ǩ�������ܼ�¼��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1010', 'CUSTOMER_INFO', '���пͻ���¼��', '���пͻ���¼��', '1010', '1', '1', '���пͻ���¼��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1020', 'CUSTOMER_INFO', 'С΢�ͻ���¼��', 'С΢�ͻ���¼��', '1020', '1', '1', 'С΢�ͻ���¼��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1030', 'CUSTOMER_INFO', '���˿ͻ���¼��', '���˿ͻ���¼��', '1030', '1', '1', '���˿ͻ���¼��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1040', 'CUSTOMER_INFO', 'ͬҵ�ͻ���¼��', 'ͬҵ�ͻ���¼��', '1040', '1', '1', 'ͬҵ�ͻ���¼��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1050', 'CUSTOMER_INFO', '���ſͻ���¼��', '���ſͻ���¼��', '1050', '1', '1', '���ſͻ���¼��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1060', 'GROUP_MEMBER_RELATIVE', '���ų�Ա��¼��', '���ų�Ա��¼��', '1060', '1', '1', '���ų�Ա��¼��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1070', 'BUSINESS_CONTRACT', 'ҵ���ͬ��¼��', 'ҵ���ͬ��¼��', '1070', '1', '1', 'ҵ���ͬ��¼��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1080', 'GUARANTY_CONTRACT', '������ͬ��¼��', '������ͬ��¼��', '1080', '1', '1', '������ͬ��¼��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1090', 'GUARANTY_INFO', 'ѺƷ��¼��', 'ѺƷ��¼��', '1090', '1', '1', 'ѺƷ��¼��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1100', 'GUARANTY_INFO', 'ѺƷȨ�����ܶ�˶�', 'ѺƷȨ�����ܶ�˶�', '1100', '1', '1', 'ѺƷȨ�����ܶ�˶�');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1110', 'GUARANTY_CMS_INFO', 'ѺƷ���ռ�¼��', 'ѺƷ���ռ�¼��', '1110', '1', '1', 'ѺƷ���ռ�¼��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1120', 'CL_INFO', '��ȼ�¼��', '��ȼ�¼��', '1120', '1', '1', '��ȼ�¼��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1130', 'CL_DIVIDE', '�������Ŷ���зּ�¼��', '�������Ŷ���зּ�¼��', '1130', '1', '1', '�������Ŷ���зּ�¼��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1140', 'CL_INFO', '���ų�Ա��ȼ�¼��', '���ų�Ա��ȼ�¼��', '1140', '1', '1', '���ų�Ա��ȼ�¼��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1150', 'CL_INFO', '������ȼ�¼��', '������ȼ�¼��', '1150', '1', '1', '������ȼ�¼��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1160', 'CL_OCCUPY', '����ϵͳ���ռ��ռ���˶�', '����ϵͳ���ռ��ռ���˶�', '1160', '2', '1', '����ϵͳ���ռ��ռ���˶�');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1161', 'BUSINESS_DUEBILL', '����ϵͳ���ռ�ý�ݲ�˶�', '����ϵͳ���ռ�ý�ݲ�˶�', '1161', '2', '1', '����ϵͳ���ռ�ý�ݲ�˶�');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1170', 'CL_OCCUPY', '��Ӧ��ϵͳ���ռ��ռ���˶�', '��Ӧ��ϵͳ���ռ��ռ���˶�', '1170', '2', '1', '��Ӧ��ϵͳ���ռ��ռ���˶�');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1171', 'BUSINESS_DUEBILL', '��Ӧ��ϵͳ���ռ�ý�ݲ�˶�', '��Ӧ��ϵͳ���ռ�ý�ݲ�˶�', '1171', '2', '1', '��Ӧ��ϵͳ���ռ�ý�ݲ�˶�');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1180', 'CL_OCCUPY', 'Ʊ��ϵͳ���ռ��ռ���˶�', 'Ʊ��ϵͳ���ռ��ռ���˶�', '1180', '2', '1', 'Ʊ��ϵͳ���ռ��ռ���˶�');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1181', 'BUSINESS_DUEBILL', 'Ʊ��ϵͳ���ռ�ý�ݲ�˶�', 'Ʊ��ϵͳ���ռ�ý�ݲ�˶�', '1181', '2', '1', 'Ʊ��ϵͳ���ռ�ý�ݲ�˶�');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1190', 'CL_OCCUPY', '����һ�������ռ��ռ���˶�', '����һ�������ռ��ռ���˶�', '1190', '2', '1', '����һ�������ռ��ռ���˶�');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1191', 'BUSINESS_DUEBILL', '����һ�������ռ�ý�ݲ�˶�', '����һ�������ռ�ý�ݲ�˶�', '1191', '2', '1', '����һ�������ռ�ý�ݲ�˶�');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1200', 'CL_INFO', '�ۺ����Ŷ�Ƚ��У��', '�ۺ����Ŷ�Ƚ��У��', '1200', '1', '1', '�ۺ����Ŷ�Ƚ��У��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1210', 'CL_DIVIDE', '���������зֶ�Ƚ��У��', '���������зֶ�Ƚ��У��', '1210', '1', '1', '���������зֶ�Ƚ��У��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1220', 'CL_INFO', 'ͬҵ��Ƚ��У��', 'ͬҵ��Ƚ��У��', '1220', '1', '1', 'ͬҵ��Ƚ��У��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1230', 'APPLY_BATCHRELATIVE', '�������ų�Առ��˶�', '�������ų�Առ��˶�', '1230', '2', '1', '�������ų�Առ��˶�');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1240', 'BUSINESS_DUEBILL', '���Ľ�ݼ�¼��', '���Ľ�ݼ�¼��', '1240', '1', '1', '���Ľ�ݼ�¼��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1250', 'BUSINESS_DUEBILL', 'Ʊ�ݽ�ݼ�¼��', 'Ʊ�ݽ�ݼ�¼��', '1250', '1', '1', 'Ʊ�ݽ�ݼ�¼��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1260', 'BUSINESS_DUEBILL', '�����ݼ�¼��', '�����ݼ�¼��', '1260', '1', '1', '�����ݼ�¼��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1270', 'BUSINESS_DUEBILL', '��Ӧ����ݼ�¼��', '��Ӧ����ݼ�¼��', '1270', '1', '1', '��Ӧ����ݼ�¼��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1280', 'BUSINESS_DUEBILL', '����һ������������˶�', '����һ������������˶�', '1280', '1', '1', '����һ������������˶�');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1290', 'BUSINESS_DUEBILL', 'Ʊ�ݽ�������˶�', 'Ʊ�ݽ�������˶�', '1290', '1', '1', 'Ʊ�ݽ�������˶�');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1300', 'BUSINESS_DUEBILL', '�����������˶�', '�����������˶�', '1300', '1', '1', '�����������˶�');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1310', 'BUSINESS_DUEBILL', '��Ӧ����������˶�', '��Ӧ����������˶�', '1310', '1', '1', '��Ӧ����������˶�');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1320', 'CUSTOMER_BELONG', '�ͻ������ͻ������쳣����', '�ͻ������ͻ������쳣����', '1320', '1', '1', '�ͻ������ͻ������쳣����');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-001', 'CUSTOMER_INFO', '������ҵ�ͻ���Ϣ���ܱ�', '������ҵ�ͻ���Ϣ���ܱ�', '2010', '1', '2', '������ҵ�ͻ���Ϣ���ܱ�');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-002', 'ENT_INFO', '������ҵ�ͻ���Ϣ��ϸ��', '������ҵ�ͻ���Ϣ��ϸ��', '2020', '1', '2', '������ҵ�ͻ���Ϣ��ϸ��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-003', 'CUSTOMER_INFO', 'С΢��ҵ�ͻ���Ϣ���ܱ�', 'С΢��ҵ�ͻ���Ϣ���ܱ�', '2030', '1', '2', 'С΢��ҵ�ͻ���Ϣ���ܱ�');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-004', 'ENT_INFO', 'С΢��ҵ�ͻ���Ϣ��ϸ��', 'С΢��ҵ�ͻ���Ϣ��ϸ��', '2040', '1', '2', 'С΢��ҵ�ͻ���Ϣ��ϸ��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-005', 'CUSTOMER_INFO', '���˿ͻ���Ϣ���ܱ�', '���˿ͻ���Ϣ���ܱ�', '2050', '1', '2', '���˿ͻ���Ϣ���ܱ�');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-006', 'IND_INFO', '���˿ͻ���Ϣ��ϸ��', '���˿ͻ���Ϣ��ϸ��', '2060', '1', '2', '���˿ͻ���Ϣ��ϸ��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-007', 'CUSTOMER_INFO', 'ͬҵ�ͻ���Ϣ���ܱ�', 'ͬҵ�ͻ���Ϣ���ܱ�', '2070', '1', '2', 'ͬҵ�ͻ���Ϣ���ܱ�');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-008', 'ENT_INFO', 'ͬҵ�ͻ���Ϣ��ϸ��', 'ͬҵ�ͻ���Ϣ��ϸ��', '2080', '1', '2', 'ͬҵ�ͻ���Ϣ��ϸ��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-009', 'CUSTOMER_INFO', '���ſͻ���Ϣ���ܱ�', '���ſͻ���Ϣ���ܱ�', '2090', '1', '2', '���ſͻ���Ϣ���ܱ�');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-010', 'GROUP_INFO', '���ſͻ���Ϣ��ϸ��', '���ſͻ���Ϣ��ϸ��', '2100', '1', '2', '���ſͻ���Ϣ��ϸ��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-011', 'GROUP_MEMBER_RELATIVE', '���ų�Ա��Ϣ���ܱ�', '���ų�Ա��Ϣ���ܱ�', '2110', '1', '2', '���ų�Ա��Ϣ���ܱ�');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-012', 'GROUP_MEMBER_RELATIVE', '���ų�Ա��Ϣ��ϸ��', '���ų�Ա��Ϣ��ϸ��', '2120', '1', '2', '���ų�Ա��Ϣ��ϸ��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-013', 'CL_INFO', '�����Ϣ���ܱ�', '�����Ϣ���ܱ�', '2130', '1', '2', '�����Ϣ���ܱ�');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-014', 'CL_INFO', '�����Ϣ��ϸ��', '�����Ϣ��ϸ��', '2140', '1', '2', '�����Ϣ��ϸ��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-015', 'CL_DIVIDE', '�������Ŷ���зֻ��ܱ�', '�������Ŷ���зֻ��ܱ�', '2150', '1', '2', '�������Ŷ���зֻ��ܱ�');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-016', 'CL_DIVIDE', '�������Ŷ���з���ϸ��', '�������Ŷ���з���ϸ��', '2160', '1', '2', '�������Ŷ���з���ϸ��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-017', 'CL_INFO', 'ͬҵ�����Ϣ���ܱ�', 'ͬҵ�����Ϣ���ܱ�', '2170', '1', '2', 'ͬҵ�����Ϣ���ܱ�');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-018', 'CL_INFO', 'ͬҵ�����Ϣ��ϸ��', 'ͬҵ�����Ϣ��ϸ��', '2180', '1', '2', 'ͬҵ�����Ϣ��ϸ��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-019', 'APPLY_BATCHRELATIVE', '���������³�Ա��ϸ��', '���������³�Ա��ϸ��', '2190', '1', '2', '���������³�Ա��ϸ��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-020', 'CL_OCCUPY', '����ϵͳ���ռ�û��ܱ�', '����ϵͳ���ռ�û��ܱ�', '2200', '1', '2', '����ϵͳ���ռ�û��ܱ�');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-021', 'CL_OCCUPY', '����ϵͳ���ռ����ϸ��', '����ϵͳ���ռ����ϸ��', '2210', '1', '2', '����ϵͳ���ռ����ϸ��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-022', 'CL_OCCUPY', '��Ӧ��ϵͳ���ռ�û��ܱ�', '��Ӧ��ϵͳ���ռ�û��ܱ�', '2220', '1', '2', '��Ӧ��ϵͳ���ռ�û��ܱ�');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-023', 'CL_OCCUPY', '��Ӧ��ϵͳ���ռ����ϸ��', '��Ӧ��ϵͳ���ռ����ϸ��', '2230', '1', '2', '��Ӧ��ϵͳ���ռ����ϸ��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-024', 'CL_OCCUPY', 'Ʊ��ϵͳ���ռ�û��ܱ�', 'Ʊ��ϵͳ���ռ�û��ܱ�', '2240', '1', '2', 'Ʊ��ϵͳ���ռ�û��ܱ�');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-025', 'CL_OCCUPY', 'Ʊ��ϵͳ���ռ����ϸ��', 'Ʊ��ϵͳ���ռ����ϸ��', '2250', '1', '2', 'Ʊ��ϵͳ���ռ����ϸ��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-027', 'CL_OCCUPY', '����һ�������ռ����ϸ��', '����һ�������ռ����ϸ��', '2270', '1', '2', '����һ�������ռ����ϸ��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-028', 'CL_OCCUPY', '�����ʽ���ռ����ϸ��', '�����ʽ���ռ����ϸ��', '2280', '1', '2', '�����ʽ���ռ����ϸ��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-029', 'CL_OCCUPY', '���ķ�͸���ռ����ϸ��', '���ķ�͸���ռ����ϸ��', '2290', '1', '2', '���ķ�͸���ռ����ϸ��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-030', 'CL_OCCUPY', '�ʽ��׶��ռ����ϸ��', '�ʽ��׶��ռ����ϸ��', '2300', '2', '2', '�ʽ��׶��ռ����ϸ��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-041', 'BUSINESS_DUEBILL', 'Ʊ��ϵͳ�����Ϣ���ܱ�', 'Ʊ��ϵͳ�����Ϣ���ܱ�', '2410', '1', '2', 'Ʊ��ϵͳ�����Ϣ���ܱ�');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-042', 'BUSINESS_DUEBILL', 'Ʊ��ϵͳ�����Ϣ��ϸ��', 'Ʊ��ϵͳ�����Ϣ��ϸ��', '2420', '1', '2', 'Ʊ��ϵͳ�����Ϣ��ϸ��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-043', 'BUSINESS_DUEBILL', '����ϵͳ�����Ϣ���ܱ�', '����ϵͳ�����Ϣ���ܱ�', '2430', '1', '2', '����ϵͳ�����Ϣ���ܱ�');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-044', 'BUSINESS_DUEBILL', '����ϵͳ�����Ϣ��ϸ��', '����ϵͳ�����Ϣ��ϸ��', '2440', '1', '2', '����ϵͳ�����Ϣ��ϸ��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-045', 'BUSINESS_DUEBILL', '��Ӧ��ϵͳ�����Ϣ���ܱ�', '��Ӧ��ϵͳ�����Ϣ���ܱ�', '2450', '1', '2', '��Ӧ��ϵͳ�����Ϣ���ܱ�');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-046', 'BUSINESS_DUEBILL', '��Ӧ��ϵͳ�����Ϣ��ϸ��', '��Ӧ��ϵͳ�����Ϣ��ϸ��', '2460', '1', '2', '��Ӧ��ϵͳ�����Ϣ��ϸ��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-047', 'CUSTOMER_BELONG', '���пͻ������쳣����', '���пͻ������쳣����', '2470', '1', '2', '���пͻ������쳣����');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-048', 'CUSTOMER_BELONG', 'С΢�ͻ������쳣����', 'С΢�ͻ������쳣����', '2480', '1', '2', 'С΢�ͻ������쳣����');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-049', 'CUSTOMER_BELONG', '���˿ͻ������쳣����', '���˿ͻ������쳣����', '2490', '1', '2', '���˿ͻ������쳣����');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-050', 'CUSTOMER_BELONG', 'ͬҵ�ͻ������쳣����', 'ͬҵ�ͻ������쳣����', '2500', '1', '2', 'ͬҵ�ͻ������쳣����');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-051', 'CUSTOMER_BELONG', '���ſͻ������쳣����', '���ſͻ������쳣����', '2510', '1', '2', '���ſͻ������쳣����');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-052', 'BUSINESS_CONTRACT', 'ҵ���ͬ���ܱ�', 'ҵ���ͬ���ܱ�', '2520', '1', '2', 'ҵ���ͬ���ܱ�');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-061', 'GUARANTY_INFO', 'ѺƷ��Ϣ��ϸ��-����', 'ѺƷ��Ϣ��ϸ��-����', '2610', '1', '2', 'ѺƷ��Ϣ��ϸ��-����');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-060', 'GUARANTY_INFO', 'ѺƷ��Ϣ��ϸ��-����Ӧ���˿�', 'ѺƷ��Ϣ��ϸ��-����Ӧ���˿�', '2600', '1', '2', 'ѺƷ��Ϣ��ϸ��-����Ӧ���˿�');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-059', 'GUARANTY_INFO', 'ѺƷ��Ϣ��ϸ��-������Ӧ���˿�', 'ѺƷ��Ϣ��ϸ��-������Ӧ���˿�', '2590', '1', '2', 'ѺƷ��Ϣ��ϸ��-������Ӧ���˿�');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-058', 'GUARANTY_INFO', 'ѺƷ��Ϣ��ϸ��-��֤��', 'ѺƷ��Ϣ��ϸ��-��֤��', '2580', '1', '2', 'ѺƷ��Ϣ��ϸ��-��֤��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-057', 'GUARANTY_INFO', 'ѺƷ��Ϣ��ϸ��-�����豸', 'ѺƷ��Ϣ��ϸ��-�����豸', '2570', '1', '2', 'ѺƷ��Ϣ��ϸ��-�����豸');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-056', 'GUARANTY_INFO', 'ѺƷ��Ϣ��ϸ��-����', 'ѺƷ��Ϣ��ϸ��-����', '2560', '1', '2', 'ѺƷ��Ϣ��ϸ��-����');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-055', 'GUARANTY_INFO', 'ѺƷ��Ϣ��ϸ��-�浥', 'ѺƷ��Ϣ��ϸ��-�浥', '2550', '1', '2', 'ѺƷ��Ϣ��ϸ��-�浥');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-054', 'GUARANTY_INFO', 'ѺƷ��Ϣ���ܱ�', 'ѺƷ��Ϣ���ܱ�', '2540', '1', '2', 'ѺƷ��Ϣ���ܱ�');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-053', 'BUSINESS_CONTRACT', 'ҵ���ͬ��ϸ��', 'ҵ���ͬ��ϸ��', '2530', '1', '2', 'ҵ���ͬ��ϸ��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-038', 'GUARANTY_CMS_INFO', 'ѺƷ������ϸ��', 'ѺƷ������ϸ��', '2380', '1', '2', 'ѺƷ������ϸ��');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-037', 'GUARANTY_CMS_INFO', 'ѺƷ���ջ��ܱ�', 'ѺƷ���ջ��ܱ�', '2370', '1', '2', 'ѺƷ���ջ��ܱ�');

commit;