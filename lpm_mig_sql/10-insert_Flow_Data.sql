--删除中间表数据
delete from flow_object_mig where 1=1;
delete from flow_task_mig where 1=1;
DROP SEQUENCE SEQ_flow_task_mig;
CREATE SEQUENCE SEQ_flow_task_mig
MINVALUE 1
MAXVALUE 99999999
START WITH 1
INCREMENT BY 1
NOCACHE
CYCLE;

--Flow_Object登记合同记录
insert into flow_object_mig (objecttype,objectno,phasetype,applytype,flowno,flowname,phaseno,phaseName,orgid,userid,inputdate,version,baseflowno)
(select 'BusinessContract',serialno,'1040','BookInContractApply','BookInContractFlow','NY登记合同流程','1000','已批准',manageorgid,manageuserid,to_char(sysdate,'yyyy/mm/dd'),'1','BookInContractFlow' from business_contract_mig);

--Flow_Task登记合同记录
insert into flow_task_mig(serialno,objectno,objecttype,flowno,flowname,phaseno,phasename,phasetype,applytype,userid,begintime,endtime,phaseaction,flowstate,taskstate,version,baseflowno)
select 'OLD'||to_char(sysdate,'yyyymmdd')||lpad(SEQ_flow_task_mig.Nextval,8,0),serialno,'BusinessContract','BookInContractFlow','NY登记合同流程','1000','已批准','1040','BookInContractApply','system',to_char(sysdate,'yyyy/mm/dd HH:mm:ss'),to_char(sysdate,'yyyy/mm/dd HH:mm:ss'),
'AutoFinish','NORMAL','2','1','BookInContractFlow' from business_contract_mig;

commit;