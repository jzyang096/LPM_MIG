--1.将数据从中间表导入到目标表
insert into ENT_INFO select * from ENT_INFO_MIG;
insert into CUSTOMER_RELATIVE select * from CUSTOMER_RELATIVE_MIG;
insert into CUSTOMER_BELONG select * from CUSTOMER_BELONG_MIG;
insert into IND_INFO select * from IND_INFO_MIG;
insert into CUSTOMER_ADDRESS select * from CUSTOMER_ADDRESS_MIG;
insert into CUSTOMER_TEL select * from CUSTOMER_TEL_MIG;
insert into CUSTOMER_CERT select * from CUSTOMER_CERT_MIG;
insert into BUSINESS_APPROVE select * from BUSINESS_APPROVE_MIG;
insert into BUSINESS_CONTRACT select * from BUSINESS_CONTRACT_MIG;
insert into BUSINESS_DUEBILL select * from BUSINESS_DUEBILL_MIG;
insert into GUARANTY_CONTRACT select * from GUARANTY_CONTRACT_MIG;
insert into GUARANTY_INFO select * from GUARANTY_INFO_MIG;
insert into GUARANTY_RELATIVE select * from GUARANTY_RELATIVE_MIG;
insert into CL_INFO select * from CL_INFO_MIG;
insert into CL_DIVIDE select * from CL_DIVIDE_MIG;
insert into CL_OCCUPY select * from CL_OCCUPY_MIG;
insert into BUSINESS_WASTEBOOK select * from BUSINESS_WASTEBOOK_MIG;
insert into GROUP_INFO select * from GROUP_INFO_MIG;
insert into GROUP_MEMBER_RELATIVE select * from GROUP_MEMBER_RELATIVE_MIG;
insert into CONTRACT_RELATIVE select * from CONTRACT_RELATIVE_MIG;
insert into CMS_INSURANCE_INFO select * from CMS_INSURANCE_INFO_MIG;
insert into CUSTOMER_INFO select * from CUSTOMER_INFO_MIG;
insert into CL_CREDIT_SAME select * from CL_CREDIT_SAME_MIG;
insert into APPLY_BATCHRELATIVE select * from APPLY_BATCHRELATIVE_MIG;
insert into CLASSIFY_RECORD select * from CLASSIFY_RECORD_MIG;
insert into MARGIN_INFO select * from MARGIN_INFO_MIG;
insert into BUSINESS_IMAGE_RELATIVE select * from BUSINESS_IMAGE_RELATIVE_MIG;
insert into BUSINESS_APPLY select * from BUSINESS_APPLY_MIG;
insert into FLOW_OBJECT select * from FLOW_OBJECT_MIG;
insert into FLOW_TASK select * from FLOW_TASK_MIG;
insert into APPLY_RELATIVE select * from APPLY_RELATIVE_MIG;
insert into APPROVE_RELATIVE select * from APPROVE_RELATIVE_MIG;
insert into BUSINESS_PUTOUT select * from BUSINESS_PUTOUT_MIG;
insert into BILL_INFO select * from BILL_INFO_MIG;

commit;