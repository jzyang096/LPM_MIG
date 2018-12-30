create or replace procedure sq_auto_checkout is
begin
  execute immediate 'TRUNCATE TABLE SQ_BAD_DATA';
  --�Թ��ͻ���Ϣ��ENT_INFO
  --�Ƿ����ű�׼���ſͻ�
  --insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','ECGROUPFLAG',customerid,'�����ֶβ���Ϊ��' from ent_info where ECGROUPFLAG is null);
  --�Ƿ����ű�׼���ſͻ���ֵУ��
  --insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','ECGROUPFLAG',customerid,'�Ƿ����ű�׼���ſͻ���ֵӳ������' from ent_info where ECGROUPFLAG is not null and ECGROUPFLAG not in (select itemNo from code_library where codeNo='YesNo' and isInUse='1') );
  --˰��Ǽ�֤��(��˰)
  --insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','TAXNO1',customerid,'�����ֶβ���Ϊ��' from ent_info where TAXNO1 is null);
  --������,���δ����Ŀͻ���У��
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','LOANCARDNO',ei.customerid,'�����ֶβ���Ϊ��' from ent_info ei where ei.LOANCARDNO is null and exists (select 1 from business_duebill bd where bd.customerid=ei.customerid and bd.balance>0));
  --������ҵ����
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','INDUSTRYTYPE',customerid,'�����ֶβ���Ϊ��' from ent_info where INDUSTRYTYPE is null);
  --������ҵ������ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','INDUSTRYTYPE',customerid,'������ҵ������ֵӳ������' from ent_info where INDUSTRYTYPE is not null and INDUSTRYTYPE not in (select itemNo from code_library where codeNo='IndustryType' and isInUse='1') );
  --ע���ʱ�
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','REGISTERCAPITAL',customerid,'�����ֶβ���Ϊ��' from ent_info where REGISTERCAPITAL is null);
  --ע���ʱ�����
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','RCCURRENCY',customerid,'�����ֶβ���Ϊ��' from ent_info where RCCURRENCY is null);
  --ע���ʱ�������ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','RCCURRENCY',customerid,'ע���ʱ�������ֵӳ������' from ent_info where RCCURRENCY is not null and RCCURRENCY not in (select itemNo from code_library where codeNo='Currency' and isInUse='1') );
  --���й�˾����
  --insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','LISTINGCORPORNOT',customerid,'�����ֶβ���Ϊ��' from ent_info where LISTINGCORPORNOT is null);
  --���й�˾������ֵУ��
  --insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','LISTINGCORPORNOT',customerid,'���й�˾������ֵӳ������' from ent_info where LISTINGCORPORNOT is not null and LISTINGCORPORNOT not in (select itemNo from code_library where codeNo='ListingCorpType' and isInUse='1') );
  --���޽����ھ�ӪȨ
  --insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','HASIERIGHT',customerid,'�����ֶβ���Ϊ��' from ent_info where HASIERIGHT is null);
  --���޽����ھ�ӪȨ��ֵУ��
  --insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','HASIERIGHT',customerid,'���޽����ھ�ӪȨ��ֵӳ������' from ent_info where HASIERIGHT is not null and HASIERIGHT not in (select itemNo from code_library where codeNo='YesNo' and isInUse='1') );
  --���ʲ�
  --insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','TOTALASSETS',customerid,'�����ֶβ���Ϊ��' from ent_info where TOTALASSETS is null);
  --��ҵ��ģ
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','SCOPE',customerid,'�����ֶβ���Ϊ��' from ent_info where SCOPE is null);
  --��ҵ��ģ��ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','SCOPE',customerid,'��ҵ��ģ��ֵӳ������' from ent_info where SCOPE is not null and SCOPE not in (select itemNo from code_library where codeNo='Scope' and isInUse='1') );
  --���¿ͻ��������
  --insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','ENTEVALUATERESULT',customerid,'�����ֶβ���Ϊ��' from ent_info where ENTEVALUATERESULT is null);
  --���¿ͻ����������ֵУ��
  --insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','ENTEVALUATERESULT',customerid,'���¿ͻ����������ֵӳ������' from ent_info where ENTEVALUATERESULT is not null and ENTEVALUATERESULT not in (select itemNo from code_library where codeNo='ScoreLevel1' and isInUse='1') );
  --�Ǽǿͻ�����
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','INPUTUSERID',customerid,'�Ǽǿͻ�����Ϊ��' from ent_info where INPUTUSERID is null);
  --�жϵǼǿͻ�������USER_INFO���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','INPUTUSERID',customerid,'�Ǽǿͻ�������USER_INFO������' from ent_info where INPUTUSERID is not null and INPUTUSERID not in (select USERID from USER_INFO) );
  --�Ǽǻ���
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','INPUTORGID',customerid,'�Ǽǻ���Ϊ��' from ent_info where INPUTORGID is null);
  --�жϵǼǻ�����ORG_INFO���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','INPUTORGID',customerid,'�Ǽǻ�����ORG_INFO������' from ent_info where INPUTORGID is not null and INPUTORGID not in (select ORGID from ORG_INFO) );
  --�жϵǼǿͻ�����͵Ǽǻ����Ƿ�һ��
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason)
  (select 'ENT_INFO','INPUTUSERID,INPUTORGID',customerid,'�Ǽǿͻ�������Ǽǻ�����ƥ��' from ent_info ei where ei.INPUTUSERID is not null and ei.INPUTORGID is not null and ei.INPUTORGID <> (select ui.BelongOrg from user_info ui where ui.userid=ei.INPUTUSERID ) );
  --�жϿͻ������CUSTOMER_INFO���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'ENT_INFO','CUSTOMERID',customerid,'�ͻ������CUSTOMER_INFO������' from ent_info where CUSTOMERID is not null and CUSTOMERID not in (select CUSTOMERID from CUSTOMER_INFO) );
  --���ڻ�������
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason)
  (select 'ENT_INFO','FINANCETYPE',ei.customerid,'ͬҵ�ͻ�FINANCETYPE�ֶβ���Ϊ��' from ent_info ei,customer_info ci where ei.CUSTOMERID=ci.CUSTOMERID and ci.CustomerType='0610' and ei.FINANCETYPE is null );
  --���ڻ���������ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason)
  (select 'ENT_INFO','FINANCETYPE',ei.customerid,'���ڻ���������ֵ����' from ent_info ei,customer_info ci where ei.CUSTOMERID=ci.CUSTOMERID and ci.CustomerType='0610' and ei.FINANCETYPE is not null and ei.FINANCETYPE not in (select itemNo from code_library where codeNo='TYOrgType1' and isInUse='1' ) );

  --�ͻ�������CUSTOMER_RELATIVE
  --������ϵ/Ͷ�ʷ�ʽ/����ְ��/���ʷ�ʽ
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, RELATIVEID, RELATIONSHIP,badReason) (select 'CUSTOMER_RELATIVE','RELATIONSHIP',CUSTOMERID, RELATIVEID, RELATIONSHIP,'�����ֶβ���Ϊ��' from customer_relative where RELATIONSHIP is null);
  --������ϵ/Ͷ�ʷ�ʽ/����ְ��/���ʷ�ʽ��ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, RELATIVEID, RELATIONSHIP,badReason) (select 'CUSTOMER_RELATIVE','RELATIONSHIP',CUSTOMERID, RELATIVEID, RELATIONSHIP,'������ϵ/Ͷ�ʷ�ʽ/����ְ��/���ʷ�ʽ��ֵӳ������' from customer_relative where RELATIONSHIP is not null and RELATIONSHIP not in (select itemNo from code_library where codeNo='RelationShip' and isInUse='1') );
  --֤������
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, RELATIVEID, RELATIONSHIP,badReason) (select 'CUSTOMER_RELATIVE','CERTID',CUSTOMERID, RELATIVEID, RELATIONSHIP,'�����ֶβ���Ϊ��' from customer_relative where CERTID is null);
  --֤������
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, RELATIVEID, RELATIONSHIP,badReason) (select 'CUSTOMER_RELATIVE','CERTTYPE',CUSTOMERID, RELATIVEID, RELATIONSHIP,'�����ֶβ���Ϊ��' from customer_relative where CERTTYPE is null);
  --֤��������ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, RELATIVEID, RELATIONSHIP,badReason) (select 'CUSTOMER_RELATIVE','CERTTYPE',CUSTOMERID, RELATIVEID, RELATIONSHIP,'֤��������ֵӳ������' from customer_relative where CERTTYPE is not null and CERTTYPE not in (select itemNo from code_library where codeNo='CertType' and isInUse='1') );
  --�Ƿ���Ч
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, RELATIVEID, RELATIONSHIP,badReason) (select 'CUSTOMER_RELATIVE','EFFSTATUS',CUSTOMERID, RELATIVEID, RELATIONSHIP,'�����ֶβ���Ϊ��' from customer_relative where EFFSTATUS is null);
  --�Ƿ���Ч��ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, RELATIVEID, RELATIONSHIP,badReason) (select 'CUSTOMER_RELATIVE','EFFSTATUS',CUSTOMERID, RELATIVEID, RELATIONSHIP,'�Ƿ���Ч��ֵӳ������' from customer_relative where EFFSTATUS is not null and EFFSTATUS not in (select itemNo from code_library where codeNo='EffStatus' and isInUse='1') );
  --��ϵ���
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, RELATIVEID, RELATIONSHIP,badReason) (select 'CUSTOMER_RELATIVE','RELATIVEID',CUSTOMERID, RELATIVEID, RELATIONSHIP,'�����ֶβ���Ϊ��' from customer_relative where RELATIVEID is null);
  --��ϵ�������Ӧ�ͻ���Customer_Info���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, RELATIVEID, RELATIONSHIP,badReason) (select 'CUSTOMER_RELATIVE','RELATIVEID',CUSTOMERID, RELATIVEID, RELATIONSHIP,'��ϵ��Ŷ�Ӧ�ͻ���Customer_Info������' from customer_relative where RELATIVEID is not null and RELATIVEID not in (select customerid from customer_info) );
  --�ͻ����
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, RELATIVEID, RELATIONSHIP,badReason) (select 'CUSTOMER_RELATIVE','CUSTOMERID',CUSTOMERID, RELATIVEID, RELATIONSHIP,'�����ֶβ���Ϊ��' from customer_relative where CUSTOMERID is null);
  --�ͻ���Ŷ�Ӧ�ͻ���Customer_Info���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, RELATIVEID, RELATIONSHIP,badReason) (select 'CUSTOMER_RELATIVE','CUSTOMERID',CUSTOMERID, RELATIVEID, RELATIONSHIP,'�ͻ���Ŷ�Ӧ�ͻ���Customer_Info������' from customer_relative where CUSTOMERID is not null and CUSTOMERID not in (select customerid from customer_info) );
  --�ͻ�����������Ų�����ͬ(�������Լ�����������ϵ) add by gwwang 181224 
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, RELATIVEID, RELATIONSHIP,badReason) (select 'CUSTOMER_RELATIVE','CUSTOMERID,RELATIVEID',CUSTOMERID, RELATIVEID, RELATIONSHIP,'�ͻ�����������Ų�����ͬ(�������Լ�����������ϵ)' from customer_relative where CUSTOMERID = RELATIVEID);

  --���˿ͻ���ϢIND_INFO
  --����״��
  --insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'IND_INFO','MARRIAGE',CUSTOMERID,'�����ֶβ���Ϊ��' from ind_info where MARRIAGE is null);
  --����״����ֵУ��
  --insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'IND_INFO','MARRIAGE',CUSTOMERID,'����״����ֵӳ������' from ind_info where MARRIAGE is not null and MARRIAGE not in (select itemNo from code_library where codeNo='Marriage' and isInUse='1') );
  --�Ա�
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'IND_INFO','SEX',CUSTOMERID,'�����ֶβ���Ϊ��' from ind_info where SEX is null);
  --�Ա���ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'IND_INFO','SEX',CUSTOMERID,'�Ա���ֵӳ������' from ind_info where SEX is not null and SEX not in (select itemNo from code_library where codeNo='Sex' and isInUse='1') );
  --���ѧλ
  --insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'IND_INFO','EDUDEGREE',CUSTOMERID,'�����ֶβ���Ϊ��' from ind_info where EDUDEGREE is null);
  --���ѧλ��ֵУ��
  --insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'IND_INFO','EDUDEGREE',CUSTOMERID,'���ѧλ��ֵӳ������' from ind_info where EDUDEGREE is not null and EDUDEGREE not in (select itemNo from code_library where codeNo='EducationDegree' and isInUse='1') );
  --���ѧ��
  --insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'IND_INFO','EDUEXPERIENCE',CUSTOMERID,'�����ֶβ���Ϊ��' from ind_info where EDUEXPERIENCE is null);
  --���ѧ����ֵУ��
  --insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'IND_INFO','EDUEXPERIENCE',CUSTOMERID,'���ѧ��ӳ������' from ind_info where EDUEXPERIENCE is not null and EDUEXPERIENCE not in (select itemNo from code_library where codeNo='EducationExperience' and isInUse='1') );
  --��ס״��
  --insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'IND_INFO','FAMILYSTATUS',CUSTOMERID,'�����ֶβ���Ϊ��' from ind_info where FAMILYSTATUS is null);
  --��ס״����ֵУ��
  --insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'IND_INFO','FAMILYSTATUS',CUSTOMERID,'��ס״����ֵӳ������' from ind_info where FAMILYSTATUS is not null and FAMILYSTATUS not in (select itemNo from code_library where codeNo='FamilyStatus' and isInUse='1') );
  --��������
  --insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'IND_INFO','BIRTHDAY',CUSTOMERID,'�����ֶβ���Ϊ��' from ind_info where BIRTHDAY is null);
  --����
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'IND_INFO','FULLNAME',CUSTOMERID,'�����ֶβ���Ϊ��' from ind_info where FULLNAME is null);
  --֤������
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'IND_INFO','CERTTYPE',CUSTOMERID,'�����ֶβ���Ϊ��' from ind_info where CERTTYPE is null);
  --֤��������ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'IND_INFO','CERTTYPE',CUSTOMERID,'֤��������ֵӳ������' from ind_info where CERTTYPE is not null and CERTTYPE not in (select itemNo from code_library where codeNo='CertType' and isInUse='1') );
  --֤������
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'IND_INFO','CERTID',CUSTOMERID,'�����ֶβ���Ϊ��' from ind_info where CERTID is null);
  --�жϿͻ������CUSTOMER_INFO���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason)
  (select 'IND_INFO','CUSTOMERID',CUSTOMERID,'�ÿͻ���CUSTOMER_INFO������' from ind_info where CUSTOMERID not in (select CUSTOMERID from CUSTOMER_INFO) );

  --������ͬ��GUARANTY_CONTRACT
  --������ͬ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GUARANTY_CONTRACT','CONTRACTTYPE',SERIALNO,'�����ֶβ���Ϊ��' from guaranty_contract where CONTRACTTYPE is null);
  --������ͬ������ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GUARANTY_CONTRACT','CONTRACTTYPE',SERIALNO,'������ͬ������ֵӳ������' from guaranty_contract where CONTRACTTYPE is not null and CONTRACTTYPE not in (select itemNo from code_library where codeNo='ContractType' and isInUse='1') );
  --������ʽ
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GUARANTY_CONTRACT','GUARANTYTYPE',SERIALNO,'�����ֶβ���Ϊ��' from guaranty_contract where GUARANTYTYPE is null);
  --������ʽ��ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GUARANTY_CONTRACT','GUARANTYTYPE',SERIALNO,'������ʽ��ֵӳ������' from guaranty_contract where GUARANTYTYPE is not null and GUARANTYTYPE not in (select itemNo from code_library where codeNo='VouchType1' and isInUse='1') );
  --��Ѻ/����/��֤��֤������
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GUARANTY_CONTRACT','CERTTYPE',SERIALNO,'�����ֶβ���Ϊ��' from guaranty_contract where CERTTYPE is null);
  --��Ѻ/����/��֤��֤��������ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GUARANTY_CONTRACT','CERTTYPE',SERIALNO,'��Ѻ/����/��֤��֤��������ֵӳ������' from guaranty_contract where CERTTYPE is not null and CERTTYPE not in (select itemNo from code_library where codeNo='CertType' and isInUse='1') );
  --��ͬ״̬
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GUARANTY_CONTRACT','CONTRACTSTATUS',SERIALNO,'�����ֶβ���Ϊ��' from guaranty_contract where CONTRACTSTATUS is null);
  --��ͬ״̬��ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GUARANTY_CONTRACT','CONTRACTSTATUS',SERIALNO,'��ͬ״̬��ֵӳ������' from guaranty_contract where CONTRACTSTATUS is not null and CONTRACTSTATUS not in (select itemNo from code_library where codeNo='ContractStatus' and isInUse='1') );
  --��ͬ��Ч��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GUARANTY_CONTRACT','BEGINDATE',SERIALNO,'�����ֶβ���Ϊ��' from guaranty_contract where BEGINDATE is null);
  --��ͬ������
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GUARANTY_CONTRACT','ENDDATE',SERIALNO,'�����ֶβ���Ϊ��' from guaranty_contract where ENDDATE is null);
  --����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GUARANTY_CONTRACT','GUARANTYCURRENCY',SERIALNO,'�����ֶβ���Ϊ��' from guaranty_contract where GUARANTYCURRENCY is null);
  --������ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GUARANTY_CONTRACT','GUARANTYCURRENCY',SERIALNO,'������ͬ������ֵӳ������' from guaranty_contract where GUARANTYCURRENCY is not null and GUARANTYCURRENCY not in (select itemNo from code_library where codeNo='Currency' and isInUse='1') );
  --�����ܽ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GUARANTY_CONTRACT','GUARANTYVALUE',SERIALNO,'�����ֶβ���Ϊ��' from guaranty_contract where GUARANTYVALUE is null);
  --ҵ���ͬ�Ͽͻ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GUARANTY_CONTRACT','CUSTOMERID',SERIALNO,'�����ֶβ���Ϊ��' from guaranty_contract where CUSTOMERID is null);
  --ҵ���ͬ�Ͽͻ������Customer_Info���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GUARANTY_CONTRACT','CUSTOMERID',SERIALNO,'�����ֶβ���Ϊ��' from guaranty_contract where CUSTOMERID is not null and CUSTOMERID not in (select customerid from customer_info ));
  --��/��Ѻ�˿ͻ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GUARANTY_CONTRACT','GUARANTORID',SERIALNO,'�����ֶβ���Ϊ��' from guaranty_contract where GUARANTORID is null);
  --��/��Ѻ�˿ͻ������Customer_Info���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GUARANTY_CONTRACT','GUARANTORID',SERIALNO,'�����ֶβ���Ϊ��' from guaranty_contract where GUARANTORID is not null and GUARANTORID not in (select customerid from customer_info ));
  --֤������
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GUARANTY_CONTRACT','CERTID',SERIALNO,'�����ֶβ���Ϊ��' from guaranty_contract where CERTID is null);

  --��Ȼ�����Ϣ��CL_INFO
  --ҵ��Ʒ��
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','BUSINESSTYPE',LINEID,'�����ֶβ���Ϊ��' from cl_info where BUSINESSTYPE is null);
  --ҵ��Ʒ����ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','BUSINESSTYPE',LINEID,'���ҵ��Ʒ��ӳ������' from cl_info where BUSINESSTYPE is not null and BUSINESSTYPE not in (select typeNo from business_Type where isInUse ='1') );
  --������
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','ENDDATE',LINEID,'�����ֶβ���Ϊ��' from cl_info where ENDDATE is null);
  --����
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','CURRENCY',LINEID,'�����ֶβ���Ϊ��' from cl_info where CURRENCY is null);
  --������ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','CURRENCY',LINEID,'������ֵӳ������' from cl_info where CURRENCY is not null and CURRENCY not in (select itemNo from code_library where codeNo='Currency' and isInUse='1') );
  --��ʼ��
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','BEGINDATE',LINEID,'�����ֶβ���Ϊ��' from cl_info where BEGINDATE is null);
  --���ڽ��
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','LINESUM2',LINEID,'�����ֶβ���Ϊ��' from cl_info where LINESUM2 is null);
  --�����ܶ�
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','LINESUM1',LINEID,'�����ֶβ���Ϊ��' from cl_info where LINESUM1 is null);
  --У�����������Ƿ���ڵ��ڳ��ڽ��
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','LINESUM1,LINESUM2',LINEID,'��������������ڵ��ڳ��ڽ��' from cl_info where LINESUM1 < LINESUM2 and LINESUM1 is not null and LINESUM2 is not null );
  --������ͱ��
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','CLTYPEID',LINEID,'�����ֶβ���Ϊ��' from cl_info where CLTYPEID is null);
  --������ͷ�Χ
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','CLTYPEID',LINEID,'���������ֵӳ������' from cl_info where CLTYPEID is not null and CLTYPEID not in (select itemNo from code_library where codeNo='OURROLE' and isInUse='1') );
  --�Ƿ�ѭ��
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','ROTATIVE',LINEID,'�����ֶβ���Ϊ��' from cl_info where ROTATIVE is null);
  --�Ƿ�ѭ����ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','ROTATIVE',LINEID,'�Ƿ�ѭ����ֵӳ������' from cl_info where ROTATIVE is not null and ROTATIVE not in (select itemNo from code_library where codeNo='YesNo' and isInUse='1') );
  --�ͻ����
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','CUSTOMERID',LINEID,'�����ֶβ���Ϊ��' from cl_info where CUSTOMERID is null);
  --���������
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','AUDITDATE',LINEID,'�����ֶβ���Ϊ��' from cl_info where AUDITDATE is null);
  --���״̬
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','STATUS',LINEID,'�����ֶβ���Ϊ��' from cl_info where STATUS is null);
  --���״̬��ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','STATUS',LINEID,'���״̬��ֵӳ������' from cl_info where STATUS is not null and STATUS not in (select itemNo from code_library where codeNo='Status' and isInUse='1') );
  --��Ч������
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','EFFECTBUSINESSSUM',LINEID,'�����ֶβ���Ϊ��' from cl_info where EFFECTBUSINESSSUM is null);
  --��Ч���ڽ��
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','EFFECTEXPOSURESUM',LINEID,'�����ֶβ���Ϊ��' from cl_info where EFFECTEXPOSURESUM is null);
  --�ж���Ч�������Ƿ���ڵ�����Ч���ڽ��
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason)
  (select 'CL_INFO','EFFECTBUSINESSSUM,EFFECTEXPOSURESUM',LINEID,'��Ч�����������ڵ�����Ч���ڽ��' from cl_info where EFFECTBUSINESSSUM is not null and EFFECTEXPOSURESUM is not null and EFFECTBUSINESSSUM < EFFECTEXPOSURESUM);
  --����������
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','FREEZEBUSINESSSUM',LINEID,'�����ֶβ���Ϊ��' from cl_info where FREEZEBUSINESSSUM is null);
  --���᳨�ڽ��
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','FREEZEEXPOSURESUM',LINEID,'�����ֶβ���Ϊ��' from cl_info where FREEZEEXPOSURESUM is null);
  --�ж϶����������Ƿ���ڵ��ڶ��᳨�ڽ��
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason)
  (select 'CL_INFO','FREEZEBUSINESSSUM,FREEZEEXPOSURESUM',LINEID,'���������������ڵ��ڶ��᳨�ڽ��' from cl_info where FREEZEBUSINESSSUM is not null and FREEZEEXPOSURESUM is not null and FREEZEBUSINESSSUM < FREEZEEXPOSURESUM);
  --����������
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','USEDBUSINESSSUM',LINEID,'�����ֶβ���Ϊ��' from cl_info where USEDBUSINESSSUM is null);
  --���ó��ڽ��
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','USEDEXPOSURESUM',LINEID,'�����ֶβ���Ϊ��' from cl_info where USEDEXPOSURESUM is null);
  --�ж������������Ƿ���ڵ������ó��ڽ��
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason)
  (select 'CL_INFO','USEDBUSINESSSUM,USEDEXPOSURESUM',LINEID,'���������������ڵ������ó��ڽ��' from cl_info where USEDBUSINESSSUM is not null and USEDEXPOSURESUM is not null and USEDBUSINESSSUM < USEDEXPOSURESUM);
  --�Ƿ񶳽�
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','FREEZEFLAG',LINEID,'�����ֶβ���Ϊ��' from cl_info where FREEZEFLAG is null);
  --�Ƿ񶳽���ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','FREEZEFLAG',LINEID,'���״̬��ֵӳ������' from cl_info where FREEZEFLAG is not null and FREEZEFLAG not in (select itemNo from code_library where codeNo='FreezeFlag' and isInUse='1') );
  --����
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','TERMMONTH',LINEID,'�����ֶβ���Ϊ��' from cl_info where TERMMONTH is null);
  --������ʽ
  --insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','OCCURTYPE',lineid,'�����ֶβ���Ϊ��' from cl_info where OCCURTYPE is null);
  --������ʽ��ֵУ��
  --insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','OCCURTYPE',lineid,'������ʽ��ֵӳ������' from cl_info where OCCURTYPE is not null and OCCURTYPE <> '010');
  --ר�������ò�Ʒ
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','USEPRODUCTTYPE',LINEID,'�����ֶβ���Ϊ��' from cl_info where USEPRODUCTTYPE is null and CLTYPEID='020');
  --ר�������ò�Ʒ��ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason)
  (select 'CL_INFO','USEPRODUCTTYPE',LINEID,'ר�������ò�Ʒ��ֵӳ������' from cl_info where USEPRODUCTTYPE is not null and CLTYPEID='020' and USEPRODUCTTYPE not in (select typeno from business_type where isinuse='1'));
  --����������ˮ��
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','APPLYSERIALNO',LINEID,'�����ֶβ���Ϊ��' from cl_info where APPLYSERIALNO is null);
  --�ж�����������ˮ����BUSINESS_APPLY���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','APPLYSERIALNO',LINEID,'APPLYSERIALNO��BUSINESS_APPLY������' from cl_info where APPLYSERIALNO is not null and APPLYSERIALNO not in (select serialno from BUSINESS_APPLY));
  --����������ˮ��
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','APPROVESERIALNO',LINEID,'�����ֶβ���Ϊ��' from cl_info where APPROVESERIALNO is null);
  --�ж�����������ˮ����BUSINESS_APPLY���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason) (select 'CL_INFO','APPROVESERIALNO',LINEID,'APPROVESERIALNO��BUSINESS_APPROVE������' from cl_info where APPROVESERIALNO is not null and APPROVESERIALNO not in (select serialno from BUSINESS_APPROVE));
  --�ж��������Ƿ���ڵ�������������
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason)
  (select 'CL_INFO','LINESUM1,USEDBUSINESSSUM',LINEID,'�����������ڵ�������������' from cl_info where LINESUM1 is not null and USEDBUSINESSSUM is not null and LINESUM1 < USEDBUSINESSSUM);
  --�жϳ��ڽ���Ƿ���ڵ������ó��ڽ��
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason)
  (select 'CL_INFO','LINESUM2,USEDEXPOSURESUM',LINEID,'���ڽ�������ڵ������ó��ڽ��' from cl_info where LINESUM2 is not null and USEDEXPOSURESUM is not null and LINESUM2 < USEDEXPOSURESUM);
  --�ж���Ч�������Ƿ���ڵ�������������
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason)
  (select 'CL_INFO','EFFECTBUSINESSSUM,USEDBUSINESSSUM',LINEID,'��Ч�����������ڵ�������������' from cl_info where EFFECTBUSINESSSUM is not null and USEDBUSINESSSUM is not null and EFFECTBUSINESSSUM < USEDBUSINESSSUM);
  --�ж���Ч���ڽ���Ƿ���ڵ������ó��ڽ��
  insert into SQ_BAD_DATA(tableName,columnName,LINEID,badReason)
  (select 'CL_INFO','EFFECTEXPOSURESUM,USEDEXPOSURESUM',LINEID,'��Ч���ڽ�������ڵ������ó��ڽ��' from cl_info where EFFECTEXPOSURESUM is not null and USEDEXPOSURESUM is not null and EFFECTEXPOSURESUM < USEDEXPOSURESUM);

  --����зֱ�CL_DIVIDE
  --�з��������
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_DIVIDE','DIVIDECODE',SERIALNO,'�����ֶβ���Ϊ��' from cl_divide where DIVIDECODE is null);
  --�з�������뷶ΧУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_DIVIDE','DIVIDECODE',SERIALNO,'�з��������ӳ������' from cl_divide where DIVIDECODE is not null and DIVIDECODE not in (select typeNo from business_Type where isInUse ='1') );
  --����������
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_DIVIDE','OBJECTNO',SERIALNO,'�����ֶβ���Ϊ��' from cl_divide where OBJECTNO is null and OBJECTTYPE='CLInfo');
  --���������Ź�����ѯ
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_DIVIDE','OBJECTNO',SERIALNO,OBJECTNO||'��Ӧ�������Ŷ�Ȳ���CL_Info��' from cl_divide where OBJECTNO is not null and OBJECTTYPE='CLInfo' and OBJECTNO not in (select lineid from CL_Info));
  --����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_DIVIDE','CURRENCY',serialno,'�����ֶβ���Ϊ��' from cl_divide where CURRENCY is null);
  --���ַ�ΧУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_DIVIDE','CURRENCY',SERIALNO,'���״̬��ֵӳ������' from cl_divide where CURRENCY is not null and CURRENCY not in (select itemNo from code_library where codeNo='Currency' and isInUse='1') );
  --������
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_DIVIDE','BUSINESSSUM',SERIALNO,'�����ֶβ���Ϊ��' from cl_divide where BUSINESSSUM is null);
  --���ڽ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_DIVIDE','EXPOSURESUM',SERIALNO,'�����ֶβ���Ϊ��' from cl_divide where EXPOSURESUM is null);
  --�ж��������Ƿ���ڵ��ڳ��ڽ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason)
  (select 'CL_DIVIDE','BUSINESSSUM,EXPOSURESUM',SERIALNO,'�����������ڵ��ڳ��ڽ��' from cl_divide where BUSINESSSUM is not null and EXPOSURESUM is not null and BUSINESSSUM<EXPOSURESUM);
  --�з�����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_DIVIDE','DIVIDETYPE',SERIALNO,'�����ֶβ���Ϊ��' from cl_divide where DIVIDETYPE is null);
  --�з�������ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_DIVIDE','DIVIDETYPE',SERIALNO,'�з�������ֵӳ������' from cl_divide where DIVIDETYPE is not null and DIVIDETYPE <> '1');

  --�ͻ������б�CUSTOMER_BELONG
  --�ͻ�����Ȩ
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, ORGID, USERID,badReason) (select 'CUSTOMER_BELONG','BELONGATTRIBUTE',CUSTOMERID, ORGID, USERID,'�����ֶβ���Ϊ��' from customer_belong where BELONGATTRIBUTE is null);
  --�ͻ�����Ȩ��ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, ORGID, USERID,badReason) (select 'CUSTOMER_BELONG','BELONGATTRIBUTE',CUSTOMERID, ORGID, USERID,'�ͻ�����Ȩ��ֵӳ������' from customer_belong where BELONGATTRIBUTE is not null and BELONGATTRIBUTE not in (select itemNo from code_library where codeNo='HaveNot' and isInUse='1') );
  --��Ϣ�鿴Ȩ
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, ORGID, USERID,badReason) (select 'CUSTOMER_BELONG','BELONGATTRIBUTE1',CUSTOMERID, ORGID, USERID,'�����ֶβ���Ϊ��' from customer_belong where BELONGATTRIBUTE1 is null);
  --��Ϣ�鿴Ȩ��ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, ORGID, USERID,badReason) (select 'CUSTOMER_BELONG','BELONGATTRIBUTE1',CUSTOMERID, ORGID, USERID,'��Ϣ�鿴Ȩ��ֵӳ������' from customer_belong where BELONGATTRIBUTE1 is not null and BELONGATTRIBUTE1 not in (select itemNo from code_library where codeNo='HaveNot' and isInUse='1') );
  --��Ϣά��Ȩ
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, ORGID, USERID,badReason) (select 'CUSTOMER_BELONG','BELONGATTRIBUTE2',CUSTOMERID, ORGID, USERID,'�����ֶβ���Ϊ��' from customer_belong where BELONGATTRIBUTE2 is null);
  --��Ϣά��Ȩ��ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, ORGID, USERID,badReason) (select 'CUSTOMER_BELONG','BELONGATTRIBUTE2',CUSTOMERID, ORGID, USERID,'��Ϣά��Ȩ��ֵӳ������' from customer_belong where BELONGATTRIBUTE2 is not null and BELONGATTRIBUTE2 not in (select itemNo from code_library where codeNo='HaveNot' and isInUse='1') );
  --ҵ�����Ȩ
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, ORGID, USERID,badReason) (select 'CUSTOMER_BELONG','BELONGATTRIBUTE3',CUSTOMERID, ORGID, USERID,'�����ֶβ���Ϊ��' from customer_belong where BELONGATTRIBUTE3 is null);
  --ҵ�����Ȩ��ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, ORGID, USERID,badReason) (select 'CUSTOMER_BELONG','BELONGATTRIBUTE3',CUSTOMERID, ORGID, USERID,'ҵ�����Ȩ��ֵӳ������' from customer_belong where BELONGATTRIBUTE3 is not null and BELONGATTRIBUTE3 not in (select itemNo from code_library where codeNo='HaveNot' and isInUse='1') );
  --��������
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, ORGID, USERID,badReason) (select 'CUSTOMER_BELONG','ORGID',CUSTOMERID, ORGID, USERID,'�����ֶβ���Ϊ��' from customer_belong where ORGID is null);
  --�ж����������Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, ORGID, USERID,badReason) (select 'CUSTOMER_BELONG','ORGID',CUSTOMERID, ORGID, USERID,'����������ORG_INFO������' from customer_belong where ORGID is not null and ORGID not in (select ORGID from ORG_INFO));
  --�ͻ�����
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, ORGID, USERID,badReason) (select 'CUSTOMER_BELONG','USERID',CUSTOMERID, ORGID, USERID,'�����ֶβ���Ϊ��' from customer_belong where USERID is null);
  --�жϿͻ������Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, ORGID, USERID,badReason) (select 'CUSTOMER_BELONG','USERID',CUSTOMERID, ORGID, USERID,'�ͻ�������USER_INFO������' from customer_belong where USERID is not null and userid not in (select userid from user_info));
  --�жϿͻ���������������Ƿ�ƥ��
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID, ORGID, USERID,badReason) (select 'CUSTOMER_BELONG','USERID',cb.CUSTOMERID, cb.ORGID, cb.USERID,'�ͻ�����ͻ�����ƥ��' from customer_belong cb where cb.USERID is not null and cb.ORGID is not null and cb.ORGID<> (select ui.BelongOrg from user_info ui where ui.userid=cb.userid));

  --�ͻ���ϵ��ַ��Ϣ��CUSTOMER_ADDRESS
  --�ͻ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_ADDRESS','CUSTOMERID',SERIALNO,'�����ֶβ���Ϊ��' from customer_address where CUSTOMERID is null);
  --�жϿͻ������CUSTOMER_INFO���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_ADDRESS','CUSTOMERID',SERIALNO,'�ÿͻ���CUSTOMER_INFO������' from customer_address where CUSTOMERID is not null and CUSTOMERID not in (select CUSTOMERID from CUSTOMER_INFO));
  --��ʾ��������
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_ADDRESS','LANGUAGETYPE',SERIALNO,'�����ֶβ���Ϊ��' from customer_address where LANGUAGETYPE is null);
  --��ʾ����������ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_ADDRESS','LANGUAGETYPE',SERIALNO,'��ʾ����������ֵӳ������' from customer_address where LANGUAGETYPE is not null and LANGUAGETYPE not in (select itemNo from code_library where codeNo='LanguageType' and isInUse='1') );
  --��ַ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_ADDRESS','ADDTYPE',SERIALNO,'�����ֶβ���Ϊ��' from customer_address where ADDTYPE is null);
  --��ַ������ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_ADDRESS','ADDTYPE',SERIALNO,'��ַ������ֵӳ������' from customer_address where ADDTYPE is not null and ADDTYPE not in (select itemNo from code_library where codeNo='AddType' and isInUse='1') );
  --��ַ��������/����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_ADDRESS','COUNTRY',SERIALNO,'�����ֶβ���Ϊ��' from customer_address where COUNTRY is null);
  --��ַ��������/������ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_ADDRESS','COUNTRY',SERIALNO,'��ַ��������/������ֵӳ������' from customer_address where COUNTRY is not null and COUNTRY not in (select itemNo from code_library where codeNo='CountryCode' and isInUse='1') );
  --��ַ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_ADDRESS','ADDRESS1',SERIALNO,'�����ֶβ���Ϊ��' from customer_address where ADDRESS1 is null);

  --�ͻ���ϵ�绰��Ϣ��CUSTOMER_TEL
  --�ͻ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_TEL','CUSTOMERID',SERIALNO,'�����ֶβ���Ϊ��' from customer_tel where CUSTOMERID is null);
  --�жϿͻ������CUSTOMER_INFO���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_TEL','CUSTOMERID',SERIALNO,'�����ֶβ���Ϊ��' from customer_tel where CUSTOMERID is null);
  --�绰����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_TEL','TELTYPE',SERIALNO,'�����ֶβ���Ϊ��' from customer_tel where TELTYPE is null);
  --�绰������ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_TEL','TELTYPE',SERIALNO,'�绰������ֵӳ������' from customer_tel where TELTYPE is not null and TELTYPE not in (select itemNo from code_library where codeNo='TelType' and isInUse='1') );
  --�绰����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_TEL','TELEPHONE',SERIALNO,'�����ֶβ���Ϊ��' from customer_tel where TELEPHONE is null);

  --�ͻ�֤����Ϣ��CUSTOMER_CERT
  --�ͻ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_CERT','CUSTOMERID',SERIALNO,'�����ֶβ���Ϊ��' from customer_cert where CUSTOMERID is null);
  --�жϿͻ������CUSTOMER_INFO���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_CERT','CUSTOMERID',SERIALNO,'�ÿͻ���CUSTOMER_INFO������' from customer_cert where CUSTOMERID is not null and CUSTOMERID not in (select CUSTOMERID from customer_info));
  --֤������
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_CERT','CERTTYPE',SERIALNO,'�����ֶβ���Ϊ��' from customer_cert where CERTTYPE is null);
  --֤��������ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_CERT','CERTTYPE',SERIALNO,'֤��������ֵӳ������' from customer_cert where CERTTYPE is not null and CERTTYPE not in (select itemNo from code_library where codeNo='CertType' and isInUse='1') );
  --֤�����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_CERT','CERTID',SERIALNO,'�����ֶβ���Ϊ��' from customer_cert where CERTID is null);
  --֤��״̬
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_CERT','STATUS',SERIALNO,'�����ֶβ���Ϊ��' from customer_cert where STATUS is null);
  --֤��״̬��ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CUSTOMER_CERT','STATUS',SERIALNO,'֤��״̬��ֵӳ������' from customer_cert where STATUS is not null and STATUS not in (select itemNo from code_library where codeNo='EffStatus' and isInUse='1') );

  --ҵ���ͬ�뵣����ͬ������CONTRACT_RELATIVE
  --ҵ���ͬ���
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO, OBJECTTYPE, OBJECTNO,badReason) (select 'CONTRACT_RELATIVE','SERIALNO',SERIALNO, OBJECTTYPE, OBJECTNO,'�����ֶβ���Ϊ��' from contract_relative where SERIALNO is null);
  --ҵ���ͬ��Business_Contract���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO, OBJECTTYPE, OBJECTNO,badReason) (select 'CONTRACT_RELATIVE','SERIALNO',SERIALNO, OBJECTTYPE, OBJECTNO,'����ҵ���ͬ��Business_Contract������' from contract_relative where SERIALNO is not null and SERIALNO not in (select serialno from business_contract) );
  --����������ͬ���
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO, OBJECTTYPE, OBJECTNO,badReason) (select 'CONTRACT_RELATIVE','OBJECTNO',SERIALNO, OBJECTTYPE, OBJECTNO,'�����ֶβ���Ϊ��' from contract_relative where OBJECTNO is null);
  --��ͬ�¹����ĵ�����ͬ��Guaranty_Contract���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO, OBJECTTYPE, OBJECTNO,badReason) (select 'CONTRACT_RELATIVE','OBJECTNO',SERIALNO, OBJECTTYPE, OBJECTNO,'����������ͬ��Guaranty_Contract������' from contract_relative where OBJECTNO is not null and OBJECTNO not in (select serialno from guaranty_contract) );

  --������ͬ�뵣���������GUARANTY_RELATIVE
  --��������ҵ���ͬ���
  insert into SQ_BAD_DATA(tableName,columnName,OBJECTTYPE, GUARANTYID, CONTRACTNO, OBJECTNO,badReason) (select 'GUARANTY_RELATIVE','OBJECTNO',OBJECTTYPE, GUARANTYID, CONTRACTNO, OBJECTNO,'�����ֶβ���Ϊ��' from guaranty_relative where OBJECTNO is null);
  --��������ҵ���ͬ�����Business_Contract���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,OBJECTTYPE, GUARANTYID, CONTRACTNO, OBJECTNO,badReason) (select 'GUARANTY_RELATIVE','OBJECTNO',OBJECTTYPE, GUARANTYID, CONTRACTNO, OBJECTNO,'����ҵ���ͬ��Business_Contract������' from guaranty_relative where OBJECTNO is not null and OBJECTNO not in (select serialno from business_contract) );
  --������ͬ��ˮ��
  insert into SQ_BAD_DATA(tableName,columnName,OBJECTTYPE, GUARANTYID, CONTRACTNO, OBJECTNO,badReason) (select 'GUARANTY_RELATIVE','CONTRACTNO',OBJECTTYPE, GUARANTYID, CONTRACTNO, OBJECTNO,'�����ֶβ���Ϊ��' from guaranty_relative where CONTRACTNO is null);
  --������ͬ��ˮ����Guaranty_Contract���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,OBJECTTYPE, GUARANTYID, CONTRACTNO, OBJECTNO,badReason) (select 'GUARANTY_RELATIVE','CONTRACTNO',OBJECTTYPE, GUARANTYID, CONTRACTNO, OBJECTNO,'����������ͬ��Guaranty_Contract������' from guaranty_relative where CONTRACTNO is not null and CONTRACTNO not in (select serialno from guaranty_contract) );
  --����Ѻ����
  insert into SQ_BAD_DATA(tableName,columnName,OBJECTTYPE, GUARANTYID, CONTRACTNO, OBJECTNO,badReason) (select 'GUARANTY_RELATIVE','GUARANTYID',OBJECTTYPE, GUARANTYID, CONTRACTNO, OBJECTNO,'�����ֶβ���Ϊ��' from guaranty_relative where GUARANTYID is null);
  --����Ѻ������Guaranty_Info���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,OBJECTTYPE, GUARANTYID, CONTRACTNO, OBJECTNO,badReason) (select 'GUARANTY_RELATIVE','GUARANTYID',OBJECTTYPE, GUARANTYID, CONTRACTNO, OBJECTNO,'����ѺƷ�����Guaranty_Info������' from guaranty_relative where GUARANTYID is not null and GUARANTYID not in (select guarantyid from guaranty_info) );
  --��Ч��־
  insert into SQ_BAD_DATA(tableName,columnName,OBJECTTYPE, GUARANTYID, CONTRACTNO, OBJECTNO,badReason) (select 'GUARANTY_RELATIVE','STATUS',OBJECTTYPE, GUARANTYID, CONTRACTNO, OBJECTNO,'�����ֶβ���Ϊ��' from guaranty_relative where STATUS is null);
  --��Ч��־��ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,OBJECTTYPE, GUARANTYID, CONTRACTNO, OBJECTNO,badReason) (select 'GUARANTY_RELATIVE','STATUS',OBJECTTYPE, GUARANTYID, CONTRACTNO, OBJECTNO,'��Ч��־��ֵӳ������' from guaranty_relative where STATUS is not null and STATUS not in (select itemNo from code_library where codeNo='Status' and isInUse='1') );

  --�ͻ�������Ϣ��CUSTOMER_INFO
  --�ͻ�����
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'CUSTOMER_INFO','CUSTOMERNAME',CUSTOMERID,'�����ֶβ���Ϊ��' from customer_info where CUSTOMERNAME is null);
  --�϶�״̬
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'CUSTOMER_INFO','STATUS',CUSTOMERID,'�����ֶβ���Ϊ��' from customer_info where STATUS is null);
  --�϶�״̬��ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'CUSTOMER_INFO','STATUS',CUSTOMERID,'��Ч��־��ֵӳ������' from customer_info where STATUS is not null and STATUS not in (select itemNo from code_library where codeNo='CustomerStatus' and isInUse='1') );
  --֤������
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'CUSTOMER_INFO','CERTTYPE',CUSTOMERID,'�����ֶβ���Ϊ��' from customer_info where CERTTYPE is null);
  --֤��������ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'CUSTOMER_INFO','CERTTYPE',CUSTOMERID,'֤��������ֵӳ������' from customer_info where CERTTYPE is not null and CERTTYPE not in (select itemNo from code_library where codeNo='CertType' and isInUse='1') );
  --֤������
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'CUSTOMER_INFO','CERTID',CUSTOMERID,'�����ֶβ���Ϊ��' from customer_info where CERTID is null);
  --�ͻ�����
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'CUSTOMER_INFO','CUSTOMERTYPE',CUSTOMERID,'�����ֶβ���Ϊ��' from customer_info where CUSTOMERTYPE is null);
  --�ͻ�������ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'CUSTOMER_INFO','CUSTOMERTYPE',CUSTOMERID,'�ͻ�������ֵӳ������' from customer_info where CUSTOMERTYPE is not null and CUSTOMERTYPE not in (select itemNo from code_library where codeNo='CustomerType' and isInUse='1') );
  --���Ŀͻ���
  insert into SQ_BAD_DATA(tableName,columnName,CUSTOMERID,badReason) (select 'CUSTOMER_INFO','MFCUSTOMERID',CUSTOMERID,'�����ֶβ���Ϊ��' from customer_info where MFCUSTOMERID is null);

  --���Ż�����Ϣ��GROUP_INFO
  --���ſͻ�����
  insert into SQ_BAD_DATA(tableName,columnName,GROUPID,badReason) (select 'GROUP_INFO','GROUPNAME',GROUPID,'�����ֶβ���Ϊ��' from group_info where GROUPNAME is null);
  --���ż��
  insert into SQ_BAD_DATA(tableName,columnName,GROUPID,badReason) (select 'GROUP_INFO','GROUPABBNAME',GROUPID,'�����ֶβ���Ϊ��' from group_info where GROUPABBNAME is null);
  --���ź�����ҵ
  insert into SQ_BAD_DATA(tableName,columnName,GROUPID,badReason) (select 'GROUP_INFO','KEYMEMBERCUSTOMERID',GROUPID,'�����ֶβ���Ϊ��' from group_info where KEYMEMBERCUSTOMERID is null);
  --���ź�����ҵ��Customer_Info���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,GROUPID,badReason) (select 'GROUP_INFO','KEYMEMBERCUSTOMERID',GROUPID,'���ź�����ҵ��Customer_Info������' from group_info where KEYMEMBERCUSTOMERID is not null and KEYMEMBERCUSTOMERID not in (select customerid from customer_info) );
  --�����Ƿ���
  insert into SQ_BAD_DATA(tableName,columnName,GROUPID,badReason) (select 'GROUP_INFO','FINANCEFOCUS',GROUPID,'�����ֶβ���Ϊ��' from group_info where FINANCEFOCUS is null);
  --�����Ƿ�����ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,GROUPID,badReason) (select 'GROUP_INFO','FINANCEFOCUS',GROUPID,'�����Ƿ�����ֵӳ������' from group_info where FINANCEFOCUS is not null and FINANCEFOCUS not in (select itemNo from code_library where codeNo='YesNo' and isInUse='1') );
  --���Ż���
  insert into SQ_BAD_DATA(tableName,columnName,GROUPID,badReason) (select 'GROUP_INFO','GROUPHID',GROUPID,'�����ֶβ���Ϊ��' from group_info where GROUPHID is null);

  --������Ϣ��CMS_INSURANCE_INFO
  --ѺƷ���
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CMS_INSURANCE_INFO','GUARANTYID',SERIALNO,'�����ֶβ���Ϊ��' from cms_insurance_info where GUARANTYID is null);
  --ѺƷ�����Guaranty_Info���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CMS_INSURANCE_INFO','GUARANTYID',SERIALNO,'����ѺƷ�����Guaranty_Info������' from cms_insurance_info where GUARANTYID is not null and GUARANTYID not in (select guarantyid from guaranty_info) );
  --��������
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CMS_INSURANCE_INFO','GUARANTEESLIPNO',SERIALNO,'�����ֶβ���Ϊ��' from cms_insurance_info where GUARANTEESLIPNO is null);
  --������ʼ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CMS_INSURANCE_INFO','STARTDATE',SERIALNO,'�����ֶβ���Ϊ��' from cms_insurance_info where STARTDATE is null);
  --������ֹ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CMS_INSURANCE_INFO','ENDDATE',SERIALNO,'�����ֶβ���Ϊ��' from cms_insurance_info where ENDDATE is null);
  --Ͷ�����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CMS_INSURANCE_INFO','INSURANCEAMT',SERIALNO,'�����ֶβ���Ϊ��' from cms_insurance_info where INSURANCEAMT is null);
  --����״̬
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CMS_INSURANCE_INFO','INSURERSTATUS',SERIALNO,'�����ֶβ���Ϊ��' from cms_insurance_info where INSURERSTATUS is null);
  --����״̬��ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CMS_INSURANCE_INFO','INSURERSTATUS',SERIALNO,'����״̬��ֵӳ������' from cms_insurance_info where INSURERSTATUS is not null and INSURERSTATUS not in (select itemNo from code_library where codeNo='InsurerStatus' and isInUse='1') );

  --ͬҵ���ϸ������CL_CREDIT_SAME
  --������Ʒ������ˮ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_CREDIT_SAME','RELATIVEDIVIDENO',SERIALNO,'�����ֶβ���Ϊ��' from cl_credit_same where RELATIVEDIVIDENO is null);
  --����ϸ������CL_Info���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_CREDIT_SAME','RELATIVEDIVIDENO',SERIALNO,'����ϸ������CL_Info������' from cl_credit_same where RELATIVEDIVIDENO is not null and RELATIVEDIVIDENO not in (select lineid from cl_info) );
  --�зֲ�Ʒ���
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_CREDIT_SAME','DIVIDECODE',SERIALNO,'�����ֶβ���Ϊ��' from cl_credit_same where DIVIDECODE is null);
  --�зֲ�Ʒ�����Business_Type���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_CREDIT_SAME','DIVIDECODE',SERIALNO,'�зֲ�Ʒ�����Business_Type������' from cl_credit_same where DIVIDECODE is not null and DIVIDECODE not in (select typeNo from business_Type where isInUse ='1') );
  --�з�ϵͳ
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_CREDIT_SAME','DIVIDESYSTEM',SERIALNO,'�����ֶβ���Ϊ��' from cl_credit_same where DIVIDESYSTEM is null);
  --�з�ϵͳ��ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_CREDIT_SAME','DIVIDESYSTEM',SERIALNO,'�з�ϵͳ��ֵӳ������' from cl_credit_same where DIVIDESYSTEM is not null and DIVIDESYSTEM not in (select itemNo from code_library where codeNo='SameCreditSystemID' and isInUse='1') );
  --�зֲ���
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_CREDIT_SAME','DIVIDEPART',SERIALNO,'�����ֶβ���Ϊ��' from cl_credit_same where DIVIDEPART is null);
  --�зֲ�����ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_CREDIT_SAME','DIVIDEPART',SERIALNO,'�зֲ�����ֵӳ������' from cl_credit_same where DIVIDEPART is not null and DIVIDEPART not in (select itemNo from code_library where codeNo='SameCreditPartID' and isInUse='1') );
  --�з�������
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_CREDIT_SAME','DIVIDEBUSINESSSUM',SERIALNO,'�����ֶβ���Ϊ��' from cl_credit_same where DIVIDEBUSINESSSUM is null);
  --���䳨�ڽ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_CREDIT_SAME','DIVIDEEXPOSURESUM',SERIALNO,'�����ֶβ���Ϊ��' from cl_credit_same where DIVIDEEXPOSURESUM is null);
  --�ж��з��������Ƿ���ڵ��ڳ��ڽ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_CREDIT_SAME','DIVIDEBUSINESSSUM,DIVIDEEXPOSURESUM',SERIALNO,'�з������������ڵ��ڳ��ڽ��' from cl_credit_same where DIVIDEBUSINESSSUM < DIVIDEEXPOSURESUM );

  --��Ⱥ��Ա��Ϣ��GROUP_MEMBER_RELATIVE
  --���ſͻ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GROUP_MEMBER_RELATIVE','GROUPID',SERIALNO,'�����ֶβ���Ϊ��' from group_member_relative where GROUPID is null);
  --���ſͻ���Customer_Info���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GROUP_MEMBER_RELATIVE','GROUPID',SERIALNO,'���ſͻ���Customer_Info������' from group_member_relative where GROUPID is not null and GROUPID not in (select customerid from customer_info) );
  --���ſͻ���Group_Info���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GROUP_MEMBER_RELATIVE','GROUPID',SERIALNO,'���ſͻ���Group_Info������' from group_member_relative where GROUPID is not null and GROUPID not in (select GROUPID from GROUP_INFO) );
  --���ų�Ա���
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GROUP_MEMBER_RELATIVE','MEMBERCUSTOMERID',SERIALNO,'�����ֶβ���Ϊ��' from group_member_relative where MEMBERCUSTOMERID is null);
  --���ų�Ա��Customer_Info���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GROUP_MEMBER_RELATIVE','MEMBERCUSTOMERID',SERIALNO,'���ų�Ա��Customer_Info������' from group_member_relative where MEMBERCUSTOMERID is not null and MEMBERCUSTOMERID not in (select customerid from customer_info) );
  --��Ա����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GROUP_MEMBER_RELATIVE','MEMBERTYPE',SERIALNO,'�����ֶβ���Ϊ��' from group_member_relative where MEMBERTYPE is null);
  --��Ա������ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GROUP_MEMBER_RELATIVE','MEMBERTYPE',SERIALNO,'��Ա������ֵӳ������' from group_member_relative where MEMBERTYPE is not null and MEMBERTYPE not in (select itemNo from code_library where codeNo='MemberType' and isInUse='1') );
  --��Ա֤������
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GROUP_MEMBER_RELATIVE','MEMBERCERTTYPE',SERIALNO,'�����ֶβ���Ϊ��' from group_member_relative where MEMBERCERTTYPE is null);
  --��Ա֤��������ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GROUP_MEMBER_RELATIVE','MEMBERCERTTYPE',SERIALNO,'��Ա֤��������ֵӳ������' from group_member_relative where MEMBERCERTTYPE is not null and MEMBERCERTTYPE not in (select itemNo from code_library where codeNo='CertType' and isInUse='1') );
  --��Ա֤������
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GROUP_MEMBER_RELATIVE','MEMBERCERTID',SERIALNO,'�����ֶβ���Ϊ��' from group_member_relative where MEMBERCERTID is null);
  --���ſͻ�����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GROUP_MEMBER_RELATIVE','GROUPCUSTOMERTYPE',SERIALNO,'�����ֶβ���Ϊ��' from group_member_relative where GROUPCUSTOMERTYPE is null);
  --���ſͻ�������ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'GROUP_MEMBER_RELATIVE','GROUPCUSTOMERTYPE',SERIALNO,'���ſͻ�������ֵӳ������' from group_member_relative where GROUPCUSTOMERTYPE is not null and GROUPCUSTOMERTYPE not in (select itemNo from code_library where codeNo='CustomerType' and isInUse='1') );

  --��������ҵ�������APPLY_BATCHRELATIVE
  --�����ˮ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO, OBJECTTYPE, RELATIVEBATCHSERIALNO,badReason) (select 'APPLY_BATCHRELATIVE','SERIALNO',SERIALNO, OBJECTTYPE, RELATIVEBATCHSERIALNO,'�����ֶβ���Ϊ��' from apply_batchRelative where SERIALNO is null);
  --�����ˮ��CL_Info���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO, OBJECTTYPE, RELATIVEBATCHSERIALNO,badReason) (select 'APPLY_BATCHRELATIVE','SERIALNO',SERIALNO, OBJECTTYPE, RELATIVEBATCHSERIALNO,'�����ˮ��CL_Info������' from apply_batchRelative where SERIALNO is not null and OBJECTTYPE='CLInfo' and SERIALNO not in (select lineid from cl_info) );
  --���Ž׶�����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO, OBJECTTYPE, RELATIVEBATCHSERIALNO,badReason) (select 'APPLY_BATCHRELATIVE','OBJECTTYPE',SERIALNO, OBJECTTYPE, RELATIVEBATCHSERIALNO,'�����ֶβ���Ϊ��' from apply_batchRelative where OBJECTTYPE is null);
  --���Ž׶�������ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO, OBJECTTYPE, RELATIVEBATCHSERIALNO,badReason) (select 'APPLY_BATCHRELATIVE','OBJECTTYPE',SERIALNO, OBJECTTYPE, RELATIVEBATCHSERIALNO,'���Ž׶�������ֵӳ������' from apply_batchRelative where OBJECTTYPE is not null and OBJECTTYPE not in ('ApproveApply','CLInfo') );
  --����������ˮ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO, OBJECTTYPE, RELATIVEBATCHSERIALNO,badReason) (select 'APPLY_BATCHRELATIVE','RELATIVEBATCHSERIALNO',SERIALNO, OBJECTTYPE, RELATIVEBATCHSERIALNO,'�����ֶβ���Ϊ��' from apply_batchRelative where RELATIVEBATCHSERIALNO is null);
  --��������������ˮ��CL_Info���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO, OBJECTTYPE, RELATIVEBATCHSERIALNO,badReason) (select 'APPLY_BATCHRELATIVE','RELATIVEBATCHSERIALNO',SERIALNO, OBJECTTYPE, RELATIVEBATCHSERIALNO,'��������������ˮ��CL_Info������' from apply_batchRelative where RELATIVEBATCHSERIALNO is not null and OBJECTTYPE='CLInfo' and RELATIVEBATCHSERIALNO not in (select lineid from cl_info) );
  --��������
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO, OBJECTTYPE, RELATIVEBATCHSERIALNO,badReason) (select 'APPLY_BATCHRELATIVE','INTRODUCETYPE',SERIALNO, OBJECTTYPE, RELATIVEBATCHSERIALNO,'�����ֶβ���Ϊ��' from apply_batchRelative where INTRODUCETYPE is null);
  --����������ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO, OBJECTTYPE, RELATIVEBATCHSERIALNO,badReason) (select 'APPLY_BATCHRELATIVE','INTRODUCETYPE',SERIALNO, OBJECTTYPE, RELATIVEBATCHSERIALNO,'����������ֵӳ������' from apply_batchRelative where INTRODUCETYPE is not null and INTRODUCETYPE <> '010' );
  --�Ƿ�ռ���������Ŷ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO, OBJECTTYPE, RELATIVEBATCHSERIALNO,badReason) (select 'APPLY_BATCHRELATIVE','ISOCCUPANCY',SERIALNO, OBJECTTYPE, RELATIVEBATCHSERIALNO,'�����ֶβ���Ϊ��' from apply_batchRelative where ISOCCUPANCY is null);
  --�Ƿ�ռ���������Ŷ����ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO, OBJECTTYPE, RELATIVEBATCHSERIALNO,badReason) (select 'APPLY_BATCHRELATIVE','ISOCCUPANCY',SERIALNO, OBJECTTYPE, RELATIVEBATCHSERIALNO,'�Ƿ�ռ���������Ŷ����ֵӳ������' from apply_batchRelative where ISOCCUPANCY is not null and ISOCCUPANCY not in (select itemNo from code_library where codeNo='YesOrNo' and isInUse='1') );

  --�����Ϣ��BUSINESS_DUEBILL
  --������
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_DUEBILL','BALANCE',SERIALNO,'�����ֶβ���Ϊ��' from business_duebill where BALANCE is null);
  --����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_DUEBILL','BUSINESSCURRENCY',SERIALNO,'�����ֶβ���Ϊ��' from business_duebill where BUSINESSCURRENCY is null);
  --������ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_DUEBILL','BUSINESSCURRENCY',SERIALNO,'������ֵӳ������' from business_duebill where BUSINESSCURRENCY is not null and BUSINESSCURRENCY not in (select itemNo from code_library where codeNo='Currency' and isInUse='1') );
  --��������
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_DUEBILL','BUSINESSRATE',SERIALNO,'�����ֶβ���Ϊ��' from business_duebill where BUSINESSRATE is null);
  --��ݽ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_DUEBILL','BUSINESSSUM',SERIALNO,'�����ֶβ���Ϊ��' from business_duebill where BUSINESSSUM is null);
  --ҵ��Ʒ��
  --insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_DUEBILL','BUSINESSTYPE',SERIALNO,'�����ֶβ���Ϊ��' from business_duebill where BUSINESSTYPE is null and flag3='CDS');
  --ҵ��Ʒ����ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_DUEBILL','BUSINESSTYPE',SERIALNO,'������ֵӳ������' from business_duebill where BUSINESSTYPE is not null and BUSINESSTYPE not in (select typeNo from business_Type where isInUse ='1') );
  --��غ�ͬ��ˮ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_DUEBILL','RELATIVESERIALNO2',SERIALNO,'�����ֶβ���Ϊ��' from business_duebill where RELATIVESERIALNO2 is null);
  --��غ�ͬ��ˮ��BUSINESS_CONTRACT���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_DUEBILL','RELATIVESERIALNO2',SERIALNO,'��غ�ͬ��ˮ��BUSINESS_CONTRACT������' from business_duebill where RELATIVESERIALNO2 is not null and RELATIVESERIALNO2 not in (select serialno from business_contract) );
  --�ͻ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_DUEBILL','CUSTOMERID',SERIALNO,'�����ֶβ���Ϊ��' from business_duebill where CUSTOMERID is null );
  --�жϿͻ������CUSTOMER_INFO���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_DUEBILL','CUSTOMERID',SERIALNO,'�ÿͻ���CUSTOMER_INFO������' from business_duebill where CUSTOMERID is not null and CUSTOMERID not in (select CUSTOMERID from CUSTOMER_INFO) );
  --CIN
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_DUEBILL','MFCUSTOMERID',SERIALNO,'�����ֶβ���Ϊ��' from business_duebill where MFCUSTOMERID is null );
  --�ж�CIN��CUSTOMER_INFO���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_DUEBILL','MFCUSTOMERID',SERIALNO,'�ÿͻ���CIN��CUSTOMER_INFO������' from business_duebill where MFCUSTOMERID is not null and MFCUSTOMERID not in (select MFCUSTOMERID from CUSTOMER_INFO) );
  --�������
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_DUEBILL','OPERATEORGID',SERIALNO,'�����ֶβ���Ϊ��' from business_duebill where OPERATEORGID is null );
  --���������ORG_INFO���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_DUEBILL','OPERATEORGID',SERIALNO,'���������ORG_INFO������' from business_duebill where OPERATEORGID is not null and OPERATEORGID not in (select ORGID from ORG_INFO) );
  --FINISHDATE,BALANCE�ֶ�У��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_DUEBILL','FINISHDATE,BALANCE',SERIALNO,'δ������FINISHDATE����Ϊ��' from business_duebill where BALANCE >0 and FINISHDATE is not null );

  --�軹���¼��BUSINESS_WASTEBOOK
  --��������
  --insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_WASTEBOOK','OCCURDATE',SERIALNO,'�����ֶβ���Ϊ��' from business_wastebook where OCCURDATE is null);
  --���ױ�־
  --insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_WASTEBOOK','TRANSACTIONFLAG',SERIALNO,'�����ֶβ���Ϊ��' from business_wastebook where TRANSACTIONFLAG is null);
  --���ױ�־��ֵУ��
  --insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_WASTEBOOK','TRANSACTIONFLAG',SERIALNO,'���ױ�־��ֵӳ������' from business_wastebook where TRANSACTIONFLAG is not null and TRANSACTIONFLAG not in (select itemNo from code_library where codeNo='TransactionFlag' and isInUse='1') );
  --��������
  --insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_WASTEBOOK','OCCURTYPE',SERIALNO,'�����ֶβ���Ϊ��' from business_wastebook where OCCURTYPE is null);
  --����������ֵУ��
  --insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_WASTEBOOK','OCCURTYPE',SERIALNO,'����������ֵӳ������' from business_wastebook where OCCURTYPE is not null and OCCURTYPE not in (select itemNo from code_library where codeNo='WasteOccurType' and isInUse='1') );
  --���Ž��
  --insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_WASTEBOOK','ACTUALDEBITSUM',SERIALNO,'�����ֶβ���Ϊ��' from business_wastebook where ACTUALDEBITSUM is null);
  --���ս��
  --insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_WASTEBOOK','ACTUALCREDITSUM',SERIALNO,'�����ֶβ���Ϊ��' from business_wastebook where ACTUALCREDITSUM is null);
  --��ؽ�ݺ�
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_WASTEBOOK','RELATIVESERIALNO',SERIALNO,'�����ֶβ���Ϊ��' from business_wastebook where RELATIVESERIALNO is null);
  --��ؽ�ݺ���BUSINESS_DUEBILL���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_WASTEBOOK','RELATIVESERIALNO',SERIALNO,'��ؽ�ݺ���BUSINESS_DUEBILL������' from business_wastebook where RELATIVESERIALNO is not null and RELATIVESERIALNO not in (select serialno from business_duebill));
  --��غ�ͬ��ˮ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_WASTEBOOK','RELATIVECONTRACTNO',SERIALNO,'�����ֶβ���Ϊ��' from business_wastebook where RELATIVECONTRACTNO is null);
  --��غ�ͬ��ˮ����BUSINESS_CONTRACT���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_WASTEBOOK','RELATIVECONTRACTNO',SERIALNO,'��غ�ͬ��ˮ����BUSINESS_CONTRACT������' from business_wastebook where RELATIVECONTRACTNO is not null and RELATIVECONTRACTNO not in (select serialno from business_contract));

  --ҵ���ͬ��BUSINESS_CONTRACT-ҵ���ͬ��
  --�ı���ͬ���
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','RELATIVECONTRACTNO',SERIALNO,'�����ֶβ���Ϊ��' from business_contract where ARTIFICIALNO is null);
  --��ͬ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','CONTRACTTYPE',SERIALNO,'�����ֶβ���Ϊ��' from business_contract where CONTRACTTYPE is null);
  --��ͬ������ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','CONTRACTTYPE',SERIALNO,'��ͬ������ֵӳ������' from business_contract where CONTRACTTYPE is not null and CONTRACTTYPE not in (select itemNo from code_library where codeNo='ContractType2' and isInUse='1') );
  --ҵ�����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','BUSINESSCURRENCY',SERIALNO,'�����ֶβ���Ϊ��' from business_contract where BUSINESSCURRENCY is null);
  --ҵ�������ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','BUSINESSCURRENCY',SERIALNO,'ҵ�������ֵӳ������' from business_contract where BUSINESSCURRENCY is not null and BUSINESSCURRENCY not in (select itemNo from code_library where codeNo='Currency' and isInUse='1') );
  --ҵ��Ʒ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','BUSINESSTYPE',SERIALNO,'�����ֶβ���Ϊ��' from business_contract where BUSINESSTYPE is null);
  --ҵ��Ʒ����ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','BUSINESSTYPE',SERIALNO,'ҵ��Ʒ����ֵӳ������' from business_contract where BUSINESSTYPE is not null and BUSINESSTYPE not in (select typeNo from business_Type where isInUse ='1') );
  --�Ƿ�ѭ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','CREDITCYCLE',SERIALNO,'�����ֶβ���Ϊ��' from business_contract where CREDITCYCLE is null);
  --�Ƿ�ѭ����ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','CREDITCYCLE',SERIALNO,'�Ƿ�ѭ����ֵӳ������' from business_contract where CREDITCYCLE is not null and CREDITCYCLE not in (select itemNo from code_library where codeNo='YesNo' and isInUse='1') );
  --�ͻ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','CUSTOMERID',SERIALNO,'�����ֶβ���Ϊ��' from business_contract where CUSTOMERID is null);
  --�ͻ������Customer_Info���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','CUSTOMERID',SERIALNO,'�ͻ������Customer_Info������' from business_contract where CUSTOMERID is not null and CUSTOMERID not in (select customerid from customer_info) );
   --��ͬ���
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','BUSINESSSUM',SERIALNO,'�����ֶβ���Ϊ��' from business_contract where BUSINESSSUM is null);
  --��ͬ��ʼ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','PUTOUTDATE',SERIALNO,'�����ֶβ���Ϊ��' from business_contract where PUTOUTDATE is null);
  --��ͬ������
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','MATURITY',SERIALNO,'�����ֶβ���Ϊ��' from business_contract where MATURITY is null);
  --��ͬ״̬
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','STATUS',SERIALNO,'�����ֶβ���Ϊ��' from business_contract where STATUS is null);
  --��ͬ״̬��ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','STATUS',SERIALNO,'��ͬ״̬��ֵӳ������' from business_contract where STATUS is not null and STATUS <> 'EFFECTIVE' );
  --��Ҫ������ʽ
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','VOUCHTYPE',SERIALNO,'�����ֶβ���Ϊ��' from business_contract where VOUCHTYPE is null);
  --��Ҫ������ʽ��ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','VOUCHTYPE',SERIALNO,'��Ҫ������ʽ��ֵӳ������' from business_contract where VOUCHTYPE is not null and VOUCHTYPE not in (select itemNo from code_library where codeNo='VOUCHTYPE1' and isInUse='1') );
  --�ܻ��ͻ�����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','MANAGEUSERID',SERIALNO,'�����ֶβ���Ϊ��' from business_contract where MANAGEUSERID is null);
  --�жϹܻ��ͻ�������USER_INFO���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','MANAGEUSERID',SERIALNO,'�ܻ�������USER_INFO������' from business_contract where MANAGEUSERID is not null and MANAGEUSERID not in (select userid from user_info));
  --�ܻ�����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','MANAGEORGID',SERIALNO,'�����ֶβ���Ϊ��' from business_contract where MANAGEORGID is null);
  --�жϹܻ�������ORG_INFO���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','MANAGEUSERID',SERIALNO,'�ܻ�������ORG_INFO������' from business_contract where MANAGEORGID is not null and MANAGEORGID not in (select orgid from org_info));
  --�жϹܻ��ͻ�����͹ܻ������Ƿ�һ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','MANAGEUSERID,MANAGEORGID',bc.SERIALNO,'�ܻ��ͻ�����ͻ�����ƥ��' from business_contract bc where bc.MANAGEUSERID is not null and bc.MANAGEORGID is not null and bc.MANAGEORGID <> (select ui.belongorg from user_info ui where ui.userid=bc.MANAGEUSERID));
  --����������
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','RELATIVESERIALNO',SERIALNO,'�����ֶβ���Ϊ��' from business_contract where RELATIVESERIALNO is null);
  --�жϹ�����������BUSINESS_APPROVE�Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','RELATIVESERIALNO',SERIALNO,'������������BUSINESS_APPROVE������' from business_contract where RELATIVESERIALNO is not null and RELATIVESERIALNO not in (select serialno from business_approve));
  --������ʽ
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','OCCURTYPE',SERIALNO,'�����ֶβ���Ϊ��' from business_contract where OCCURTYPE is null);
  --������ʽ��ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','OCCURTYPE',SERIALNO,'����������ֵӳ������' from business_contract where OCCURTYPE is not null and OCCURTYPE not in (select itemNo from code_library where codeNo='NewOccurType' and isInUse='1') );
  --�鵵����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','PIGEONHOLEDATE',SERIALNO,'�鵵������Ϊ��' from business_contract where PIGEONHOLEDATE is not null);
  --�ݴ��ʶ
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','TEMPSAVEFLAG',SERIALNO,'�ݴ��ʶ��ֵ����' from business_contract where TEMPSAVEFLAG <> '2');
  --�ǼǺ�ͬ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','BOOKINCONTRACTTYPE',SERIALNO,'�����ֶβ���Ϊ��' from business_contract where BOOKINCONTRACTTYPE is null);
  --�ǼǺ�ͬ������ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','BOOKINCONTRACTTYPE',SERIALNO,'��ͬ�Ǽ�������ֵӳ������' from business_contract where BOOKINCONTRACTTYPE is not null and BOOKINCONTRACTTYPE not in ('01','02','03','04'));
  --�ͻ�����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_CONTRACT','CUSTOMERNAME',SERIALNO,'�����ֶβ���Ϊ��' from business_contract where CUSTOMERNAME is null);

  --ѺƷ��Ϣ��GUARANTY_INFO
  --����Ѻ������
  insert into SQ_BAD_DATA(tableName,columnName,GUARANTYID,badReason) (select 'GUARANTY_INFO','GUARANTYTYPE',GUARANTYID,'�����ֶβ���Ϊ��' from guaranty_info where GUARANTYTYPE is null);
  --����Ѻ��������ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,GUARANTYID,badReason) (select 'GUARANTY_INFO','GUARANTYTYPE',GUARANTYID,'����Ѻ��������ֵӳ������' from guaranty_info where GUARANTYTYPE is not null and GUARANTYTYPE not in (select GuarantyType from CMS_COLLATERALDONO_INFO where Status = '01') );
  --������״̬
  insert into SQ_BAD_DATA(tableName,columnName,GUARANTYID,badReason) (select 'GUARANTY_INFO','GUARANTYSTATUS',GUARANTYID,'�����ֶβ���Ϊ��' from guaranty_info where GUARANTYSTATUS is null);
  --������״̬��ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,GUARANTYID,badReason) (select 'GUARANTY_INFO','GUARANTYSTATUS',GUARANTYID,'������״̬��ֵӳ������' from guaranty_info where GUARANTYSTATUS is not null and GUARANTYSTATUS not in (select itemNo from code_library where codeNo='GuarantyStatus' and isInUse='1') );
  --��Ѻ����
  insert into SQ_BAD_DATA(tableName,columnName,GUARANTYID,badReason) (select 'GUARANTY_INFO','GUARANTYCURRENCY',GUARANTYID,'�����ֶβ���Ϊ��' from guaranty_info where GUARANTYCURRENCY is null);
  --��Ѻ������ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,GUARANTYID,badReason) (select 'GUARANTY_INFO','GUARANTYCURRENCY',GUARANTYID,'��Ѻ������ֵӳ������' from guaranty_info where GUARANTYCURRENCY is not null and GUARANTYCURRENCY not in (select itemNo from code_library where codeNo='Currency' and isInUse='1') );
  --�������
  insert into SQ_BAD_DATA(tableName,columnName,GUARANTYID,badReason) (select 'GUARANTY_INFO','EVALCURRENCY',GUARANTYID,'�����ֶβ���Ϊ��' from guaranty_info where EVALCURRENCY is null);
  --���������ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,GUARANTYID,badReason) (select 'GUARANTY_INFO','EVALCURRENCY',GUARANTYID,'���������ֵӳ������' from guaranty_info where EVALCURRENCY is not null and EVALCURRENCY not in (select itemNo from code_library where codeNo='Currency' and isInUse='1') );
  --��Ѻ���
  insert into SQ_BAD_DATA(tableName,columnName,GUARANTYID,badReason) (select 'GUARANTY_INFO','CONFIRMVALUE',GUARANTYID,'�����ֶβ���Ϊ��' from guaranty_info where CONFIRMVALUE is null);
  --������
  insert into SQ_BAD_DATA(tableName,columnName,GUARANTYID,badReason) (select 'GUARANTY_INFO','EVALNETVALUE',GUARANTYID,'�����ֶβ���Ϊ��' from guaranty_info where EVALNETVALUE is null);
  --�Ƿ������Ͽ�ѺƷ
  insert into SQ_BAD_DATA(tableName,columnName,GUARANTYID,badReason) (select 'GUARANTY_INFO','ISOURGUARANTY',GUARANTYID,'�����ֶβ���Ϊ��' from guaranty_info where ISOURGUARANTY is null);
  --�Ƿ������Ͽ�ѺƷ��ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,GUARANTYID,badReason) (select 'GUARANTY_INFO','ISOURGUARANTY',GUARANTYID,'�Ƿ������Ͽ�ѺƷ��ֵӳ������' from guaranty_info where ISOURGUARANTY is not null and ISOURGUARANTY not in (select itemNo from code_library where codeNo='YesNo' and isInUse='1') );
  --�Ƿ���Ч
  insert into SQ_BAD_DATA(tableName,columnName,GUARANTYID,badReason) (select 'GUARANTY_INFO','ISINUSE',GUARANTYID,'�����ֶβ���Ϊ��' from guaranty_info where ISINUSE is null);
  --�Ƿ���Ч��ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,GUARANTYID,badReason) (select 'GUARANTY_INFO','ISINUSE',GUARANTYID,'�Ƿ���Ч��ֵӳ������' from guaranty_info where ISINUSE is not null and ISINUSE not in (select itemNo from code_library where codeNo='InsurerStatus' and isInUse='1') );
  --Ȩ���˱��
  insert into SQ_BAD_DATA(tableName,columnName,GUARANTYID,badReason) (select 'GUARANTY_INFO','OWNERID',GUARANTYID,'�����ֶβ���Ϊ��' from guaranty_info where OWNERID is null);
  --Ȩ������Customer_Info���Ƿ���ڸÿͻ�
  insert into SQ_BAD_DATA(tableName,columnName,GUARANTYID,badReason) (select 'GUARANTY_INFO','OWNERID',GUARANTYID,'Ȩ���˱����Customer_Info������' from guaranty_info where OWNERID is not null and OWNERID not in (select customerid from customer_info) );
  --�ж�Ȩ֤���Ƿ�Ψһ
  insert into SQ_BAD_DATA(tableName,columnName,GUARANTYID,badReason) 
  (select 'GUARANTY_INFO','GUARANTYRIGHTID',GUARANTYID,'ͬһѺƷȨ֤��Ų����ظ�����' from guaranty_info where GUARANTYRIGHTID in (SELECT GUARANTYRIGHTID FROM GUARANTY_INFO
  WHERE GUARANTYRIGHTID IS NOT NULL GROUP BY GUARANTYRIGHTID HAVING COUNT(*)>1) );

  --��֤����Ϣ��MARGIN_INFO
  --�ſ���
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'MARGIN_INFO','OBJECTNO',SERIALNO,'�����ֶβ���Ϊ��' from margin_info where OBJECTNO is null);
  --��ݱ����Business_Duebill���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'MARGIN_INFO','OBJECTNO',SERIALNO,'�ſ�����Business_PutOut������' from margin_info where OBJECTNO is not null and OBJECTNO not in (select serialno from BUSINESS_PUTOUT) );
  --��֤������
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'MARGIN_INFO','CUSTGUARANTYTYPE',SERIALNO,'�����ֶβ���Ϊ��' from margin_info where CUSTGUARANTYTYPE is null);
  --��֤��������ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'MARGIN_INFO','CUSTGUARANTYTYPE',SERIALNO,'��֤��������ֵӳ������' from margin_info where CUSTGUARANTYTYPE is not null and CUSTGUARANTYTYPE not in (select itemNo from code_library where codeNo='MarginType' and isInUse='1') );
  --��֤����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'MARGIN_INFO','EVALNETVALUE',SERIALNO,'�����ֶβ���Ϊ��' from margin_info where EVALNETVALUE is null);
  --��֤�����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'MARGIN_INFO','GUARANTYCURRENCY',SERIALNO,'�����ֶβ���Ϊ��' from margin_info where GUARANTYCURRENCY is null);
  --��֤�������ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'MARGIN_INFO','GUARANTYCURRENCY',SERIALNO,'��֤�������ֵӳ������' from margin_info where GUARANTYCURRENCY is not null and GUARANTYCURRENCY not in (select itemNo from code_library where codeNo='Currency' and isInUse='1') );
  --����ʹ�ý��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'MARGIN_INFO','CONFIRMVALUE',SERIALNO,'�����ֶβ���Ϊ��' from margin_info where CONFIRMVALUE is null);

  --����������BUSINESS_APPROVE
  --��������������ˮ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_APPROVE','RELATIVESERIALNO',SERIALNO,'�����ֶβ���Ϊ��' from BUSINESS_APPROVE where RELATIVESERIALNO is null);
  --�жϹ�������������ˮ����BUSINESS_APPLY���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_APPROVE','RELATIVESERIALNO',SERIALNO,'��������������BUSINESS_APPLY������' from BUSINESS_APPROVE where RELATIVESERIALNO is not null and RELATIVESERIALNO not in (select serialno from business_apply) );
  --ҵ��Ʒ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_APPROVE','BUSINESSTYPE',SERIALNO,'�����ֶβ���Ϊ��' from BUSINESS_APPROVE where BUSINESSTYPE is null);
  --ҵ��Ʒ����ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_APPROVE','BUSINESSTYPE',SERIALNO,'ҵ��Ʒ����ֵӳ������' from BUSINESS_APPROVE where BUSINESSTYPE is not null and BUSINESSTYPE not in (select typeNo from business_type where isinuse='1'));
  --�ͻ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_APPROVE','CUSTOMERID',SERIALNO,'�����ֶβ���Ϊ��' from BUSINESS_APPROVE where CUSTOMERID is null);
  --�жϿͻ������CUSTOMER_INFO���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_APPROVE','CUSTOMERID',SERIALNO,'�����ͻ���CUSTOMER_INFO������' from BUSINESS_APPROVE where CUSTOMERID is not null and CUSTOMERID not in (select CUSTOMERID from CUSTOMER_INFO) );
  --ҵ�����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_APPROVE','BUSINESSCURRENCY',SERIALNO,'�����ֶβ���Ϊ��' from BUSINESS_APPROVE where BUSINESSCURRENCY is null);
  --ҵ�������ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_APPROVE','BUSINESSCURRENCY',SERIALNO,'ҵ��Ʒ����ֵӳ������' from BUSINESS_APPROVE where BUSINESSCURRENCY is not null and BUSINESSCURRENCY not in (select itemNo from code_library where codeno='Currency' and isinuse='1'));
  --������
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_APPROVE','BUSINESSSUM',SERIALNO,'�����ֶβ���Ϊ��' from BUSINESS_APPROVE where BUSINESSSUM is null);
  --���ڽ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_APPROVE','EXPOSURESUM',SERIALNO,'�����ֶβ���Ϊ��' from BUSINESS_APPROVE where EXPOSURESUM is null);
  --�ͻ�����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_APPROVE','CUSTOMERNAME',SERIALNO,'�����ֶβ���Ϊ��' from BUSINESS_APPROVE where CUSTOMERNAME is null);

  --ռ���¼��CL_OCCUPY
  --ҵ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_OCCUPY','OBJECTNO',SERIALNO,'�����ֶβ���Ϊ��' from CL_OCCUPY where OBJECTNO is null);
  --�ж�Business_Contract���Ƿ���ڸú�ͬ,ObjectType:BusinessContract
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_OCCUPY','OBJECTNO',SERIALNO,'ҵ���ͬ��BUSINESS_CONTRACT������' from CL_OCCUPY where OBJECTNO is not null and OBJECTTYPE='BusinessContract' AND OBJECTNO NOT IN (select SERIALNO from BUSINESS_CONTRACT));
  --������ȱ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_OCCUPY','RELATIVESERIALNO',SERIALNO,'�����ֶβ���Ϊ��' from CL_OCCUPY where RELATIVESERIALNO is null);
  --�ж϶�ȱ����CL_INFO���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_OCCUPY','RELATIVESERIALNO',SERIALNO,'�����CL_INFO������' from CL_OCCUPY where RELATIVESERIALNO is not null and RELATIVESERIALNO not in (select lineid from cl_info));
  --���� ObjectType:PutOutApply
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_OCCUPY','CURRENCY',SERIALNO,'�����ֶβ���Ϊ��' from CL_OCCUPY where CURRENCY is null and OBJECTTYPE='PutOutApply');
  --������ֵУ�� ObjectType:PutOutApply
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_OCCUPY','CURRENCY',SERIALNO,'������ֵӳ������' from CL_OCCUPY where CURRENCY is not null and OBJECTTYPE='PutOutApply' and CURRENCY not in (select itemNo from code_library where codeno='Currency' and isinuse='1'));
  --ռ�������� ObjectType:PutOutApply
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_OCCUPY','BUSINESSSUM',SERIALNO,'�����ֶβ���Ϊ��' from CL_OCCUPY where BUSINESSSUM is null and OBJECTTYPE='PutOutApply');
  --ռ�ó��ڽ�� ObjectType:PutOutApply
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'CL_OCCUPY','EXPOSURESUM',SERIALNO,'�����ֶβ���Ϊ��' from CL_OCCUPY where EXPOSURESUM is null and OBJECTTYPE='PutOutApply');
  --��ͬ���ȹ�����ϵ
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) ( select 'CL_OCCUPY,BUSINESS_CONTRACT','CL_OCCUPY.OBJECTNO,CL_OCCUPY.RELATIVESERIALNO',SERIALNO,'�ú�ͬδ��CL_OCCUPY������ͬ���ȹ�����ϵ' from business_contract bc where bc.businesstype not in ('3010','31')
  and bc.serialno not in (select co.objectno from cl_occupy co where co.objecttype='BusinessContract'));

  --��Ա����ϢBusiness_BankProvider_Member
  --��Ա�д���
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_BANKPROVIDER_MEMBER','PROVIDERNO',SERIALNO,'�����ֶβ���Ϊ��' from Business_BankProvider_Member where PROVIDERNO is null);
  --��Ա�н�ɫ
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_BANKPROVIDER_MEMBER','PROVIDERROLE',SERIALNO,'�����ֶβ���Ϊ��' from Business_BankProvider_Member where PROVIDERROLE is null);
  --��Ա�н�ɫ��ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_BANKPROVIDER_MEMBER','PROVIDERROLE',SERIALNO,'��Ա�н�ɫ��ֵӳ������' from Business_BankProvider_Member where PROVIDERROLE is not null and PROVIDERROLE not in (select itemNo from code_library where codeNo='BankRole' and isInUse='1'));
  --ǣͷ��ֻ����һ�ң�01��03��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) 
  (select 'BUSINESS_BANKPROVIDER_MEMBER','',SERIALNO,'ͬһ��ҵ����ǣͷ��ֻ�������һ��' from Business_BankProvider_Member where PROVIDERNO is not null 
  and providerrole||objectno||objecttype in( select bbm.providerrole||bbm.objectno||bbm.objecttype from business_bankprovider_member bbm 
  where bbm.providerrole in ('01','03')
  group by bbm.providerrole,bbm.objectno,bbm.objecttype having count(*)>1));
  --�����ܶ�
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_BANKPROVIDER_MEMBER','TOTALSUM',SERIALNO,'�����ֶβ���Ϊ��' from Business_BankProvider_Member where TOTALSUM is null);
  --�д������
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_BANKPROVIDER_MEMBER','LOANRATIO',SERIALNO,'�����ֶβ���Ϊ��' from Business_BankProvider_Member where LOANRATIO is null);
  --��Ա�пͻ�����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_BANKPROVIDER_MEMBER','PROVIDERUSERID',SERIALNO,'�����ֶβ���Ϊ��' from Business_BankProvider_Member where PROVIDERUSERID is null);
  --��Ա�пͻ������Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_BANKPROVIDER_MEMBER','PROVIDERUSERID',SERIALNO,'��Ա�пͻ�������USER_INFO������' from Business_BankProvider_Member where PROVIDERUSERID is not null and not exists (select 1 from user_info where userid=PROVIDERUSERID));
  --ҵ��Ʒ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_BANKPROVIDER_MEMBER','BUSINESSTYPE',SERIALNO,'�����ֶβ���Ϊ��' from Business_BankProvider_Member where BUSINESSTYPE is null);
  --ҵ��Ʒ����ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_BANKPROVIDER_MEMBER','BUSINESSTYPE',SERIALNO,'ҵ��Ʒ����ֵӳ������' from Business_BankProvider_Member where BUSINESSTYPE is not null and BUSINESSTYPE not in (select typeNo from BUSINESS_TYPE where isInUse='1'));
  --���н��б�־
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_BANKPROVIDER_MEMBER','ERRCNBANKFLG',SERIALNO,'�����ֶβ���Ϊ��' from Business_BankProvider_Member where ERRCNBANKFLG is null);
  --���н��б�־��ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_BANKPROVIDER_MEMBER','ERRCNBANKFLG',SERIALNO,'���н��б�־��ֵӳ������' from Business_BankProvider_Member where ERRCNBANKFLG is not null and ERRCNBANKFLG not in (select itemNo from code_library where codeNo='NewYesNo' and isInUse='1'));
  --�����˻�����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_BANKPROVIDER_MEMBER','STLMNACCTTYPE',SERIALNO,'�����ֶβ���Ϊ��' from Business_BankProvider_Member where STLMNACCTTYPE is null);
  --�����˻�������ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_BANKPROVIDER_MEMBER','STLMNACCTTYPE',SERIALNO,'�����˻�������ֵӳ������' from Business_BankProvider_Member where STLMNACCTTYPE is not null and STLMNACCTTYPE not in (select itemNo from code_library where codeNo='SettleAccountType' and isInUse='1'));
  --�����˻�
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_BANKPROVIDER_MEMBER','STLMNACCTNO',SERIALNO,'�����ֶβ���Ϊ��' from Business_BankProvider_Member where STLMNACCTNO is null);
  --��������
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_BANKPROVIDER_MEMBER','OBJECTTYPE',SERIALNO,'�����ֶβ���Ϊ��' from Business_BankProvider_Member where OBJECTTYPE is null);
  --����������ֵ
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_BANKPROVIDER_MEMBER','OBJECTTYPE',SERIALNO,'����������ֵӳ������' from Business_BankProvider_Member where OBJECTTYPE is not null and OBJECTTYPE not in ('CreditApply','ApproveApply','BusinessContract'));
  --������
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_BANKPROVIDER_MEMBER','OBJECTNO',SERIALNO,'�����ֶβ���Ϊ��' from Business_BankProvider_Member where OBJECTNO is null);
  --OBJECTTYPE��CreditApply,�ж�Business_Apply���Ƿ���ڸñ�����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_BANKPROVIDER_MEMBER','OBJECTNO',bbm.SERIALNO,'��������������BUSINESS_APPLY������' from Business_BankProvider_Member bbm where bbm.OBJECTNO is not null and bbm.OBJECTTYPE='CreditApply' and not exists (select 1 from BUSINESS_APPLY WHERE SERIALNO=bbm.OBJECTNO));
  --OBJECTTYPE��ApproveApply,�ж�Business_Approve���Ƿ���ڸñ�����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_BANKPROVIDER_MEMBER','OBJECTNO',bbm.SERIALNO,'���������������BUSINESS_APPROVE������' from Business_BankProvider_Member bbm where bbm.OBJECTNO is not null and bbm.OBJECTTYPE='ApproveApply' and not exists (select 1 from BUSINESS_APPROVE WHERE SERIALNO=bbm.OBJECTNO));
  --OBJECTTYPE��BusinessContract,�ж�Business_Contract���Ƿ���ڸñ�����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_BANKPROVIDER_MEMBER','OBJECTNO',bbm.SERIALNO,'�ú�ͬ�����BUSINESS_CONTRACT������' from Business_BankProvider_Member bbm where bbm.OBJECTNO is not null and bbm.OBJECTTYPE='BusinessContract' and not exists (select 1 from BUSINESS_CONTRACT WHERE SERIALNO=bbm.OBJECTNO));

  --������Ϣ��Business_PutOut
  --ռ���ʶ
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_PUTOUT','DEALFLAG',SERIALNO,'�����ֶβ���Ϊ��' from BUSINESS_PUTOUT where DEALFLAG is null);
  --ռ���ʶ��ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_PUTOUT','DEALFLAG',SERIALNO,'ռ���ʶ��ֵӳ������' from BUSINESS_PUTOUT where DEALFLAG is not null and DEALFLAG <> '1');
  --����״̬
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_PUTOUT','EXCHANGESTATE',SERIALNO,'�����ֶβ���Ϊ��' from BUSINESS_PUTOUT where EXCHANGESTATE is null);
  --����״̬��ֵУ��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO,badReason) (select 'BUSINESS_PUTOUT','EXCHANGESTATE',SERIALNO,'����״̬��ֵӳ������' from BUSINESS_PUTOUT where EXCHANGESTATE is not null and EXCHANGESTATE <> '000000');

  --Ʊ����Ϣ��BILL_INFO
  --���˱��
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO, OBJECTTYPE, OBJECTNO,badReason) (select 'BILL_INFO','OBJECTNO',SERIALNO, OBJECTTYPE, OBJECTNO,'�����ֶβ���Ϊ��' from BILL_INFO where OBJECTNO is null);
  --���˱����BUSINESS_PUTOUT���Ƿ����
  insert into SQ_BAD_DATA(tableName,columnName,SERIALNO, OBJECTTYPE, OBJECTNO,badReason) (select 'BILL_INFO','OBJECTNO',SERIALNO, OBJECTTYPE, OBJECTNO,'���˱����BUSINESS_PUTOUT������' from BILL_INFO where OBJECTNO is not null and OBJECTNO not in (select serialno from business_putout) );

  commit;
end sq_auto_checkout;
/
