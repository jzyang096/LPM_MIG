truncate table CL_INFO_MIG_BASE;

--基本授信初始化
insert into cl_info_mig_base(lineid,mfcustomerid,currency,linesum1,linesum2,parentlineid,sortno)
select ci.lineid,t.mfcustomerid,ci.currency,ci.linesum1,ci.linesum2,'',ci.lineid from cl_info_mig ci,customer_info_mig t where ci.customerid=t.customerid
and ci.cltypeid='010';
--切分细项初始化
insert into cl_info_mig_base(divideSerialno,mfcustomerid,businessType,dividecurrency,businessSum,exposureSum,parentlineid,sortno)
select cd.serialno,t.mfcustomerid,cd.dividecode,cd.currency,cd.businesssum,cd.exposuresum,cd.objectno,cd.objectno
 from cl_info_mig ci,cl_divide_mig cd,customer_info_mig t where ci.lineid=cd.objectno and cd.objecttype='CLInfo'
and ci.cltypeid='010' and ci.customerid=t.customerid;

commit;