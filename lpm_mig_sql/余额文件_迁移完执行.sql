  delete from cl_info_his where occurdate = '2018/11/23';
    insert into cl_info_his (LINEID,CLTYPEID,CLTYPENAME,APPLYSERIALNO,APPROVESERIALNO,BCSERIALNO,LINECONTRACTNO,CUSTOMERID,CUSTOMERNAME,LINESUM1,LINESUM2,LINESUM3,CURRENCY,LINEEFFDATE,LINEEFFFLAG,PUTOUTDEADLINE,MATURITYDEADLINE,ROTATIVE,APPROVALPOLICY,FREEZEFLAG,RECENTCHECK,RECENTCHECKSTATUS,CHECKRESULT,OVERFLOWTYPE,INPUTUSER,INPUTORG,INPUTTIME,UPDATETIME,BEGINDATE,ENDDATE,PARENTLINEID,USEORGID,USEORGNAME,BAILRATIO,BUSINESSTYPE,CALCULATETIME,STATUS,FINISHDATE,TEMOCCUPYFLAG,EFFECTBUSINESSSUM,EFFECTEXPOSURESUM,FREEZEBUSINESSSUM,FREEZEEXPOSURESUM,USEDBUSINESSSUM,USEDEXPOSURESUM,USABLEBUSINESSSUM,USABLEEXPOSURESUM,CREDITCYCLE,USEDSUM,USABLESUM,TERMMONTH,BALANCE,FREEZETYPE,AUDITDATE,OCCURTYPE,APPLYTYPE,USEPRODUCTTYPE,BAILCURRENCY,USESYSTEM,BATCHPROJECTSERIALNO,BATCHPROJECTNAME,CAREEDINDUSTRY,MANAGELINEID,OCCURDATE)
    select LINEID,
           CLTYPEID,
           CLTYPENAME,
           APPLYSERIALNO,
           APPROVESERIALNO,
           BCSERIALNO,
           LINECONTRACTNO,
           CUSTOMERID,
           CUSTOMERNAME,
           LINESUM1,
           LINESUM2,
           LINESUM3,
           CURRENCY,
           LINEEFFDATE,
           LINEEFFFLAG,
           PUTOUTDEADLINE,
           MATURITYDEADLINE,
           ROTATIVE,
           APPROVALPOLICY,
           FREEZEFLAG,
           RECENTCHECK,
           RECENTCHECKSTATUS,
           CHECKRESULT,
           OVERFLOWTYPE,
           INPUTUSER,
           INPUTORG,
           INPUTTIME,
           UPDATETIME,
           BEGINDATE,
           ENDDATE,
           PARENTLINEID,
           USEORGID,
           USEORGNAME,
           BAILRATIO,
           BUSINESSTYPE,
           CALCULATETIME,
           STATUS,
           FINISHDATE,
           TEMOCCUPYFLAG,
           EFFECTBUSINESSSUM,
           EFFECTEXPOSURESUM,
           FREEZEBUSINESSSUM,
           FREEZEEXPOSURESUM,
           USEDBUSINESSSUM,
           USEDEXPOSURESUM,
           USABLEBUSINESSSUM,
           USABLEEXPOSURESUM,
           CREDITCYCLE,
           USEDSUM,
           USABLESUM,
           TERMMONTH,
           BALANCE,
           FREEZETYPE,
           AUDITDATE,
           OCCURTYPE,
           APPLYTYPE,
           USEPRODUCTTYPE,
           BAILCURRENCY,
           USESYSTEM,
           BATCHPROJECTSERIALNO,
           BATCHPROJECTNAME,
           CAREEDINDUSTRY,
           MANAGELINEID,
           '2018/11/23'
      from cl_info;
commit;

--额度余额文件
delete from cbs_bpqapbl where occurdate = '2018/11/23';
insert into cbs_bpqapbl
      (AC, CCY, APP, BRH_OLD, CNTR_TYPE, REF_NO, CI_NO, BAL1, occurdate,baltype)
      select ci.lineid,
             ci.currency,
             'LP',
             nvl((select (case when orglevel='0' then '043401' else remark end) from org_info where orgid = ci.inputorg),ci.inputorg) as BRH_OLD,
             'LOAN',
             substr(lineid, -16,16),
             (select mfcustomerid
                from customer_info
               where customerid = ci.customerid) as CI_NO,
             nvl(least(greatest((ci.linesum1 - nvl(ci.freezebusinesssum,0) - nvl(ci.usedbusinesssum,0)),0), nvl(ci.effectbusinesssum,0)),0) as AMT1,
             '2018/11/23',
             'ED'
         from cl_info_his ci
        where ci.businesstype not in ('302050','302055','302095','302093','302094','302097','302080','610010','610020','610030','3080','3060','3070','3075',
                                 '3131','3133','3153','3181','3110','3121','3135','3137','3145','3183','3185','302030','302035','121010','3040','3050','30','31')
          and ci.status = '1'
          and occurdate = '2018/11/23';    
commit;

--押品余额文件
insert into cbs_bpqapbl
      (AC, CCY, APP, BRH_OLD, CNTR_TYPE, REF_NO, CI_NO, BAL2,BAL3,occurdate,baltype)
      select case when length(gi.guarantyid) > 25 then substr(gi.guarantyid,-25,25) else gi.guarantyid end, --存量押品编号有超过25位的，从后往前截取25
             nvl(gi.guarantycurrency,gi.evalcurrency),
             'LP',
             nvl((select (case when orglevel='0' then '043401' else remark end) from org_info where orgid = gi.inputorgid),gi.inputorgid) as BRH_OLD,
             'LOAN',
             substr(gi.guarantyid, -16,16),
             (select mfcustomerid
                from customer_info
               where customerid = gi.ownerid) as CI_NO,
             nvl((case
               when (select Attribute1
                       from cms_collateraltype_info
                      where Status = '01'
                        and guarantytype = gi.guarantytype) = '040' then
                gi.confirmvalue1
               else
                0
             end),0) as BAL2, --质押类
             nvl((case
               when (select Attribute1
                       from cms_collateraltype_info
                      where Status = '01'
                        and guarantytype = gi.guarantytype) like '020%' then
                gi.confirmvalue1
               else
                0
             end),0) as BAL3, --抵押类
             '2018/11/23',
             'YP'
        from guaranty_info gi where gi.guarantystatus in ('02','03');   
commit;                 