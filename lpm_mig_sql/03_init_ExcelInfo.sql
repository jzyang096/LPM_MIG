--删除操作前先备份原数据
drop table Excelinfo_MIG;
create table Excelinfo_MIg as select * from excelInfo;
--初始化表数据
truncate table Excelinfo;

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1000', 'SQ_BAD_DATA', '自检非法数据', '自检非法数据', '1000', '2', '1', '自检非法数据');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1001', 'SQ_TABLE_ROW', '迁入数据总记录数', '迁入数据总记录数', '1001', '1', '1', '迁入数据总记录数');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1010', 'CUSTOMER_INFO', '大中客户记录数', '大中客户记录数', '1010', '1', '1', '大中客户记录数');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1020', 'CUSTOMER_INFO', '小微客户记录数', '小微客户记录数', '1020', '1', '1', '小微客户记录数');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1030', 'CUSTOMER_INFO', '个人客户记录数', '个人客户记录数', '1030', '1', '1', '个人客户记录数');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1040', 'CUSTOMER_INFO', '同业客户记录数', '同业客户记录数', '1040', '1', '1', '同业客户记录数');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1050', 'CUSTOMER_INFO', '集团客户记录数', '集团客户记录数', '1050', '1', '1', '集团客户记录数');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1060', 'GROUP_MEMBER_RELATIVE', '集团成员记录数', '集团成员记录数', '1060', '1', '1', '集团成员记录数');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1070', 'BUSINESS_CONTRACT', '业务合同记录数', '业务合同记录数', '1070', '1', '1', '业务合同记录数');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1080', 'GUARANTY_CONTRACT', '担保合同记录数', '担保合同记录数', '1080', '1', '1', '担保合同记录数');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1090', 'GUARANTY_INFO', '押品记录数', '押品记录数', '1090', '1', '1', '押品记录数');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1100', 'GUARANTY_INFO', '押品权利人总额核对', '押品权利人总额核对', '1100', '1', '1', '押品权利人总额核对');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1110', 'GUARANTY_CMS_INFO', '押品保险记录数', '押品保险记录数', '1110', '1', '1', '押品保险记录数');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1120', 'CL_INFO', '额度记录数', '额度记录数', '1120', '1', '1', '额度记录数');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1130', 'CL_DIVIDE', '基本授信额度切分记录数', '基本授信额度切分记录数', '1130', '1', '1', '基本授信额度切分记录数');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1140', 'CL_INFO', '集团成员额度记录数', '集团成员额度记录数', '1140', '1', '1', '集团成员额度记录数');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1150', 'CL_INFO', '批量额度记录数', '批量额度记录数', '1150', '1', '1', '批量额度记录数');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1160', 'CL_OCCUPY', '国结系统额度占用占额层核对', '国结系统额度占用占额层核对', '1160', '2', '1', '国结系统额度占用占额层核对');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1161', 'BUSINESS_DUEBILL', '国结系统额度占用借据层核对', '国结系统额度占用借据层核对', '1161', '2', '1', '国结系统额度占用借据层核对');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1170', 'CL_OCCUPY', '供应链系统额度占用占额层核对', '供应链系统额度占用占额层核对', '1170', '2', '1', '供应链系统额度占用占额层核对');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1171', 'BUSINESS_DUEBILL', '供应链系统额度占用借据层核对', '供应链系统额度占用借据层核对', '1171', '2', '1', '供应链系统额度占用借据层核对');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1180', 'CL_OCCUPY', '票据系统额度占用占额层核对', '票据系统额度占用占额层核对', '1180', '2', '1', '票据系统额度占用占额层核对');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1181', 'BUSINESS_DUEBILL', '票据系统额度占用借据层核对', '票据系统额度占用借据层核对', '1181', '2', '1', '票据系统额度占用借据层核对');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1190', 'CL_OCCUPY', '核心一般贷款额度占用占额层核对', '核心一般贷款额度占用占额层核对', '1190', '2', '1', '核心一般贷款额度占用占额层核对');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1191', 'BUSINESS_DUEBILL', '核心一般贷款额度占用借据层核对', '核心一般贷款额度占用借据层核对', '1191', '2', '1', '核心一般贷款额度占用借据层核对');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1200', 'CL_INFO', '综合授信额度金额校验', '综合授信额度金额校验', '1200', '1', '1', '综合授信额度金额校验');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1210', 'CL_DIVIDE', '基本授信切分额度金额校验', '基本授信切分额度金额校验', '1210', '1', '1', '基本授信切分额度金额校验');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1220', 'CL_INFO', '同业额度金额校验', '同业额度金额校验', '1220', '1', '1', '同业额度金额校验');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1230', 'APPLY_BATCHRELATIVE', '批量授信成员占额核对', '批量授信成员占额核对', '1230', '2', '1', '批量授信成员占额核对');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1240', 'BUSINESS_DUEBILL', '核心借据记录数', '核心借据记录数', '1240', '1', '1', '核心借据记录数');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1250', 'BUSINESS_DUEBILL', '票据借据记录数', '票据借据记录数', '1250', '1', '1', '票据借据记录数');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1260', 'BUSINESS_DUEBILL', '国结借据记录数', '国结借据记录数', '1260', '1', '1', '国结借据记录数');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1270', 'BUSINESS_DUEBILL', '供应链借据记录数', '供应链借据记录数', '1270', '1', '1', '供应链借据记录数');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1280', 'BUSINESS_DUEBILL', '核心一般贷款借据总余额核对', '核心一般贷款借据总余额核对', '1280', '1', '1', '核心一般贷款借据总余额核对');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1290', 'BUSINESS_DUEBILL', '票据借据总余额核对', '票据借据总余额核对', '1290', '1', '1', '票据借据总余额核对');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1300', 'BUSINESS_DUEBILL', '国结借据总余额核对', '国结借据总余额核对', '1300', '1', '1', '国结借据总余额核对');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1310', 'BUSINESS_DUEBILL', '供应链借据总余额核对', '供应链借据总余额核对', '1310', '1', '1', '供应链借据总余额核对');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-1320', 'CUSTOMER_BELONG', '客户所属客户经理异常报表', '客户所属客户经理异常报表', '1320', '1', '1', '客户所属客户经理异常报表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-001', 'CUSTOMER_INFO', '大中企业客户信息汇总表', '大中企业客户信息汇总表', '2010', '1', '2', '大中企业客户信息汇总表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-002', 'ENT_INFO', '大中企业客户信息明细表', '大中企业客户信息明细表', '2020', '1', '2', '大中企业客户信息明细表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-003', 'CUSTOMER_INFO', '小微企业客户信息汇总表', '小微企业客户信息汇总表', '2030', '1', '2', '小微企业客户信息汇总表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-004', 'ENT_INFO', '小微企业客户信息明细表', '小微企业客户信息明细表', '2040', '1', '2', '小微企业客户信息明细表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-005', 'CUSTOMER_INFO', '个人客户信息汇总表', '个人客户信息汇总表', '2050', '1', '2', '个人客户信息汇总表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-006', 'IND_INFO', '个人客户信息明细表', '个人客户信息明细表', '2060', '1', '2', '个人客户信息明细表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-007', 'CUSTOMER_INFO', '同业客户信息汇总表', '同业客户信息汇总表', '2070', '1', '2', '同业客户信息汇总表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-008', 'ENT_INFO', '同业客户信息明细表', '同业客户信息明细表', '2080', '1', '2', '同业客户信息明细表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-009', 'CUSTOMER_INFO', '集团客户信息汇总表', '集团客户信息汇总表', '2090', '1', '2', '集团客户信息汇总表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-010', 'GROUP_INFO', '集团客户信息明细表', '集团客户信息明细表', '2100', '1', '2', '集团客户信息明细表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-011', 'GROUP_MEMBER_RELATIVE', '集团成员信息汇总表', '集团成员信息汇总表', '2110', '1', '2', '集团成员信息汇总表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-012', 'GROUP_MEMBER_RELATIVE', '集团成员信息明细表', '集团成员信息明细表', '2120', '1', '2', '集团成员信息明细表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-013', 'CL_INFO', '额度信息汇总表', '额度信息汇总表', '2130', '1', '2', '额度信息汇总表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-014', 'CL_INFO', '额度信息明细表', '额度信息明细表', '2140', '1', '2', '额度信息明细表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-015', 'CL_DIVIDE', '基本授信额度切分汇总表', '基本授信额度切分汇总表', '2150', '1', '2', '基本授信额度切分汇总表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-016', 'CL_DIVIDE', '基本授信额度切分明细表', '基本授信额度切分明细表', '2160', '1', '2', '基本授信额度切分明细表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-017', 'CL_INFO', '同业额度信息汇总表', '同业额度信息汇总表', '2170', '1', '2', '同业额度信息汇总表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-018', 'CL_INFO', '同业额度信息明细表', '同业额度信息明细表', '2180', '1', '2', '同业额度信息明细表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-019', 'APPLY_BATCHRELATIVE', '批量授信下成员明细表', '批量授信下成员明细表', '2190', '1', '2', '批量授信下成员明细表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-020', 'CL_OCCUPY', '国结系统额度占用汇总表', '国结系统额度占用汇总表', '2200', '1', '2', '国结系统额度占用汇总表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-021', 'CL_OCCUPY', '国结系统额度占用明细表', '国结系统额度占用明细表', '2210', '1', '2', '国结系统额度占用明细表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-022', 'CL_OCCUPY', '供应链系统额度占用汇总表', '供应链系统额度占用汇总表', '2220', '1', '2', '供应链系统额度占用汇总表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-023', 'CL_OCCUPY', '供应链系统额度占用明细表', '供应链系统额度占用明细表', '2230', '1', '2', '供应链系统额度占用明细表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-024', 'CL_OCCUPY', '票据系统额度占用汇总表', '票据系统额度占用汇总表', '2240', '1', '2', '票据系统额度占用汇总表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-025', 'CL_OCCUPY', '票据系统额度占用明细表', '票据系统额度占用明细表', '2250', '1', '2', '票据系统额度占用明细表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-027', 'CL_OCCUPY', '核心一般贷款额度占用明细表', '核心一般贷款额度占用明细表', '2270', '1', '2', '核心一般贷款额度占用明细表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-028', 'CL_OCCUPY', '代客资金额度占用明细表', '代客资金额度占用明细表', '2280', '1', '2', '代客资金额度占用明细表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-029', 'CL_OCCUPY', '核心法透额度占用明细表', '核心法透额度占用明细表', '2290', '1', '2', '核心法透额度占用明细表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-030', 'CL_OCCUPY', '资金交易额度占用明细表', '资金交易额度占用明细表', '2300', '2', '2', '资金交易额度占用明细表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-041', 'BUSINESS_DUEBILL', '票据系统借据信息汇总表', '票据系统借据信息汇总表', '2410', '1', '2', '票据系统借据信息汇总表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-042', 'BUSINESS_DUEBILL', '票据系统借据信息明细表', '票据系统借据信息明细表', '2420', '1', '2', '票据系统借据信息明细表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-043', 'BUSINESS_DUEBILL', '国结系统借据信息汇总表', '国结系统借据信息汇总表', '2430', '1', '2', '国结系统借据信息汇总表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-044', 'BUSINESS_DUEBILL', '国结系统借据信息明细表', '国结系统借据信息明细表', '2440', '1', '2', '国结系统借据信息明细表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-045', 'BUSINESS_DUEBILL', '供应链系统借据信息汇总表', '供应链系统借据信息汇总表', '2450', '1', '2', '供应链系统借据信息汇总表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-046', 'BUSINESS_DUEBILL', '供应链系统借据信息明细表', '供应链系统借据信息明细表', '2460', '1', '2', '供应链系统借据信息明细表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-047', 'CUSTOMER_BELONG', '大中客户所属异常报表', '大中客户所属异常报表', '2470', '1', '2', '大中客户所属异常报表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-048', 'CUSTOMER_BELONG', '小微客户所属异常报表', '小微客户所属异常报表', '2480', '1', '2', '小微客户所属异常报表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-049', 'CUSTOMER_BELONG', '个人客户所属异常报表', '个人客户所属异常报表', '2490', '1', '2', '个人客户所属异常报表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-050', 'CUSTOMER_BELONG', '同业客户所属异常报表', '同业客户所属异常报表', '2500', '1', '2', '同业客户所属异常报表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-051', 'CUSTOMER_BELONG', '集团客户所属异常报表', '集团客户所属异常报表', '2510', '1', '2', '集团客户所属异常报表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-052', 'BUSINESS_CONTRACT', '业务合同汇总表', '业务合同汇总表', '2520', '1', '2', '业务合同汇总表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-061', 'GUARANTY_INFO', '押品信息明细表-保函', '押品信息明细表-保函', '2610', '1', '2', '押品信息明细表-保函');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-060', 'GUARANTY_INFO', '押品信息明细表-其他应收账款', '押品信息明细表-其他应收账款', '2600', '1', '2', '押品信息明细表-其他应收账款');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-059', 'GUARANTY_INFO', '押品信息明细表-交易类应收账款', '押品信息明细表-交易类应收账款', '2590', '1', '2', '押品信息明细表-交易类应收账款');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-058', 'GUARANTY_INFO', '押品信息明细表-保证金', '押品信息明细表-保证金', '2580', '1', '2', '押品信息明细表-保证金');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-057', 'GUARANTY_INFO', '押品信息明细表-机器设备', '押品信息明细表-机器设备', '2570', '1', '2', '押品信息明细表-机器设备');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-056', 'GUARANTY_INFO', '押品信息明细表-房产', '押品信息明细表-房产', '2560', '1', '2', '押品信息明细表-房产');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-055', 'GUARANTY_INFO', '押品信息明细表-存单', '押品信息明细表-存单', '2550', '1', '2', '押品信息明细表-存单');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-054', 'GUARANTY_INFO', '押品信息汇总表', '押品信息汇总表', '2540', '1', '2', '押品信息汇总表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-053', 'BUSINESS_CONTRACT', '业务合同明细表', '业务合同明细表', '2530', '1', '2', '业务合同明细表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-038', 'GUARANTY_CMS_INFO', '押品保险明细表', '押品保险明细表', '2380', '1', '2', '押品保险明细表');

insert into Excelinfo (ACTION, TABLENAME, SHEETNAME, TITLENAME, SORTNO, ISINUSE, CHECKMODE, ACTIONNAME)
values ('LPM-RPT-037', 'GUARANTY_CMS_INFO', '押品保险汇总表', '押品保险汇总表', '2370', '1', '2', '押品保险汇总表');

commit;