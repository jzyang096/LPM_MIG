create or replace procedure sq_auto_checkout is
begin
  execute immediate 'TRUNCATE TABLE SQ_BAD_DATA';
  --对公客户信息表ENT_INFO
  --是否征信标准集团客户
  --insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','ECGROUPFLAG',customerid,'必输字段不能为空' from ent_info where ECGROUPFLAG is null);
  --是否征信标准集团客户码值校验
  --insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','ECGROUPFLAG',customerid,'是否征信标准集团客户码值映射有误' from ent_info where ECGROUPFLAG is not null and ECGROUPFLAG not in (select itemNo from code_library where codeNo='YesNo' and isInUse='1') );
  --税务登记证号(地税)
  --insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','TAXNO1',customerid,'必输字段不能为空' from ent_info where TAXNO1 is null);
  --中征码,借据未结清的客户才校验
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','LOANCARDNO',ei.customerid,'必输字段不能为空' from ent_info ei where ei.LOANCARDNO is null and exists (select 1 from business_duebill bd where bd.customerid=ei.customerid and bd.balance>0));
  --国标行业分类
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','INDUSTRYTYPE',customerid,'必输字段不能为空' from ent_info where INDUSTRYTYPE is null);
  --国标行业分类码值校验
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','INDUSTRYTYPE',customerid,'国标行业分类码值映射有误' from ent_info where INDUSTRYTYPE is not null and INDUSTRYTYPE not in (select itemNo from code_library where codeNo='IndustryType' and isInUse='1') );
  --注册资本
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','REGISTERCAPITAL',customerid,'必输字段不能为空' from ent_info where REGISTERCAPITAL is null);
  --注册资本币种
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','RCCURRENCY',customerid,'必输字段不能为空' from ent_info where RCCURRENCY is null);
  --注册资本币种码值校验
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','RCCURRENCY',customerid,'注册资本币种码值映射有误' from ent_info where RCCURRENCY is not null and RCCURRENCY not in (select itemNo from code_library where codeNo='Currency' and isInUse='1') );
  --上市公司类型
  --insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','LISTINGCORPORNOT',customerid,'必输字段不能为空' from ent_info where LISTINGCORPORNOT is null);
  --上市公司类型码值校验
  --insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','LISTINGCORPORNOT',customerid,'上市公司类型码值映射有误' from ent_info where LISTINGCORPORNOT is not null and LISTINGCORPORNOT not in (select itemNo from code_library where codeNo='ListingCorpType' and isInUse='1') );
  --有无进出口经营权
  --insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','HASIERIGHT',customerid,'必输字段不能为空' from ent_info where HASIERIGHT is null);
  --有无进出口经营权码值校验
  --insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','HASIERIGHT',customerid,'有无进出口经营权码值映射有误' from ent_info where HASIERIGHT is not null and HASIERIGHT not in (select itemNo from code_library where codeNo='YesNo' and isInUse='1') );
  --总资产
  --insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','TOTALASSETS',customerid,'必输字段不能为空' from ent_info where TOTALASSETS is null);
  --企业规模
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','SCOPE',customerid,'必输字段不能为空' from ent_info where SCOPE is null);
  --企业规模码值校验
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','SCOPE',customerid,'企业规模码值映射有误' from ent_info where SCOPE is not null and SCOPE not in (select itemNo from code_library where codeNo='Scope' and isInUse='1') );
  --最新客户评级结果
  --insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','ENTEVALUATERESULT',customerid,'必输字段不能为空' from ent_info where ENTEVALUATERESULT is null);
  --最新客户评级结果码值校验
  --insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','ENTEVALUATERESULT',customerid,'最新客户评级结果码值映射有误' from ent_info where ENTEVALUATERESULT is not null and ENTEVALUATERESULT not in (select itemNo from code_library where codeNo='ScoreLevel1' and isInUse='1') );
  --登记客户经理
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','INPUTUSERID',customerid,'登记客户经理为空' from ent_info where INPUTUSERID is null);
  --判断登记客户经理在USER_INFO中是否存在
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','INPUTUSERID',customerid,'登记客户经理在USER_INFO表不存在' from ent_info where INPUTUSERID is not null and INPUTUSERID not in (select USERID from USER_INFO) );
  --登记机构
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','INPUTORGID',customerid,'登记机构为空' from ent_info where INPUTORGID is null);
  --判断登记机构在ORG_INFO中是否存在
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','INPUTORGID',customerid,'登记机构在ORG_INFO表不存在' from ent_info where INPUTORGID is not null and INPUTORGID not in (select ORGID from ORG_INFO) );
  --判断登记客户经理和登记机构是否一致
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason)
  (select 'ENT_INFO','INPUTUSERID,INPUTORGID',customerid,'登记客户经理与登记机构不匹配' from ent_info ei where ei.INPUTUSERID is not null and ei.INPUTORGID is not null and ei.INPUTORGID <> (select ui.BelongOrg from user_info ui where ui.userid=ei.INPUTUSERID ) );
  --判断客户编号在CUSTOMER_INFO表是否存在
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','CUSTOMERID',customerid,'客户编号在CUSTOMER_INFO表不存在' from ent_info where CUSTOMERID is not null and CUSTOMERID not in (select CUSTOMERID from CUSTOMER_INFO) );
  --金融机构类型
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason)
  (select 'ENT_INFO','FINANCETYPE',ei.customerid,'同业客户FINANCETYPE字段不能为空' from ent_info ei,customer_info ci where ei.CUSTOMERID=ci.CUSTOMERID and ci.CustomerType='0610' and ei.FINANCETYPE is null );
  --金融机构类型码值校验
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason)
  (select 'ENT_INFO','FINANCETYPE',ei.customerid,'金融机构类型码值有误' from ent_info ei,customer_info ci where ei.CUSTOMERID=ci.CUSTOMERID and ci.CustomerType='0610' and ei.FINANCETYPE is not null and ei.FINANCETYPE not in (select itemNo from code_library where codeNo='TYOrgType1' and isInUse='1' ) );

  --客户关联表CUSTOMER_RELATIVE
  --关联关系/投资方式/担任职务/出资方式
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, RELATIVEID, RELATIONSHIP,badReason) (select 'CUSTOMER_RELATIVE','RELATIONSHIP',CUSTOMERID, RELATIVEID, RELATIONSHIP,'必输字段不能为空' from customer_relative where RELATIONSHIP is null);
  --关联关系/投资方式/担任职务/出资方式码值校验
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, RELATIVEID, RELATIONSHIP,badReason) (select 'CUSTOMER_RELATIVE','RELATIONSHIP',CUSTOMERID, RELATIVEID, RELATIONSHIP,'关联关系/投资方式/担任职务/出资方式码值映射有误' from customer_relative where RELATIONSHIP is not null and RELATIONSHIP not in (select itemNo from code_library where codeNo='RelationShip' and isInUse='1') );
  --证件号码
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, RELATIVEID, RELATIONSHIP,badReason) (select 'CUSTOMER_RELATIVE','CERTID',CUSTOMERID, RELATIVEID, RELATIONSHIP,'必输字段不能为空' from customer_relative where CERTID is null);
  --证件类型
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, RELATIVEID, RELATIONSHIP,badReason) (select 'CUSTOMER_RELATIVE','CERTTYPE',CUSTOMERID, RELATIVEID, RELATIONSHIP,'必输字段不能为空' from customer_relative where CERTTYPE is null);
  --证件类型码值校验
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, RELATIVEID, RELATIONSHIP,badReason) (select 'CUSTOMER_RELATIVE','CERTTYPE',CUSTOMERID, RELATIVEID, RELATIONSHIP,'证件类型码值映射有误' from customer_relative where CERTTYPE is not null and CERTTYPE not in (select itemNo from code_library where codeNo='CertType' and isInUse='1') );
  --是否有效
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, RELATIVEID, RELATIONSHIP,badReason) (select 'CUSTOMER_RELATIVE','EFFSTATUS',CUSTOMERID, RELATIVEID, RELATIONSHIP,'必输字段不能为空' from customer_relative where EFFSTATUS is null);
  --是否有效码值校验
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, RELATIVEID, RELATIONSHIP,badReason) (select 'CUSTOMER_RELATIVE','EFFSTATUS',CUSTOMERID, RELATIVEID, RELATIONSHIP,'是否有效码值映射有误' from customer_relative where EFFSTATUS is not null and EFFSTATUS not in (select itemNo from code_library where codeNo='EffStatus' and isInUse='1') );
  --关系编号
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, RELATIVEID, RELATIONSHIP,badReason) (select 'CUSTOMER_RELATIVE','RELATIVEID',CUSTOMERID, RELATIVEID, RELATIONSHIP,'必输字段不能为空' from customer_relative where RELATIVEID is null);
  --关系编号所对应客户在Customer_Info表是否存在
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, RELATIVEID, RELATIONSHIP,badReason) (select 'CUSTOMER_RELATIVE','RELATIVEID',CUSTOMERID, RELATIVEID, RELATIONSHIP,'关系编号对应客户在Customer_Info表不存在' from customer_relative where RELATIVEID is not null and RELATIVEID not in (select customerid from customer_info) );
  --客户编号
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, RELATIVEID, RELATIONSHIP,badReason) (select 'CUSTOMER_RELATIVE','CUSTOMERID',CUSTOMERID, RELATIVEID, RELATIONSHIP,'必输字段不能为空' from customer_relative where CUSTOMERID is null);
  --客户编号对应客户在Customer_Info表是否存在
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, RELATIVEID, RELATIONSHIP,badReason) (select 'CUSTOMER_RELATIVE','CUSTOMERID',CUSTOMERID, RELATIVEID, RELATIONSHIP,'客户编号对应客户在Customer_Info表不存在' from customer_relative where CUSTOMERID is not null and CUSTOMERID not in (select customerid from customer_info) );
  --客户编号与关联编号不能相同(不能与自己建立关联关系) add by gwwang 181224 
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, RELATIVEID, RELATIONSHIP,badReason) (select 'CUSTOMER_RELATIVE','CUSTOMERID,RELATIVEID',CUSTOMERID, RELATIVEID, RELATIONSHIP,'客户编号与关联编号不能相同(不能与自己建立关联关系)' from customer_relative where CUSTOMERID = RELATIVEID);

  --个人客户信息IND_INFO
  --婚姻状况
  --insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'IND_INFO','MARRIAGE',CUSTOMERID,'必输字段不能为空' from ind_info where MARRIAGE is null);
  --婚姻状况码值校验
  --insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'IND_INFO','MARRIAGE',CUSTOMERID,'婚姻状况码值映射有误' from ind_info where MARRIAGE is not null and MARRIAGE not in (select itemNo from code_library where codeNo='Marriage' and isInUse='1') );
  --性别
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'IND_INFO','SEX',CUSTOMERID,'必输字段不能为空' from ind_info where SEX is null);
  --性别码值校验
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'IND_INFO','SEX',CUSTOMERID,'性别码值映射有误' from ind_info where SEX is not null and SEX not in (select itemNo from code_library where codeNo='Sex' and isInUse='1') );
  --最高学位
  --insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'IND_INFO','EDUDEGREE',CUSTOMERID,'必输字段不能为空' from ind_info where EDUDEGREE is null);
  --最高学位码值校验
  --insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'IND_INFO','EDUDEGREE',CUSTOMERID,'最高学位码值映射有误' from ind_info where EDUDEGREE is not null and EDUDEGREE not in (select itemNo from code_library where codeNo='EducationDegree' and isInUse='1') );
  --最高学历
  --insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'IND_INFO','EDUEXPERIENCE',CUSTOMERID,'必输字段不能为空' from ind_info where EDUEXPERIENCE is null);
  --最高学历码值校验
  --insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'IND_INFO','EDUEXPERIENCE',CUSTOMERID,'最高学历映射有误' from ind_info where EDUEXPERIENCE is not null and EDUEXPERIENCE not in (select itemNo from code_library where codeNo='EducationExperience' and isInUse='1') );
  --居住状况
  --insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'IND_INFO','FAMILYSTATUS',CUSTOMERID,'必输字段不能为空' from ind_info where FAMILYSTATUS is null);
  --居住状况码值校验
  --insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'IND_INFO','FAMILYSTATUS',CUSTOMERID,'居住状况码值映射有误' from ind_info where FAMILYSTATUS is not null and FAMILYSTATUS not in (select itemNo from code_library where codeNo='FamilyStatus' and isInUse='1') );
  --出生日期
  --insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'IND_INFO','BIRTHDAY',CUSTOMERID,'必输字段不能为空' from ind_info where BIRTHDAY is null);
  --姓名
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'IND_INFO','FULLNAME',CUSTOMERID,'必输字段不能为空' from ind_info where FULLNAME is null);
  --证件类型
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'IND_INFO','CERTTYPE',CUSTOMERID,'必输字段不能为空' from ind_info where CERTTYPE is null);
  --证件类型码值校验
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'IND_INFO','CERTTYPE',CUSTOMERID,'证件类型码值映射有误' from ind_info where CERTTYPE is not null and CERTTYPE not in (select itemNo from code_library where codeNo='CertType' and isInUse='1') );
  --证件号码
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'IND_INFO','CERTID',CUSTOMERID,'必输字段不能为空' from ind_info where CERTID is null);
  --判断客户编号在CUSTOMER_INFO表是否存在
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason)
  (select 'IND_INFO','CUSTOMERID',CUSTOMERID,'该客户在CUSTOMER_INFO表不存在' from ind_info where CUSTOMERID not in (select CUSTOMERID from CUSTOMER_INFO) );

  --担保合同表GUARANTY_CONTRACT
  --担保合同类型
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GUARANTY_CONTRACT','CONTRACTTYPE',SERIALNO,'必输字段不能为空' from guaranty_contract where CONTRACTTYPE is null);
  --担保合同类型码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GUARANTY_CONTRACT','CONTRACTTYPE',SERIALNO,'担保合同类型码值映射有误' from guaranty_contract where CONTRACTTYPE is not null and CONTRACTTYPE not in (select itemNo from code_library where codeNo='ContractType' and isInUse='1') );
  --担保方式
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GUARANTY_CONTRACT','GUARANTYTYPE',SERIALNO,'必输字段不能为空' from guaranty_contract where GUARANTYTYPE is null);
  --担保方式码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GUARANTY_CONTRACT','GUARANTYTYPE',SERIALNO,'担保方式码值映射有误' from guaranty_contract where GUARANTYTYPE is not null and GUARANTYTYPE not in (select itemNo from code_library where codeNo='VouchType1' and isInUse='1') );
  --抵押/出质/保证人证件类型
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GUARANTY_CONTRACT','CERTTYPE',SERIALNO,'必输字段不能为空' from guaranty_contract where CERTTYPE is null);
  --抵押/出质/保证人证件类型码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GUARANTY_CONTRACT','CERTTYPE',SERIALNO,'抵押/出质/保证人证件类型码值映射有误' from guaranty_contract where CERTTYPE is not null and CERTTYPE not in (select itemNo from code_library where codeNo='CertType' and isInUse='1') );
  --合同状态
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GUARANTY_CONTRACT','CONTRACTSTATUS',SERIALNO,'必输字段不能为空' from guaranty_contract where CONTRACTSTATUS is null);
  --合同状态码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GUARANTY_CONTRACT','CONTRACTSTATUS',SERIALNO,'合同状态码值映射有误' from guaranty_contract where CONTRACTSTATUS is not null and CONTRACTSTATUS not in (select itemNo from code_library where codeNo='ContractStatus' and isInUse='1') );
  --合同生效日
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GUARANTY_CONTRACT','BEGINDATE',SERIALNO,'必输字段不能为空' from guaranty_contract where BEGINDATE is null);
  --合同到期日
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GUARANTY_CONTRACT','ENDDATE',SERIALNO,'必输字段不能为空' from guaranty_contract where ENDDATE is null);
  --币种
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GUARANTY_CONTRACT','GUARANTYCURRENCY',SERIALNO,'必输字段不能为空' from guaranty_contract where GUARANTYCURRENCY is null);
  --币种码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GUARANTY_CONTRACT','GUARANTYCURRENCY',SERIALNO,'担保合同币种码值映射有误' from guaranty_contract where GUARANTYCURRENCY is not null and GUARANTYCURRENCY not in (select itemNo from code_library where codeNo='Currency' and isInUse='1') );
  --担保总金额
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GUARANTY_CONTRACT','GUARANTYVALUE',SERIALNO,'必输字段不能为空' from guaranty_contract where GUARANTYVALUE is null);
  --业务合同上客户编号
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GUARANTY_CONTRACT','CUSTOMERID',SERIALNO,'必输字段不能为空' from guaranty_contract where CUSTOMERID is null);
  --业务合同上客户编号在Customer_Info表是否存在
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GUARANTY_CONTRACT','CUSTOMERID',SERIALNO,'必输字段不能为空' from guaranty_contract where CUSTOMERID is not null and CUSTOMERID not in (select customerid from customer_info ));
  --抵/质押人客户编号
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GUARANTY_CONTRACT','GUARANTORID',SERIALNO,'必输字段不能为空' from guaranty_contract where GUARANTORID is null);
  --抵/质押人客户编号在Customer_Info表是否存在
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GUARANTY_CONTRACT','GUARANTORID',SERIALNO,'必输字段不能为空' from guaranty_contract where GUARANTORID is not null and GUARANTORID not in (select customerid from customer_info ));
  --证件号码
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GUARANTY_CONTRACT','CERTID',SERIALNO,'必输字段不能为空' from guaranty_contract where CERTID is null);

  --额度基本信息表CL_INFO
  --业务品种
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','BUSINESSTYPE',LINEID,'必输字段不能为空' from cl_info where BUSINESSTYPE is null);
  --业务品种码值校验
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','BUSINESSTYPE',LINEID,'额度业务品种映射有误' from cl_info where BUSINESSTYPE is not null and BUSINESSTYPE not in (select typeNo from business_Type where isInUse ='1') );
  --到期日
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','ENDDATE',LINEID,'必输字段不能为空' from cl_info where ENDDATE is null);
  --币种
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','CURRENCY',LINEID,'必输字段不能为空' from cl_info where CURRENCY is null);
  --币种码值校验
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','CURRENCY',LINEID,'币种码值映射有误' from cl_info where CURRENCY is not null and CURRENCY not in (select itemNo from code_library where codeNo='Currency' and isInUse='1') );
  --起始日
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','BEGINDATE',LINEID,'必输字段不能为空' from cl_info where BEGINDATE is null);
  --敞口金额
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','LINESUM2',LINEID,'必输字段不能为空' from cl_info where LINESUM2 is null);
  --授信总额
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','LINESUM1',LINEID,'必输字段不能为空' from cl_info where LINESUM1 is null);
  --校验额度名义金额是否大于等于敞口金额
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','LINESUM1,LINESUM2',LINEID,'额度名义金额必须大于等于敞口金额' from cl_info where LINESUM1 < LINESUM2 and LINESUM1 is not null and LINESUM2 is not null );
  --额度类型编号
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','CLTYPEID',LINEID,'必输字段不能为空' from cl_info where CLTYPEID is null);
  --额度类型范围
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','CLTYPEID',LINEID,'额度类型码值映射有误' from cl_info where CLTYPEID is not null and CLTYPEID not in (select itemNo from code_library where codeNo='OURROLE' and isInUse='1') );
  --是否循环
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','ROTATIVE',LINEID,'必输字段不能为空' from cl_info where ROTATIVE is null);
  --是否循环码值校验
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','ROTATIVE',LINEID,'是否循环码值映射有误' from cl_info where ROTATIVE is not null and ROTATIVE not in (select itemNo from code_library where codeNo='YesNo' and isInUse='1') );
  --客户编号
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','CUSTOMERID',LINEID,'必输字段不能为空' from cl_info where CUSTOMERID is null);
  --额度年审日
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','AUDITDATE',LINEID,'必输字段不能为空' from cl_info where AUDITDATE is null);
  --额度状态
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','STATUS',LINEID,'必输字段不能为空' from cl_info where STATUS is null);
  --额度状态码值校验
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','STATUS',LINEID,'额度状态码值映射有误' from cl_info where STATUS is not null and STATUS not in (select itemNo from code_library where codeNo='Status' and isInUse='1') );
  --生效名义金额
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','EFFECTBUSINESSSUM',LINEID,'必输字段不能为空' from cl_info where EFFECTBUSINESSSUM is null);
  --生效敞口金额
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','EFFECTEXPOSURESUM',LINEID,'必输字段不能为空' from cl_info where EFFECTEXPOSURESUM is null);
  --判断生效名义金额是否大于等于生效敞口金额
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason)
  (select 'CL_INFO','EFFECTBUSINESSSUM,EFFECTEXPOSURESUM',LINEID,'生效名义金额必须大于等于生效敞口金额' from cl_info where EFFECTBUSINESSSUM is not null and EFFECTEXPOSURESUM is not null and EFFECTBUSINESSSUM < EFFECTEXPOSURESUM);
  --冻结名义金额
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','FREEZEBUSINESSSUM',LINEID,'必输字段不能为空' from cl_info where FREEZEBUSINESSSUM is null);
  --冻结敞口金额
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','FREEZEEXPOSURESUM',LINEID,'必输字段不能为空' from cl_info where FREEZEEXPOSURESUM is null);
  --判断冻结名义金额是否大于等于冻结敞口金额
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason)
  (select 'CL_INFO','FREEZEBUSINESSSUM,FREEZEEXPOSURESUM',LINEID,'冻结名义金额必须大于等于冻结敞口金额' from cl_info where FREEZEBUSINESSSUM is not null and FREEZEEXPOSURESUM is not null and FREEZEBUSINESSSUM < FREEZEEXPOSURESUM);
  --已用名义金额
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','USEDBUSINESSSUM',LINEID,'必输字段不能为空' from cl_info where USEDBUSINESSSUM is null);
  --已用敞口金额
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','USEDEXPOSURESUM',LINEID,'必输字段不能为空' from cl_info where USEDEXPOSURESUM is null);
  --判断已用名义金额是否大于等于已用敞口金额
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason)
  (select 'CL_INFO','USEDBUSINESSSUM,USEDEXPOSURESUM',LINEID,'已用名义金额必须大于等于已用敞口金额' from cl_info where USEDBUSINESSSUM is not null and USEDEXPOSURESUM is not null and USEDBUSINESSSUM < USEDEXPOSURESUM);
  --是否冻结
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','FREEZEFLAG',LINEID,'必输字段不能为空' from cl_info where FREEZEFLAG is null);
  --是否冻结码值校验
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','FREEZEFLAG',LINEID,'额度状态码值映射有误' from cl_info where FREEZEFLAG is not null and FREEZEFLAG not in (select itemNo from code_library where codeNo='FreezeFlag' and isInUse='1') );
  --期限
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','TERMMONTH',LINEID,'必输字段不能为空' from cl_info where TERMMONTH is null);
  --发生方式
  --insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','OCCURTYPE',lineid,'必输字段不能为空' from cl_info where OCCURTYPE is null);
  --发生方式码值校验
  --insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','OCCURTYPE',lineid,'发生方式码值映射有误' from cl_info where OCCURTYPE is not null and OCCURTYPE <> '010');
  --专项额度适用产品
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','USEPRODUCTTYPE',LINEID,'必输字段不能为空' from cl_info where USEPRODUCTTYPE is null and CLTYPEID='020');
  --专项额度适用产品码值校验
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason)
  (select 'CL_INFO','USEPRODUCTTYPE',LINEID,'专项额度适用产品码值映射有误' from cl_info where USEPRODUCTTYPE is not null and CLTYPEID='020' and USEPRODUCTTYPE not in (select typeno from business_type where isinuse='1'));
  --授信申请流水号
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','APPLYSERIALNO',LINEID,'必输字段不能为空' from cl_info where APPLYSERIALNO is null);
  --判断授信申请流水号在BUSINESS_APPLY表是否存在
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','APPLYSERIALNO',LINEID,'APPLYSERIALNO在BUSINESS_APPLY表不存在' from cl_info where APPLYSERIALNO is not null and APPLYSERIALNO not in (select serialno from BUSINESS_APPLY));
  --授信审批流水号
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','APPROVESERIALNO',LINEID,'必输字段不能为空' from cl_info where APPROVESERIALNO is null);
  --判断授信审批流水号在BUSINESS_APPLY表是否存在
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','APPROVESERIALNO',LINEID,'APPROVESERIALNO在BUSINESS_APPROVE表不存在' from cl_info where APPROVESERIALNO is not null and APPROVESERIALNO not in (select serialno from BUSINESS_APPROVE));
  --判断名义金额是否大于等于已用名义金额
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason)
  (select 'CL_INFO','LINESUM1,USEDBUSINESSSUM',LINEID,'名义金额必须大于等于已用名义金额' from cl_info where LINESUM1 is not null and USEDBUSINESSSUM is not null and LINESUM1 < USEDBUSINESSSUM);
  --判断敞口金额是否大于等于已用敞口金额
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason)
  (select 'CL_INFO','LINESUM2,USEDEXPOSURESUM',LINEID,'敞口金额必须大于等于已用敞口金额' from cl_info where LINESUM2 is not null and USEDEXPOSURESUM is not null and LINESUM2 < USEDEXPOSURESUM);
  --判断生效名义金额是否大于等于已用名义金额
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason)
  (select 'CL_INFO','EFFECTBUSINESSSUM,USEDBUSINESSSUM',LINEID,'生效名义金额必须大于等于已用名义金额' from cl_info where EFFECTBUSINESSSUM is not null and USEDBUSINESSSUM is not null and EFFECTBUSINESSSUM < USEDBUSINESSSUM);
  --判断生效敞口金额是否大于等于已用敞口金额
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason)
  (select 'CL_INFO','EFFECTEXPOSURESUM,USEDEXPOSURESUM',LINEID,'生效敞口金额必须大于等于已用敞口金额' from cl_info where EFFECTEXPOSURESUM is not null and USEDEXPOSURESUM is not null and EFFECTEXPOSURESUM < USEDEXPOSURESUM);

  --额度切分表CL_DIVIDE
  --切分详情代码
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_DIVIDE','DIVIDECODE',SERIALNO,'必输字段不能为空' from cl_divide where DIVIDECODE is null);
  --切分详情代码范围校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_DIVIDE','DIVIDECODE',SERIALNO,'切分详情代码映射有误' from cl_divide where DIVIDECODE is not null and DIVIDECODE not in (select typeNo from business_Type where isInUse ='1') );
  --关联对象编号
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_DIVIDE','OBJECTNO',SERIALNO,'必输字段不能为空' from cl_divide where OBJECTNO is null and OBJECTTYPE='CLInfo');
  --关联对象编号关联查询
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_DIVIDE','OBJECTNO',SERIALNO,OBJECTNO||'对应基本授信额度不在CL_Info表' from cl_divide where OBJECTNO is not null and OBJECTTYPE='CLInfo' and OBJECTNO not in (select lineid from CL_Info));
  --币种
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_DIVIDE','CURRENCY',serialno,'必输字段不能为空' from cl_divide where CURRENCY is null);
  --币种范围校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_DIVIDE','CURRENCY',SERIALNO,'额度状态码值映射有误' from cl_divide where CURRENCY is not null and CURRENCY not in (select itemNo from code_library where codeNo='Currency' and isInUse='1') );
  --名义金额
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_DIVIDE','BUSINESSSUM',SERIALNO,'必输字段不能为空' from cl_divide where BUSINESSSUM is null);
  --敞口金额
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_DIVIDE','EXPOSURESUM',SERIALNO,'必输字段不能为空' from cl_divide where EXPOSURESUM is null);
  --判断名义金额是否大于等于敞口金额
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason)
  (select 'CL_DIVIDE','BUSINESSSUM,EXPOSURESUM',SERIALNO,'名义金额必须大于等于敞口金额' from cl_divide where BUSINESSSUM is not null and EXPOSURESUM is not null and BUSINESSSUM<EXPOSURESUM);
  --切分类型
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_DIVIDE','DIVIDETYPE',SERIALNO,'必输字段不能为空' from cl_divide where DIVIDETYPE is null);
  --切分类型码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_DIVIDE','DIVIDETYPE',SERIALNO,'切分类型码值映射有误' from cl_divide where DIVIDETYPE is not null and DIVIDETYPE <> '1');

  --客户所属列表CUSTOMER_BELONG
  --客户主办权
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, ORGID, USERID,badReason) (select 'CUSTOMER_BELONG','BELONGATTRIBUTE',CUSTOMERID, ORGID, USERID,'必输字段不能为空' from customer_belong where BELONGATTRIBUTE is null);
  --客户主办权码值校验
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, ORGID, USERID,badReason) (select 'CUSTOMER_BELONG','BELONGATTRIBUTE',CUSTOMERID, ORGID, USERID,'客户主办权码值映射有误' from customer_belong where BELONGATTRIBUTE is not null and BELONGATTRIBUTE not in (select itemNo from code_library where codeNo='HaveNot' and isInUse='1') );
  --信息查看权
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, ORGID, USERID,badReason) (select 'CUSTOMER_BELONG','BELONGATTRIBUTE1',CUSTOMERID, ORGID, USERID,'必输字段不能为空' from customer_belong where BELONGATTRIBUTE1 is null);
  --信息查看权码值校验
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, ORGID, USERID,badReason) (select 'CUSTOMER_BELONG','BELONGATTRIBUTE1',CUSTOMERID, ORGID, USERID,'信息查看权码值映射有误' from customer_belong where BELONGATTRIBUTE1 is not null and BELONGATTRIBUTE1 not in (select itemNo from code_library where codeNo='HaveNot' and isInUse='1') );
  --信息维护权
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, ORGID, USERID,badReason) (select 'CUSTOMER_BELONG','BELONGATTRIBUTE2',CUSTOMERID, ORGID, USERID,'必输字段不能为空' from customer_belong where BELONGATTRIBUTE2 is null);
  --信息维护权码值校验
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, ORGID, USERID,badReason) (select 'CUSTOMER_BELONG','BELONGATTRIBUTE2',CUSTOMERID, ORGID, USERID,'信息维护权码值映射有误' from customer_belong where BELONGATTRIBUTE2 is not null and BELONGATTRIBUTE2 not in (select itemNo from code_library where codeNo='HaveNot' and isInUse='1') );
  --业务申办权
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, ORGID, USERID,badReason) (select 'CUSTOMER_BELONG','BELONGATTRIBUTE3',CUSTOMERID, ORGID, USERID,'必输字段不能为空' from customer_belong where BELONGATTRIBUTE3 is null);
  --业务申办权码值校验
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, ORGID, USERID,badReason) (select 'CUSTOMER_BELONG','BELONGATTRIBUTE3',CUSTOMERID, ORGID, USERID,'业务申办权码值映射有误' from customer_belong where BELONGATTRIBUTE3 is not null and BELONGATTRIBUTE3 not in (select itemNo from code_library where codeNo='HaveNot' and isInUse='1') );
  --所属机构
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, ORGID, USERID,badReason) (select 'CUSTOMER_BELONG','ORGID',CUSTOMERID, ORGID, USERID,'必输字段不能为空' from customer_belong where ORGID is null);
  --判断所属机构是否存在
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, ORGID, USERID,badReason) (select 'CUSTOMER_BELONG','ORGID',CUSTOMERID, ORGID, USERID,'所属机构在ORG_INFO表不存在' from customer_belong where ORGID is not null and ORGID not in (select ORGID from ORG_INFO));
  --客户经理
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, ORGID, USERID,badReason) (select 'CUSTOMER_BELONG','USERID',CUSTOMERID, ORGID, USERID,'必输字段不能为空' from customer_belong where USERID is null);
  --判断客户经理是否存在
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, ORGID, USERID,badReason) (select 'CUSTOMER_BELONG','USERID',CUSTOMERID, ORGID, USERID,'客户经理在USER_INFO表不存在' from customer_belong where USERID is not null and userid not in (select userid from user_info));
  --判断客户经理和所属机构是否匹配
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, ORGID, USERID,badReason) (select 'CUSTOMER_BELONG','USERID',cb.CUSTOMERID, cb.ORGID, cb.USERID,'客户经理和机构不匹配' from customer_belong cb where cb.USERID is not null and cb.ORGID is not null and cb.ORGID<> (select ui.BelongOrg from user_info ui where ui.userid=cb.userid));

  --客户联系地址信息表CUSTOMER_ADDRESS
  --客户编号
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_ADDRESS','CUSTOMERID',SERIALNO,'必输字段不能为空' from customer_address where CUSTOMERID is null);
  --判断客户编号在CUSTOMER_INFO表是否存在
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_ADDRESS','CUSTOMERID',SERIALNO,'该客户在CUSTOMER_INFO表不存在' from customer_address where CUSTOMERID is not null and CUSTOMERID not in (select CUSTOMERID from CUSTOMER_INFO));
  --显示语言类型
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_ADDRESS','LANGUAGETYPE',SERIALNO,'必输字段不能为空' from customer_address where LANGUAGETYPE is null);
  --显示语言类型码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_ADDRESS','LANGUAGETYPE',SERIALNO,'显示语言类型码值映射有误' from customer_address where LANGUAGETYPE is not null and LANGUAGETYPE not in (select itemNo from code_library where codeNo='LanguageType' and isInUse='1') );
  --地址类型
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_ADDRESS','ADDTYPE',SERIALNO,'必输字段不能为空' from customer_address where ADDTYPE is null);
  --地址类型码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_ADDRESS','ADDTYPE',SERIALNO,'地址类型码值映射有误' from customer_address where ADDTYPE is not null and ADDTYPE not in (select itemNo from code_library where codeNo='AddType' and isInUse='1') );
  --地址所属国家/地区
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_ADDRESS','COUNTRY',SERIALNO,'必输字段不能为空' from customer_address where COUNTRY is null);
  --地址所属国家/地区码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_ADDRESS','COUNTRY',SERIALNO,'地址所属国家/地区码值映射有误' from customer_address where COUNTRY is not null and COUNTRY not in (select itemNo from code_library where codeNo='CountryCode' and isInUse='1') );
  --地址详情
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_ADDRESS','ADDRESS1',SERIALNO,'必输字段不能为空' from customer_address where ADDRESS1 is null);

  --客户联系电话信息表CUSTOMER_TEL
  --客户编号
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_TEL','CUSTOMERID',SERIALNO,'必输字段不能为空' from customer_tel where CUSTOMERID is null);
  --判断客户编号在CUSTOMER_INFO表是否存在
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_TEL','CUSTOMERID',SERIALNO,'必输字段不能为空' from customer_tel where CUSTOMERID is null);
  --电话类型
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_TEL','TELTYPE',SERIALNO,'必输字段不能为空' from customer_tel where TELTYPE is null);
  --电话类型码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_TEL','TELTYPE',SERIALNO,'电话类型码值映射有误' from customer_tel where TELTYPE is not null and TELTYPE not in (select itemNo from code_library where codeNo='TelType' and isInUse='1') );
  --电话号码
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_TEL','TELEPHONE',SERIALNO,'必输字段不能为空' from customer_tel where TELEPHONE is null);

  --客户证件信息表CUSTOMER_CERT
  --客户编号
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_CERT','CUSTOMERID',SERIALNO,'必输字段不能为空' from customer_cert where CUSTOMERID is null);
  --判断客户编号在CUSTOMER_INFO表是否存在
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_CERT','CUSTOMERID',SERIALNO,'该客户在CUSTOMER_INFO表不存在' from customer_cert where CUSTOMERID is not null and CUSTOMERID not in (select CUSTOMERID from customer_info));
  --证件类型
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_CERT','CERTTYPE',SERIALNO,'必输字段不能为空' from customer_cert where CERTTYPE is null);
  --证件类型码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_CERT','CERTTYPE',SERIALNO,'证件类型码值映射有误' from customer_cert where CERTTYPE is not null and CERTTYPE not in (select itemNo from code_library where codeNo='CertType' and isInUse='1') );
  --证件编号
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_CERT','CERTID',SERIALNO,'必输字段不能为空' from customer_cert where CERTID is null);
  --证件状态
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_CERT','STATUS',SERIALNO,'必输字段不能为空' from customer_cert where STATUS is null);
  --证件状态码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_CERT','STATUS',SERIALNO,'证件状态码值映射有误' from customer_cert where STATUS is not null and STATUS not in (select itemNo from code_library where codeNo='EffStatus' and isInUse='1') );

  --业务合同与担保合同关联表CONTRACT_RELATIVE
  --业务合同编号
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO, OBJECTTYPE, OBJECTNO,badReason) (select 'CONTRACT_RELATIVE','SERIALNO',SERIALNO, OBJECTTYPE, OBJECTNO,'必输字段不能为空' from contract_relative where SERIALNO is null);
  --业务合同在Business_Contract表是否存在
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO, OBJECTTYPE, OBJECTNO,badReason) (select 'CONTRACT_RELATIVE','SERIALNO',SERIALNO, OBJECTTYPE, OBJECTNO,'关联业务合同在Business_Contract表不存在' from contract_relative where SERIALNO is not null and SERIALNO not in (select serialno from business_contract) );
  --关联担保合同编号
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO, OBJECTTYPE, OBJECTNO,badReason) (select 'CONTRACT_RELATIVE','OBJECTNO',SERIALNO, OBJECTTYPE, OBJECTNO,'必输字段不能为空' from contract_relative where OBJECTNO is null);
  --合同下关联的担保合同在Guaranty_Contract表是否存在
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO, OBJECTTYPE, OBJECTNO,badReason) (select 'CONTRACT_RELATIVE','OBJECTNO',SERIALNO, OBJECTTYPE, OBJECTNO,'关联担保合同在Guaranty_Contract表不存在' from contract_relative where OBJECTNO is not null and OBJECTNO not in (select serialno from guaranty_contract) );

  --担保合同与担保物关联表GUARANTY_RELATIVE
  --担保关联业务合同编号
  insert into SQ_BAD_DATA(tableName,columnName,OBJECTTYPE, GUARANTYID, CONTRACTNO, OBJECTNO,badReason) (select 'GUARANTY_RELATIVE','OBJECTNO',OBJECTTYPE, GUARANTYID, CONTRACTNO, OBJECTNO,'必输字段不能为空' from guaranty_relative where OBJECTNO is null);
  --担保关联业务合同编号在Business_Contract表是否存在
  insert into SQ_BAD_DATA(tableName,columnName,OBJECTTYPE, GUARANTYID, CONTRACTNO, OBJECTNO,badReason) (select 'GUARANTY_RELATIVE','OBJECTNO',OBJECTTYPE, GUARANTYID, CONTRACTNO, OBJECTNO,'关联业务合同在Business_Contract表不存在' from guaranty_relative where OBJECTNO is not null and OBJECTNO not in (select serialno from business_contract) );
  --担保合同流水号
  insert into SQ_BAD_DATA(tableName,columnName,OBJECTTYPE, GUARANTYID, CONTRACTNO, OBJECTNO,badReason) (select 'GUARANTY_RELATIVE','CONTRACTNO',OBJECTTYPE, GUARANTYID, CONTRACTNO, OBJECTNO,'必输字段不能为空' from guaranty_relative where CONTRACTNO is null);
  --担保合同流水号在Guaranty_Contract表是否存在
  insert into SQ_BAD_DATA(tableName,columnName,OBJECTTYPE, GUARANTYID, CONTRACTNO, OBJECTNO,badReason) (select 'GUARANTY_RELATIVE','CONTRACTNO',OBJECTTYPE, GUARANTYID, CONTRACTNO, OBJECTNO,'关联担保合同在Guaranty_Contract表不存在' from guaranty_relative where CONTRACTNO is not null and CONTRACTNO not in (select serialno from guaranty_contract) );
  --抵质押物编号
  insert into SQ_BAD_DATA(tableName,columnName,OBJECTTYPE, GUARANTYID, CONTRACTNO, OBJECTNO,badReason) (select 'GUARANTY_RELATIVE','GUARANTYID',OBJECTTYPE, GUARANTYID, CONTRACTNO, OBJECTNO,'必输字段不能为空' from guaranty_relative where GUARANTYID is null);
  --抵质押物编号在Guaranty_Info表是否存在
  insert into SQ_BAD_DATA(tableName,columnName,OBJECTTYPE, GUARANTYID, CONTRACTNO, OBJECTNO,badReason) (select 'GUARANTY_RELATIVE','GUARANTYID',OBJECTTYPE, GUARANTYID, CONTRACTNO, OBJECTNO,'关联押品编号在Guaranty_Info表不存在' from guaranty_relative where GUARANTYID is not null and GUARANTYID not in (select guarantyid from guaranty_info) );
  --有效标志
  insert into SQ_BAD_DATA(tableName,columnName,OBJECTTYPE, GUARANTYID, CONTRACTNO, OBJECTNO,badReason) (select 'GUARANTY_RELATIVE','STATUS',OBJECTTYPE, GUARANTYID, CONTRACTNO, OBJECTNO,'必输字段不能为空' from guaranty_relative where STATUS is null);
  --有效标志码值校验
  insert into SQ_BAD_DATA(tableName,columnName,OBJECTTYPE, GUARANTYID, CONTRACTNO, OBJECTNO,badReason) (select 'GUARANTY_RELATIVE','STATUS',OBJECTTYPE, GUARANTYID, CONTRACTNO, OBJECTNO,'有效标志码值映射有误' from guaranty_relative where STATUS is not null and STATUS not in (select itemNo from code_library where codeNo='Status' and isInUse='1') );

  --客户基本信息表CUSTOMER_INFO
  --客户名称
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'CUSTOMER_INFO','CUSTOMERNAME',CUSTOMERID,'必输字段不能为空' from customer_info where CUSTOMERNAME is null);
  --认定状态
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'CUSTOMER_INFO','STATUS',CUSTOMERID,'必输字段不能为空' from customer_info where STATUS is null);
  --认定状态码值校验
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'CUSTOMER_INFO','STATUS',CUSTOMERID,'有效标志码值映射有误' from customer_info where STATUS is not null and STATUS not in (select itemNo from code_library where codeNo='CustomerStatus' and isInUse='1') );
  --证件类型
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'CUSTOMER_INFO','CERTTYPE',CUSTOMERID,'必输字段不能为空' from customer_info where CERTTYPE is null);
  --证件类型码值校验
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'CUSTOMER_INFO','CERTTYPE',CUSTOMERID,'证件类型码值映射有误' from customer_info where CERTTYPE is not null and CERTTYPE not in (select itemNo from code_library where codeNo='CertType' and isInUse='1') );
  --证件号码
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'CUSTOMER_INFO','CERTID',CUSTOMERID,'必输字段不能为空' from customer_info where CERTID is null);
  --客户类型
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'CUSTOMER_INFO','CUSTOMERTYPE',CUSTOMERID,'必输字段不能为空' from customer_info where CUSTOMERTYPE is null);
  --客户类型码值校验
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'CUSTOMER_INFO','CUSTOMERTYPE',CUSTOMERID,'客户类型码值映射有误' from customer_info where CUSTOMERTYPE is not null and CUSTOMERTYPE not in (select itemNo from code_library where codeNo='CustomerType' and isInUse='1') );
  --核心客户号
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'CUSTOMER_INFO','MFCUSTOMERID',CUSTOMERID,'必输字段不能为空' from customer_info where MFCUSTOMERID is null);

  --集团基本信息表GROUP_INFO
  --集团客户名称
  insert into SQ_BAD_DATA(tableName,columnName,GROUPID,badReason) (select 'GROUP_INFO','GROUPNAME',GROUPID,'必输字段不能为空' from group_info where GROUPNAME is null);
  --集团简称
  insert into SQ_BAD_DATA(tableName,columnName,GROUPID,badReason) (select 'GROUP_INFO','GROUPABBNAME',GROUPID,'必输字段不能为空' from group_info where GROUPABBNAME is null);
  --集团核心企业
  insert into SQ_BAD_DATA(tableName,columnName,GROUPID,badReason) (select 'GROUP_INFO','KEYMEMBERCUSTOMERID',GROUPID,'必输字段不能为空' from group_info where KEYMEMBERCUSTOMERID is null);
  --集团核心企业在Customer_Info表是否存在
  insert into SQ_BAD_DATA(tableName,columnName,GROUPID,badReason) (select 'GROUP_INFO','KEYMEMBERCUSTOMERID',GROUPID,'集团核心企业在Customer_Info表不存在' from group_info where KEYMEMBERCUSTOMERID is not null and KEYMEMBERCUSTOMERID not in (select customerid from customer_info) );
  --财务是否集中
  insert into SQ_BAD_DATA(tableName,columnName,GROUPID,badReason) (select 'GROUP_INFO','FINANCEFOCUS',GROUPID,'必输字段不能为空' from group_info where FINANCEFOCUS is null);
  --财务是否集中码值校验
  insert into SQ_BAD_DATA(tableName,columnName,GROUPID,badReason) (select 'GROUP_INFO','FINANCEFOCUS',GROUPID,'财务是否集中码值映射有误' from group_info where FINANCEFOCUS is not null and FINANCEFOCUS not in (select itemNo from code_library where codeNo='YesNo' and isInUse='1') );
  --集团户号
  insert into SQ_BAD_DATA(tableName,columnName,GROUPID,badReason) (select 'GROUP_INFO','GROUPHID',GROUPID,'必输字段不能为空' from group_info where GROUPHID is null);

  --保险信息表CMS_INSURANCE_INFO
  --押品编号
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CMS_INSURANCE_INFO','GUARANTYID',SERIALNO,'必输字段不能为空' from cms_insurance_info where GUARANTYID is null);
  --押品编号在Guaranty_Info表是否存在
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CMS_INSURANCE_INFO','GUARANTYID',SERIALNO,'关联押品编号在Guaranty_Info表不存在' from cms_insurance_info where GUARANTYID is not null and GUARANTYID not in (select guarantyid from guaranty_info) );
  --保单号码
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CMS_INSURANCE_INFO','GUARANTEESLIPNO',SERIALNO,'必输字段不能为空' from cms_insurance_info where GUARANTEESLIPNO is null);
  --保险起始日
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CMS_INSURANCE_INFO','STARTDATE',SERIALNO,'必输字段不能为空' from cms_insurance_info where STARTDATE is null);
  --保险终止日
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CMS_INSURANCE_INFO','ENDDATE',SERIALNO,'必输字段不能为空' from cms_insurance_info where ENDDATE is null);
  --投保金额
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CMS_INSURANCE_INFO','INSURANCEAMT',SERIALNO,'必输字段不能为空' from cms_insurance_info where INSURANCEAMT is null);
  --保险状态
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CMS_INSURANCE_INFO','INSURERSTATUS',SERIALNO,'必输字段不能为空' from cms_insurance_info where INSURERSTATUS is null);
  --保险状态码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CMS_INSURANCE_INFO','INSURERSTATUS',SERIALNO,'保险状态码值映射有误' from cms_insurance_info where INSURERSTATUS is not null and INSURERSTATUS not in (select itemNo from code_library where codeNo='InsurerStatus' and isInUse='1') );

  --同业额度细项分配表CL_CREDIT_SAME
  --关联产品分项流水号
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_CREDIT_SAME','RELATIVEDIVIDENO',SERIALNO,'必输字段不能为空' from cl_credit_same where RELATIVEDIVIDENO is null);
  --关联细项额度在CL_Info表是否存在
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_CREDIT_SAME','RELATIVEDIVIDENO',SERIALNO,'关联细项额度在CL_Info表不存在' from cl_credit_same where RELATIVEDIVIDENO is not null and RELATIVEDIVIDENO not in (select lineid from cl_info) );
  --切分产品编号
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_CREDIT_SAME','DIVIDECODE',SERIALNO,'必输字段不能为空' from cl_credit_same where DIVIDECODE is null);
  --切分产品编号在Business_Type表是否存在
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_CREDIT_SAME','DIVIDECODE',SERIALNO,'切分产品编号在Business_Type表不存在' from cl_credit_same where DIVIDECODE is not null and DIVIDECODE not in (select typeNo from business_Type where isInUse ='1') );
  --切分系统
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_CREDIT_SAME','DIVIDESYSTEM',SERIALNO,'必输字段不能为空' from cl_credit_same where DIVIDESYSTEM is null);
  --切分系统码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_CREDIT_SAME','DIVIDESYSTEM',SERIALNO,'切分系统码值映射有误' from cl_credit_same where DIVIDESYSTEM is not null and DIVIDESYSTEM not in (select itemNo from code_library where codeNo='SameCreditSystemID' and isInUse='1') );
  --切分部门
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_CREDIT_SAME','DIVIDEPART',SERIALNO,'必输字段不能为空' from cl_credit_same where DIVIDEPART is null);
  --切分部门码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_CREDIT_SAME','DIVIDEPART',SERIALNO,'切分部门码值映射有误' from cl_credit_same where DIVIDEPART is not null and DIVIDEPART not in (select itemNo from code_library where codeNo='SameCreditPartID' and isInUse='1') );
  --切分名义金额
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_CREDIT_SAME','DIVIDEBUSINESSSUM',SERIALNO,'必输字段不能为空' from cl_credit_same where DIVIDEBUSINESSSUM is null);
  --分配敞口金额
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_CREDIT_SAME','DIVIDEEXPOSURESUM',SERIALNO,'必输字段不能为空' from cl_credit_same where DIVIDEEXPOSURESUM is null);
  --判断切分名义金额是否大于等于敞口金额
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_CREDIT_SAME','DIVIDEBUSINESSSUM,DIVIDEEXPOSURESUM',SERIALNO,'切分名义金额必须大于等于敞口金额' from cl_credit_same where DIVIDEBUSINESSSUM < DIVIDEEXPOSURESUM );

  --集群成员信息表GROUP_MEMBER_RELATIVE
  --集团客户编号
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GROUP_MEMBER_RELATIVE','GROUPID',SERIALNO,'必输字段不能为空' from group_member_relative where GROUPID is null);
  --集团客户在Customer_Info表是否存在
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GROUP_MEMBER_RELATIVE','GROUPID',SERIALNO,'集团客户在Customer_Info表不存在' from group_member_relative where GROUPID is not null and GROUPID not in (select customerid from customer_info) );
  --集团客户在Group_Info表是否存在
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GROUP_MEMBER_RELATIVE','GROUPID',SERIALNO,'集团客户在Group_Info表不存在' from group_member_relative where GROUPID is not null and GROUPID not in (select GROUPID from GROUP_INFO) );
  --集团成员编号
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GROUP_MEMBER_RELATIVE','MEMBERCUSTOMERID',SERIALNO,'必输字段不能为空' from group_member_relative where MEMBERCUSTOMERID is null);
  --集团成员在Customer_Info表是否存在
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GROUP_MEMBER_RELATIVE','MEMBERCUSTOMERID',SERIALNO,'集团成员在Customer_Info表不存在' from group_member_relative where MEMBERCUSTOMERID is not null and MEMBERCUSTOMERID not in (select customerid from customer_info) );
  --成员类型
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GROUP_MEMBER_RELATIVE','MEMBERTYPE',SERIALNO,'必输字段不能为空' from group_member_relative where MEMBERTYPE is null);
  --成员类型码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GROUP_MEMBER_RELATIVE','MEMBERTYPE',SERIALNO,'成员类型码值映射有误' from group_member_relative where MEMBERTYPE is not null and MEMBERTYPE not in (select itemNo from code_library where codeNo='MemberType' and isInUse='1') );
  --成员证件类型
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GROUP_MEMBER_RELATIVE','MEMBERCERTTYPE',SERIALNO,'必输字段不能为空' from group_member_relative where MEMBERCERTTYPE is null);
  --成员证件类型码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GROUP_MEMBER_RELATIVE','MEMBERCERTTYPE',SERIALNO,'成员证件类型码值映射有误' from group_member_relative where MEMBERCERTTYPE is not null and MEMBERCERTTYPE not in (select itemNo from code_library where codeNo='CertType' and isInUse='1') );
  --成员证件号码
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GROUP_MEMBER_RELATIVE','MEMBERCERTID',SERIALNO,'必输字段不能为空' from group_member_relative where MEMBERCERTID is null);
  --集团客户类型
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GROUP_MEMBER_RELATIVE','GROUPCUSTOMERTYPE',SERIALNO,'必输字段不能为空' from group_member_relative where GROUPCUSTOMERTYPE is null);
  --集团客户类型码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GROUP_MEMBER_RELATIVE','GROUPCUSTOMERTYPE',SERIALNO,'集团客户类型码值映射有误' from group_member_relative where GROUPCUSTOMERTYPE is not null and GROUPCUSTOMERTYPE not in (select itemNo from code_library where codeNo='CustomerType' and isInUse='1') );

  --关联批量业务关联表APPLY_BATCHRELATIVE
  --额度流水号
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO, OBJECTTYPE, RELATIVEBATCHSERIALNO,badReason) (select 'APPLY_BATCHRELATIVE','SERIALNO',SERIALNO, OBJECTTYPE, RELATIVEBATCHSERIALNO,'必输字段不能为空' from apply_batchRelative where SERIALNO is null);
  --额度流水在CL_Info表是否存在
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO, OBJECTTYPE, RELATIVEBATCHSERIALNO,badReason) (select 'APPLY_BATCHRELATIVE','SERIALNO',SERIALNO, OBJECTTYPE, RELATIVEBATCHSERIALNO,'额度流水在CL_Info表不存在' from apply_batchRelative where SERIALNO is not null and OBJECTTYPE='CLInfo' and SERIALNO not in (select lineid from cl_info) );
  --授信阶段类型
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO, OBJECTTYPE, RELATIVEBATCHSERIALNO,badReason) (select 'APPLY_BATCHRELATIVE','OBJECTTYPE',SERIALNO, OBJECTTYPE, RELATIVEBATCHSERIALNO,'必输字段不能为空' from apply_batchRelative where OBJECTTYPE is null);
  --授信阶段类型码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO, OBJECTTYPE, RELATIVEBATCHSERIALNO,badReason) (select 'APPLY_BATCHRELATIVE','OBJECTTYPE',SERIALNO, OBJECTTYPE, RELATIVEBATCHSERIALNO,'授信阶段类型码值映射有误' from apply_batchRelative where OBJECTTYPE is not null and OBJECTTYPE not in ('ApproveApply','CLInfo') );
  --关联批量流水号
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO, OBJECTTYPE, RELATIVEBATCHSERIALNO,badReason) (select 'APPLY_BATCHRELATIVE','RELATIVEBATCHSERIALNO',SERIALNO, OBJECTTYPE, RELATIVEBATCHSERIALNO,'必输字段不能为空' from apply_batchRelative where RELATIVEBATCHSERIALNO is null);
  --关联批量授信流水在CL_Info表是否存在
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO, OBJECTTYPE, RELATIVEBATCHSERIALNO,badReason) (select 'APPLY_BATCHRELATIVE','RELATIVEBATCHSERIALNO',SERIALNO, OBJECTTYPE, RELATIVEBATCHSERIALNO,'关联批量授信流水在CL_Info表不存在' from apply_batchRelative where RELATIVEBATCHSERIALNO is not null and OBJECTTYPE='CLInfo' and RELATIVEBATCHSERIALNO not in (select lineid from cl_info) );
  --引入类型
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO, OBJECTTYPE, RELATIVEBATCHSERIALNO,badReason) (select 'APPLY_BATCHRELATIVE','INTRODUCETYPE',SERIALNO, OBJECTTYPE, RELATIVEBATCHSERIALNO,'必输字段不能为空' from apply_batchRelative where INTRODUCETYPE is null);
  --引入类型码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO, OBJECTTYPE, RELATIVEBATCHSERIALNO,badReason) (select 'APPLY_BATCHRELATIVE','INTRODUCETYPE',SERIALNO, OBJECTTYPE, RELATIVEBATCHSERIALNO,'引入类型码值映射有误' from apply_batchRelative where INTRODUCETYPE is not null and INTRODUCETYPE <> '010' );
  --是否占用批量授信额度
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO, OBJECTTYPE, RELATIVEBATCHSERIALNO,badReason) (select 'APPLY_BATCHRELATIVE','ISOCCUPANCY',SERIALNO, OBJECTTYPE, RELATIVEBATCHSERIALNO,'必输字段不能为空' from apply_batchRelative where ISOCCUPANCY is null);
  --是否占用批量授信额度码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO, OBJECTTYPE, RELATIVEBATCHSERIALNO,badReason) (select 'APPLY_BATCHRELATIVE','ISOCCUPANCY',SERIALNO, OBJECTTYPE, RELATIVEBATCHSERIALNO,'是否占用批量授信额度码值映射有误' from apply_batchRelative where ISOCCUPANCY is not null and ISOCCUPANCY not in (select itemNo from code_library where codeNo='YesOrNo' and isInUse='1') );

  --借据信息表BUSINESS_DUEBILL
  --借据余额
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_DUEBILL','BALANCE',SERIALNO,'必输字段不能为空' from business_duebill where BALANCE is null);
  --币种
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_DUEBILL','BUSINESSCURRENCY',SERIALNO,'必输字段不能为空' from business_duebill where BUSINESSCURRENCY is null);
  --币种码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_DUEBILL','BUSINESSCURRENCY',SERIALNO,'币种码值映射有误' from business_duebill where BUSINESSCURRENCY is not null and BUSINESSCURRENCY not in (select itemNo from code_library where codeNo='Currency' and isInUse='1') );
  --发放利率
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_DUEBILL','BUSINESSRATE',SERIALNO,'必输字段不能为空' from business_duebill where BUSINESSRATE is null);
  --借据金额
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_DUEBILL','BUSINESSSUM',SERIALNO,'必输字段不能为空' from business_duebill where BUSINESSSUM is null);
  --业务品种
  --insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_DUEBILL','BUSINESSTYPE',SERIALNO,'必输字段不能为空' from business_duebill where BUSINESSTYPE is null and flag3='CDS');
  --业务品种码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_DUEBILL','BUSINESSTYPE',SERIALNO,'币种码值映射有误' from business_duebill where BUSINESSTYPE is not null and BUSINESSTYPE not in (select typeNo from business_Type where isInUse ='1') );
  --相关合同流水号
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_DUEBILL','RELATIVESERIALNO2',SERIALNO,'必输字段不能为空' from business_duebill where RELATIVESERIALNO2 is null);
  --相关合同流水在BUSINESS_CONTRACT表是否存在
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_DUEBILL','RELATIVESERIALNO2',SERIALNO,'相关合同流水在BUSINESS_CONTRACT表不存在' from business_duebill where RELATIVESERIALNO2 is not null and RELATIVESERIALNO2 not in (select serialno from business_contract) );
  --客户编号
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_DUEBILL','CUSTOMERID',SERIALNO,'必输字段不能为空' from business_duebill where CUSTOMERID is null );
  --判断客户编号在CUSTOMER_INFO表是否存在
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_DUEBILL','CUSTOMERID',SERIALNO,'该客户在CUSTOMER_INFO表不存在' from business_duebill where CUSTOMERID is not null and CUSTOMERID not in (select CUSTOMERID from CUSTOMER_INFO) );
  --CIN
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_DUEBILL','MFCUSTOMERID',SERIALNO,'必输字段不能为空' from business_duebill where MFCUSTOMERID is null );
  --判断CIN在CUSTOMER_INFO表是否存在
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_DUEBILL','MFCUSTOMERID',SERIALNO,'该客户的CIN在CUSTOMER_INFO表不存在' from business_duebill where MFCUSTOMERID is not null and MFCUSTOMERID not in (select MFCUSTOMERID from CUSTOMER_INFO) );
  --经办机构
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_DUEBILL','OPERATEORGID',SERIALNO,'必输字段不能为空' from business_duebill where OPERATEORGID is null );
  --经办机构在ORG_INFO表是否存在
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_DUEBILL','OPERATEORGID',SERIALNO,'经办机构在ORG_INFO表不存在' from business_duebill where OPERATEORGID is not null and OPERATEORGID not in (select ORGID from ORG_INFO) );
  --FINISHDATE,BALANCE字段校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_DUEBILL','FINISHDATE,BALANCE',SERIALNO,'未结清借据FINISHDATE必须为空' from business_duebill where BALANCE >0 and FINISHDATE is not null );

  --借还款记录表BUSINESS_WASTEBOOK
  --发生日期
  --insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_WASTEBOOK','OCCURDATE',SERIALNO,'必输字段不能为空' from business_wastebook where OCCURDATE is null);
  --交易标志
  --insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_WASTEBOOK','TRANSACTIONFLAG',SERIALNO,'必输字段不能为空' from business_wastebook where TRANSACTIONFLAG is null);
  --交易标志码值校验
  --insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_WASTEBOOK','TRANSACTIONFLAG',SERIALNO,'交易标志码值映射有误' from business_wastebook where TRANSACTIONFLAG is not null and TRANSACTIONFLAG not in (select itemNo from code_library where codeNo='TransactionFlag' and isInUse='1') );
  --发生类型
  --insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_WASTEBOOK','OCCURTYPE',SERIALNO,'必输字段不能为空' from business_wastebook where OCCURTYPE is null);
  --发生类型码值校验
  --insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_WASTEBOOK','OCCURTYPE',SERIALNO,'发生类型码值映射有误' from business_wastebook where OCCURTYPE is not null and OCCURTYPE not in (select itemNo from code_library where codeNo='WasteOccurType' and isInUse='1') );
  --发放金额
  --insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_WASTEBOOK','ACTUALDEBITSUM',SERIALNO,'必输字段不能为空' from business_wastebook where ACTUALDEBITSUM is null);
  --回收金额
  --insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_WASTEBOOK','ACTUALCREDITSUM',SERIALNO,'必输字段不能为空' from business_wastebook where ACTUALCREDITSUM is null);
  --相关借据号
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_WASTEBOOK','RELATIVESERIALNO',SERIALNO,'必输字段不能为空' from business_wastebook where RELATIVESERIALNO is null);
  --相关借据号在BUSINESS_DUEBILL表是否存在
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_WASTEBOOK','RELATIVESERIALNO',SERIALNO,'相关借据号在BUSINESS_DUEBILL表不存在' from business_wastebook where RELATIVESERIALNO is not null and RELATIVESERIALNO not in (select serialno from business_duebill));
  --相关合同流水号
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_WASTEBOOK','RELATIVECONTRACTNO',SERIALNO,'必输字段不能为空' from business_wastebook where RELATIVECONTRACTNO is null);
  --相关合同流水号在BUSINESS_CONTRACT表是否存在
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_WASTEBOOK','RELATIVECONTRACTNO',SERIALNO,'相关合同流水号在BUSINESS_CONTRACT表不存在' from business_wastebook where RELATIVECONTRACTNO is not null and RELATIVECONTRACTNO not in (select serialno from business_contract));

  --业务合同表BUSINESS_CONTRACT-业务合同类
  --文本合同编号
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','RELATIVECONTRACTNO',SERIALNO,'必输字段不能为空' from business_contract where ARTIFICIALNO is null);
  --合同类型
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','CONTRACTTYPE',SERIALNO,'必输字段不能为空' from business_contract where CONTRACTTYPE is null);
  --合同类型码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','CONTRACTTYPE',SERIALNO,'合同类型码值映射有误' from business_contract where CONTRACTTYPE is not null and CONTRACTTYPE not in (select itemNo from code_library where codeNo='ContractType2' and isInUse='1') );
  --业务币种
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','BUSINESSCURRENCY',SERIALNO,'必输字段不能为空' from business_contract where BUSINESSCURRENCY is null);
  --业务币种码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','BUSINESSCURRENCY',SERIALNO,'业务币种码值映射有误' from business_contract where BUSINESSCURRENCY is not null and BUSINESSCURRENCY not in (select itemNo from code_library where codeNo='Currency' and isInUse='1') );
  --业务品种
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','BUSINESSTYPE',SERIALNO,'必输字段不能为空' from business_contract where BUSINESSTYPE is null);
  --业务品种码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','BUSINESSTYPE',SERIALNO,'业务品种码值映射有误' from business_contract where BUSINESSTYPE is not null and BUSINESSTYPE not in (select typeNo from business_Type where isInUse ='1') );
  --是否循环
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','CREDITCYCLE',SERIALNO,'必输字段不能为空' from business_contract where CREDITCYCLE is null);
  --是否循环码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','CREDITCYCLE',SERIALNO,'是否循环码值映射有误' from business_contract where CREDITCYCLE is not null and CREDITCYCLE not in (select itemNo from code_library where codeNo='YesNo' and isInUse='1') );
  --客户编号
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','CUSTOMERID',SERIALNO,'必输字段不能为空' from business_contract where CUSTOMERID is null);
  --客户编号在Customer_Info表是否存在
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','CUSTOMERID',SERIALNO,'客户编号在Customer_Info表不存在' from business_contract where CUSTOMERID is not null and CUSTOMERID not in (select customerid from customer_info) );
   --合同金额
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','BUSINESSSUM',SERIALNO,'必输字段不能为空' from business_contract where BUSINESSSUM is null);
  --合同起始日
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','PUTOUTDATE',SERIALNO,'必输字段不能为空' from business_contract where PUTOUTDATE is null);
  --合同到期日
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','MATURITY',SERIALNO,'必输字段不能为空' from business_contract where MATURITY is null);
  --合同状态
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','STATUS',SERIALNO,'必输字段不能为空' from business_contract where STATUS is null);
  --合同状态码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','STATUS',SERIALNO,'合同状态码值映射有误' from business_contract where STATUS is not null and STATUS <> 'EFFECTIVE' );
  --主要担保方式
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','VOUCHTYPE',SERIALNO,'必输字段不能为空' from business_contract where VOUCHTYPE is null);
  --主要担保方式码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','VOUCHTYPE',SERIALNO,'主要担保方式码值映射有误' from business_contract where VOUCHTYPE is not null and VOUCHTYPE not in (select itemNo from code_library where codeNo='VOUCHTYPE1' and isInUse='1') );
  --管户客户经理
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','MANAGEUSERID',SERIALNO,'必输字段不能为空' from business_contract where MANAGEUSERID is null);
  --判断管户客户经理在USER_INFO表是否存在
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','MANAGEUSERID',SERIALNO,'管户经理在USER_INFO表不存在' from business_contract where MANAGEUSERID is not null and MANAGEUSERID not in (select userid from user_info));
  --管户机构
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','MANAGEORGID',SERIALNO,'必输字段不能为空' from business_contract where MANAGEORGID is null);
  --判断管户机构在ORG_INFO表是否存在
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','MANAGEUSERID',SERIALNO,'管户机构在ORG_INFO表不存在' from business_contract where MANAGEORGID is not null and MANAGEORGID not in (select orgid from org_info));
  --判断管户客户经理和管户机构是否一致
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','MANAGEUSERID,MANAGEORGID',bc.SERIALNO,'管户客户经理和机构不匹配' from business_contract bc where bc.MANAGEUSERID is not null and bc.MANAGEORGID is not null and bc.MANAGEORGID <> (select ui.belongorg from user_info ui where ui.userid=bc.MANAGEUSERID));
  --关联批复号
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','RELATIVESERIALNO',SERIALNO,'必输字段不能为空' from business_contract where RELATIVESERIALNO is null);
  --判断关联批复号在BUSINESS_APPROVE是否存在
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','RELATIVESERIALNO',SERIALNO,'关联批复号在BUSINESS_APPROVE表不存在' from business_contract where RELATIVESERIALNO is not null and RELATIVESERIALNO not in (select serialno from business_approve));
  --发生方式
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','OCCURTYPE',SERIALNO,'必输字段不能为空' from business_contract where OCCURTYPE is null);
  --发生方式码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','OCCURTYPE',SERIALNO,'发生类型码值映射有误' from business_contract where OCCURTYPE is not null and OCCURTYPE not in (select itemNo from code_library where codeNo='NewOccurType' and isInUse='1') );
  --归档日期
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','PIGEONHOLEDATE',SERIALNO,'归档日期需为空' from business_contract where PIGEONHOLEDATE is not null);
  --暂存标识
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','TEMPSAVEFLAG',SERIALNO,'暂存标识码值有误' from business_contract where TEMPSAVEFLAG <> '2');
  --登记合同类型
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','BOOKINCONTRACTTYPE',SERIALNO,'必输字段不能为空' from business_contract where BOOKINCONTRACTTYPE is null);
  --登记合同类型码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','BOOKINCONTRACTTYPE',SERIALNO,'合同登记类型码值映射有误' from business_contract where BOOKINCONTRACTTYPE is not null and BOOKINCONTRACTTYPE not in ('01','02','03','04'));
  --客户名称
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','CUSTOMERNAME',SERIALNO,'必输字段不能为空' from business_contract where CUSTOMERNAME is null);

  --押品信息表GUARANTY_INFO
  --抵质押物类型
  insert into SQ_BAD_DATA(tableName,columnName,GUARANTYID,badReason) (select 'GUARANTY_INFO','GUARANTYTYPE',GUARANTYID,'必输字段不能为空' from guaranty_info where GUARANTYTYPE is null);
  --抵质押物类型码值校验
  insert into SQ_BAD_DATA(tableName,columnName,GUARANTYID,badReason) (select 'GUARANTY_INFO','GUARANTYTYPE',GUARANTYID,'抵质押物类型码值映射有误' from guaranty_info where GUARANTYTYPE is not null and GUARANTYTYPE not in (select GuarantyType from CMS_COLLATERALDONO_INFO where Status = '01') );
  --担保物状态
  insert into SQ_BAD_DATA(tableName,columnName,GUARANTYID,badReason) (select 'GUARANTY_INFO','GUARANTYSTATUS',GUARANTYID,'必输字段不能为空' from guaranty_info where GUARANTYSTATUS is null);
  --担保物状态码值校验
  insert into SQ_BAD_DATA(tableName,columnName,GUARANTYID,badReason) (select 'GUARANTY_INFO','GUARANTYSTATUS',GUARANTYID,'担保物状态码值映射有误' from guaranty_info where GUARANTYSTATUS is not null and GUARANTYSTATUS not in (select itemNo from code_library where codeNo='GuarantyStatus' and isInUse='1') );
  --质押币种
  insert into SQ_BAD_DATA(tableName,columnName,GUARANTYID,badReason) (select 'GUARANTY_INFO','GUARANTYCURRENCY',GUARANTYID,'必输字段不能为空' from guaranty_info where GUARANTYCURRENCY is null);
  --质押币种码值校验
  insert into SQ_BAD_DATA(tableName,columnName,GUARANTYID,badReason) (select 'GUARANTY_INFO','GUARANTYCURRENCY',GUARANTYID,'质押币种码值映射有误' from guaranty_info where GUARANTYCURRENCY is not null and GUARANTYCURRENCY not in (select itemNo from code_library where codeNo='Currency' and isInUse='1') );
  --质物币种
  insert into SQ_BAD_DATA(tableName,columnName,GUARANTYID,badReason) (select 'GUARANTY_INFO','EVALCURRENCY',GUARANTYID,'必输字段不能为空' from guaranty_info where EVALCURRENCY is null);
  --质物币种码值校验
  insert into SQ_BAD_DATA(tableName,columnName,GUARANTYID,badReason) (select 'GUARANTY_INFO','EVALCURRENCY',GUARANTYID,'质物币种码值映射有误' from guaranty_info where EVALCURRENCY is not null and EVALCURRENCY not in (select itemNo from code_library where codeNo='Currency' and isInUse='1') );
  --质押金额
  insert into SQ_BAD_DATA(tableName,columnName,GUARANTYID,badReason) (select 'GUARANTY_INFO','CONFIRMVALUE',GUARANTYID,'必输字段不能为空' from guaranty_info where CONFIRMVALUE is null);
  --质物金额
  insert into SQ_BAD_DATA(tableName,columnName,GUARANTYID,badReason) (select 'GUARANTY_INFO','EVALNETVALUE',GUARANTYID,'必输字段不能为空' from guaranty_info where EVALNETVALUE is null);
  --是否我行认可押品
  insert into SQ_BAD_DATA(tableName,columnName,GUARANTYID,badReason) (select 'GUARANTY_INFO','ISOURGUARANTY',GUARANTYID,'必输字段不能为空' from guaranty_info where ISOURGUARANTY is null);
  --是否我行认可押品码值校验
  insert into SQ_BAD_DATA(tableName,columnName,GUARANTYID,badReason) (select 'GUARANTY_INFO','ISOURGUARANTY',GUARANTYID,'是否我行认可押品码值映射有误' from guaranty_info where ISOURGUARANTY is not null and ISOURGUARANTY not in (select itemNo from code_library where codeNo='YesNo' and isInUse='1') );
  --是否生效
  insert into SQ_BAD_DATA(tableName,columnName,GUARANTYID,badReason) (select 'GUARANTY_INFO','ISINUSE',GUARANTYID,'必输字段不能为空' from guaranty_info where ISINUSE is null);
  --是否生效码值校验
  insert into SQ_BAD_DATA(tableName,columnName,GUARANTYID,badReason) (select 'GUARANTY_INFO','ISINUSE',GUARANTYID,'是否生效码值映射有误' from guaranty_info where ISINUSE is not null and ISINUSE not in (select itemNo from code_library where codeNo='InsurerStatus' and isInUse='1') );
  --权利人编号
  insert into SQ_BAD_DATA(tableName,columnName,GUARANTYID,badReason) (select 'GUARANTY_INFO','OWNERID',GUARANTYID,'必输字段不能为空' from guaranty_info where OWNERID is null);
  --权利人在Customer_Info表是否存在该客户
  insert into SQ_BAD_DATA(tableName,columnName,GUARANTYID,badReason) (select 'GUARANTY_INFO','OWNERID',GUARANTYID,'权利人编号在Customer_Info表不存在' from guaranty_info where OWNERID is not null and OWNERID not in (select customerid from customer_info) );
  --判断权证号是否唯一
  insert into SQ_BAD_DATA(tableName,columnName,GUARANTYID,badReason) 
  (select 'GUARANTY_INFO','GUARANTYRIGHTID',GUARANTYID,'同一押品权证编号不能重复出现' from guaranty_info where GUARANTYRIGHTID in (SELECT GUARANTYRIGHTID FROM GUARANTY_INFO
  WHERE GUARANTYRIGHTID IS NOT NULL GROUP BY GUARANTYRIGHTID HAVING COUNT(*)>1) );

  --保证金信息表MARGIN_INFO
  --放款编号
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'MARGIN_INFO','OBJECTNO',SERIALNO,'必输字段不能为空' from margin_info where OBJECTNO is null);
  --借据编号在Business_Duebill表是否存在
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'MARGIN_INFO','OBJECTNO',SERIALNO,'放款编号在Business_PutOut表不存在' from margin_info where OBJECTNO is not null and OBJECTNO not in (select serialno from BUSINESS_PUTOUT) );
  --保证金类型
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'MARGIN_INFO','CUSTGUARANTYTYPE',SERIALNO,'必输字段不能为空' from margin_info where CUSTGUARANTYTYPE is null);
  --保证金类型码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'MARGIN_INFO','CUSTGUARANTYTYPE',SERIALNO,'保证金类型码值映射有误' from margin_info where CUSTGUARANTYTYPE is not null and CUSTGUARANTYTYPE not in (select itemNo from code_library where codeNo='MarginType' and isInUse='1') );
  --保证金金额
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'MARGIN_INFO','EVALNETVALUE',SERIALNO,'必输字段不能为空' from margin_info where EVALNETVALUE is null);
  --保证金币种
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'MARGIN_INFO','GUARANTYCURRENCY',SERIALNO,'必输字段不能为空' from margin_info where GUARANTYCURRENCY is null);
  --保证金币种码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'MARGIN_INFO','GUARANTYCURRENCY',SERIALNO,'保证金币种码值映射有误' from margin_info where GUARANTYCURRENCY is not null and GUARANTYCURRENCY not in (select itemNo from code_library where codeNo='Currency' and isInUse='1') );
  --本次使用金额
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'MARGIN_INFO','CONFIRMVALUE',SERIALNO,'必输字段不能为空' from margin_info where CONFIRMVALUE is null);

  --授信批复表BUSINESS_APPROVE
  --关联授信申请流水号
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_APPROVE','RELATIVESERIALNO',SERIALNO,'必输字段不能为空' from BUSINESS_APPROVE where RELATIVESERIALNO is null);
  --判断关联授信申请流水号在BUSINESS_APPLY表是否存在
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_APPROVE','RELATIVESERIALNO',SERIALNO,'关联授信申请在BUSINESS_APPLY表不存在' from BUSINESS_APPROVE where RELATIVESERIALNO is not null and RELATIVESERIALNO not in (select serialno from business_apply) );
  --业务品种
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_APPROVE','BUSINESSTYPE',SERIALNO,'必输字段不能为空' from BUSINESS_APPROVE where BUSINESSTYPE is null);
  --业务品种码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_APPROVE','BUSINESSTYPE',SERIALNO,'业务品种码值映射有误' from BUSINESS_APPROVE where BUSINESSTYPE is not null and BUSINESSTYPE not in (select typeNo from business_type where isinuse='1'));
  --客户编号
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_APPROVE','CUSTOMERID',SERIALNO,'必输字段不能为空' from BUSINESS_APPROVE where CUSTOMERID is null);
  --判断客户编号在CUSTOMER_INFO表是否存在
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_APPROVE','CUSTOMERID',SERIALNO,'关联客户在CUSTOMER_INFO表不存在' from BUSINESS_APPROVE where CUSTOMERID is not null and CUSTOMERID not in (select CUSTOMERID from CUSTOMER_INFO) );
  --业务币种
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_APPROVE','BUSINESSCURRENCY',SERIALNO,'必输字段不能为空' from BUSINESS_APPROVE where BUSINESSCURRENCY is null);
  --业务币种码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_APPROVE','BUSINESSCURRENCY',SERIALNO,'业务品种码值映射有误' from BUSINESS_APPROVE where BUSINESSCURRENCY is not null and BUSINESSCURRENCY not in (select itemNo from code_library where codeno='Currency' and isinuse='1'));
  --名义金额
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_APPROVE','BUSINESSSUM',SERIALNO,'必输字段不能为空' from BUSINESS_APPROVE where BUSINESSSUM is null);
  --敞口金额
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_APPROVE','EXPOSURESUM',SERIALNO,'必输字段不能为空' from BUSINESS_APPROVE where EXPOSURESUM is null);
  --客户名称
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_APPROVE','CUSTOMERNAME',SERIALNO,'必输字段不能为空' from BUSINESS_APPROVE where CUSTOMERNAME is null);

  --占额记录表CL_OCCUPY
  --业务编号
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_OCCUPY','OBJECTNO',SERIALNO,'必输字段不能为空' from CL_OCCUPY where OBJECTNO is null);
  --判断Business_Contract表是否存在该合同,ObjectType:BusinessContract
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_OCCUPY','OBJECTNO',SERIALNO,'业务合同在BUSINESS_CONTRACT表不存在' from CL_OCCUPY where OBJECTNO is not null and OBJECTTYPE='BusinessContract' AND OBJECTNO NOT IN (select SERIALNO from BUSINESS_CONTRACT));
  --关联额度编号
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_OCCUPY','RELATIVESERIALNO',SERIALNO,'必输字段不能为空' from CL_OCCUPY where RELATIVESERIALNO is null);
  --判断额度编号在CL_INFO表是否存在
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_OCCUPY','RELATIVESERIALNO',SERIALNO,'额度在CL_INFO表不存在' from CL_OCCUPY where RELATIVESERIALNO is not null and RELATIVESERIALNO not in (select lineid from cl_info));
  --币种 ObjectType:PutOutApply
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_OCCUPY','CURRENCY',SERIALNO,'必输字段不能为空' from CL_OCCUPY where CURRENCY is null and OBJECTTYPE='PutOutApply');
  --币种码值校验 ObjectType:PutOutApply
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_OCCUPY','CURRENCY',SERIALNO,'币种码值映射有误' from CL_OCCUPY where CURRENCY is not null and OBJECTTYPE='PutOutApply' and CURRENCY not in (select itemNo from code_library where codeno='Currency' and isinuse='1'));
  --占用名义金额 ObjectType:PutOutApply
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_OCCUPY','BUSINESSSUM',SERIALNO,'必输字段不能为空' from CL_OCCUPY where BUSINESSSUM is null and OBJECTTYPE='PutOutApply');
  --占用敞口金额 ObjectType:PutOutApply
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_OCCUPY','EXPOSURESUM',SERIALNO,'必输字段不能为空' from CL_OCCUPY where EXPOSURESUM is null and OBJECTTYPE='PutOutApply');
  --合同与额度关联关系
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) ( select 'CL_OCCUPY,BUSINESS_CONTRACT','CL_OCCUPY.OBJECTNO,CL_OCCUPY.RELATIVESERIALNO',SERIALNO,'该合同未在CL_OCCUPY建立合同与额度关联关系' from business_contract bc where bc.businesstype not in ('3010','31')
  and bc.serialno not in (select co.objectno from cl_occupy co where co.objecttype='BusinessContract'));

  --成员行信息Business_BankProvider_Member
  --成员行代码
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_BANKPROVIDER_MEMBER','PROVIDERNO',SERIALNO,'必输字段不能为空' from Business_BankProvider_Member where PROVIDERNO is null);
  --成员行角色
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_BANKPROVIDER_MEMBER','PROVIDERROLE',SERIALNO,'必输字段不能为空' from Business_BankProvider_Member where PROVIDERROLE is null);
  --成员行角色码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_BANKPROVIDER_MEMBER','PROVIDERROLE',SERIALNO,'成员行角色码值映射有误' from Business_BankProvider_Member where PROVIDERROLE is not null and PROVIDERROLE not in (select itemNo from code_library where codeNo='BankRole' and isInUse='1'));
  --牵头行只能有一家（01，03）
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) 
  (select 'BUSINESS_BANKPROVIDER_MEMBER','',SERIALNO,'同一笔业务下牵头行只允许存在一家' from Business_BankProvider_Member where PROVIDERNO is not null 
  and providerrole||objectno||objecttype in( select bbm.providerrole||bbm.objectno||bbm.objecttype from business_bankprovider_member bbm 
  where bbm.providerrole in ('01','03')
  group by bbm.providerrole,bbm.objectno,bbm.objecttype having count(*)>1));
  --银团总额
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_BANKPROVIDER_MEMBER','TOTALSUM',SERIALNO,'必输字段不能为空' from Business_BankProvider_Member where TOTALSUM is null);
  --承贷额比例
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_BANKPROVIDER_MEMBER','LOANRATIO',SERIALNO,'必输字段不能为空' from Business_BankProvider_Member where LOANRATIO is null);
  --成员行客户经理
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_BANKPROVIDER_MEMBER','PROVIDERUSERID',SERIALNO,'必输字段不能为空' from Business_BankProvider_Member where PROVIDERUSERID is null);
  --成员行客户经理是否存在
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_BANKPROVIDER_MEMBER','PROVIDERUSERID',SERIALNO,'成员行客户经理在USER_INFO表不存在' from Business_BankProvider_Member where PROVIDERUSERID is not null and not exists (select 1 from user_info where userid=PROVIDERUSERID));
  --业务品种
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_BANKPROVIDER_MEMBER','BUSINESSTYPE',SERIALNO,'必输字段不能为空' from Business_BankProvider_Member where BUSINESSTYPE is null);
  --业务品种码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_BANKPROVIDER_MEMBER','BUSINESSTYPE',SERIALNO,'业务品种码值映射有误' from Business_BankProvider_Member where BUSINESSTYPE is not null and BUSINESSTYPE not in (select typeNo from BUSINESS_TYPE where isInUse='1'));
  --误差承接行标志
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_BANKPROVIDER_MEMBER','ERRCNBANKFLG',SERIALNO,'必输字段不能为空' from Business_BankProvider_Member where ERRCNBANKFLG is null);
  --误差承接行标志码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_BANKPROVIDER_MEMBER','ERRCNBANKFLG',SERIALNO,'误差承接行标志码值映射有误' from Business_BankProvider_Member where ERRCNBANKFLG is not null and ERRCNBANKFLG not in (select itemNo from code_library where codeNo='NewYesNo' and isInUse='1'));
  --结算账户类型
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_BANKPROVIDER_MEMBER','STLMNACCTTYPE',SERIALNO,'必输字段不能为空' from Business_BankProvider_Member where STLMNACCTTYPE is null);
  --结算账户类型码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_BANKPROVIDER_MEMBER','STLMNACCTTYPE',SERIALNO,'结算账户类型码值映射有误' from Business_BankProvider_Member where STLMNACCTTYPE is not null and STLMNACCTTYPE not in (select itemNo from code_library where codeNo='SettleAccountType' and isInUse='1'));
  --结算账户
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_BANKPROVIDER_MEMBER','STLMNACCTNO',SERIALNO,'必输字段不能为空' from Business_BankProvider_Member where STLMNACCTNO is null);
  --对象类型
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_BANKPROVIDER_MEMBER','OBJECTTYPE',SERIALNO,'必输字段不能为空' from Business_BankProvider_Member where OBJECTTYPE is null);
  --对象类型码值
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_BANKPROVIDER_MEMBER','OBJECTTYPE',SERIALNO,'对象类型码值映射有误' from Business_BankProvider_Member where OBJECTTYPE is not null and OBJECTTYPE not in ('CreditApply','ApproveApply','BusinessContract'));
  --对象编号
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_BANKPROVIDER_MEMBER','OBJECTNO',SERIALNO,'必输字段不能为空' from Business_BankProvider_Member where OBJECTNO is null);
  --OBJECTTYPE：CreditApply,判断Business_Apply表是否存在该笔数据
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_BANKPROVIDER_MEMBER','OBJECTNO',bbm.SERIALNO,'该授信申请编号在BUSINESS_APPLY表不存在' from Business_BankProvider_Member bbm where bbm.OBJECTNO is not null and bbm.OBJECTTYPE='CreditApply' and not exists (select 1 from BUSINESS_APPLY WHERE SERIALNO=bbm.OBJECTNO));
  --OBJECTTYPE：ApproveApply,判断Business_Approve表是否存在该笔数据
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_BANKPROVIDER_MEMBER','OBJECTNO',bbm.SERIALNO,'该授信审批编号在BUSINESS_APPROVE表不存在' from Business_BankProvider_Member bbm where bbm.OBJECTNO is not null and bbm.OBJECTTYPE='ApproveApply' and not exists (select 1 from BUSINESS_APPROVE WHERE SERIALNO=bbm.OBJECTNO));
  --OBJECTTYPE：BusinessContract,判断Business_Contract表是否存在该笔数据
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_BANKPROVIDER_MEMBER','OBJECTNO',bbm.SERIALNO,'该合同编号在BUSINESS_CONTRACT表不存在' from Business_BankProvider_Member bbm where bbm.OBJECTNO is not null and bbm.OBJECTTYPE='BusinessContract' and not exists (select 1 from BUSINESS_CONTRACT WHERE SERIALNO=bbm.OBJECTNO));

  --出账信息表Business_PutOut
  --占额标识
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_PUTOUT','DEALFLAG',SERIALNO,'必输字段不能为空' from BUSINESS_PUTOUT where DEALFLAG is null);
  --占额标识码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_PUTOUT','DEALFLAG',SERIALNO,'占额标识码值映射有误' from BUSINESS_PUTOUT where DEALFLAG is not null and DEALFLAG <> '1');
  --交易状态
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_PUTOUT','EXCHANGESTATE',SERIALNO,'必输字段不能为空' from BUSINESS_PUTOUT where EXCHANGESTATE is null);
  --交易状态码值校验
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_PUTOUT','EXCHANGESTATE',SERIALNO,'交易状态码值映射有误' from BUSINESS_PUTOUT where EXCHANGESTATE is not null and EXCHANGESTATE <> '000000');

  --票据信息表BILL_INFO
  --出账编号
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO, OBJECTTYPE, OBJECTNO,badReason) (select 'BILL_INFO','OBJECTNO',SERIALNO, OBJECTTYPE, OBJECTNO,'必输字段不能为空' from BILL_INFO where OBJECTNO is null);
  --出账编号在BUSINESS_PUTOUT表是否存在
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO, OBJECTTYPE, OBJECTNO,badReason) (select 'BILL_INFO','OBJECTNO',SERIALNO, OBJECTTYPE, OBJECTNO,'出账编号在BUSINESS_PUTOUT表不存在' from BILL_INFO where OBJECTNO is not null and OBJECTNO not in (select serialno from business_putout) );

  commit;
end sq_auto_checkout;
/
