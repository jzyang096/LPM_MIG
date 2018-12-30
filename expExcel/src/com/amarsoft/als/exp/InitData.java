package com.amarsoft.als.exp;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.amarsoft.are.ARE;

public class InitData {
	
	//0.�����Լ죬�����˶�
	public void dataCheck(){
		//1.��ʼ���м��
		truncateTable();
		initData();
		//2.�����Լ�,�ܼ�¼���Լ�
		autoDataCheck();
		//3.��ȼ��
		checkZHCLInfo();//�ۺ����Ŷ�Ȼ���У��
		checkCLDivideInfo();//���������зֻ���У��
		checkTYCLInfo();//ͬҵ��Ȼ���У��
		updateExpFlag();
//		checkCLOccupy();//ռ��У��
//		checkDueBillInfo();//jzyang
//		checkPLCLInfo();//jzyang
	}
	
	//1.��ʼ���м������-�������
	public void truncateTable(){
		DBUtil DBUtil=new DBUtil();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn=DBUtil.getConnection();
		try {
			pstmt=conn.prepareStatement(" truncate table SQ_CL_ERROR ");
			pstmt.execute();
			ARE.getLog().debug("SQ_CL_ERROR���ʼ������-����ɹ�!");
		} catch (SQLException e) {
			ARE.getLog().error("SQ_CL_ERROR���ʼ������-����쳣!");
			e.printStackTrace();
		} finally {
			DBUtil.closePreparedStatement(pstmt);
		}
		try {
			pstmt=conn.prepareStatement(" truncate table CL_OCCUPY_ERROR ");
			ARE.getLog().debug("CL_OCCUPY_ERROR���ʼ������-����ɹ�!");
		} catch (SQLException e) {
			ARE.getLog().error("CL_OCCUPY_ERROR���ʼ������-����쳣!");
			e.printStackTrace();
		} finally {
			DBUtil.closePreparedStatement(pstmt);
		}
		try {
			pstmt=conn.prepareStatement(" truncate table SQ_BAD_DATA ");
			pstmt.execute();
			ARE.getLog().debug("SQ_BAD_DATA���ʼ������-����ɹ�!");
		} catch (SQLException e) {
			ARE.getLog().error("SQ_BAD_DATA���ʼ������-����쳣!");
			e.printStackTrace();
		} finally {
			DBUtil.closePreparedStatement(pstmt);
		}
		try {
			pstmt=conn.prepareStatement(" truncate table CL_INFO_MIG_BASE ");
			pstmt.execute();
			ARE.getLog().debug("CL_INFO_MIG_BASE���ʼ������-����ɹ�!");
		} catch (SQLException e) {
			ARE.getLog().error("CL_INFO_MIG_BASE���ʼ������-����쳣!");
			e.printStackTrace();
		} finally {
			DBUtil.closePreparedStatement(pstmt);
		}
		
		DBUtil.cleanResource(conn, pstmt, rs);//�ر���Դ
	}

	//2.��ʼ���˶��м������
	public void initData(){
		String sSql="";
		DBUtil DBUtil=new DBUtil();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn=DBUtil.getConnection();
		//1.��ʼ��SQ_CL_ERROR-�������Ŷ����Ϣ
		sSql=" insert into SQ_CL_ERROR (LineID, CLTypeID, BusinessType, Currency, BusinessSum, EXPOSURESUM,CalCurrency,CHECKMODE) "+
			 " select LineID, CLTypeID, BusinessType, Currency, LineSum1, LineSum2 ,Currency,'2' from CL_INFO where CLTypeID = '010' and Status='1' ";
		try {
			pstmt=conn.prepareStatement(sSql);
			pstmt.execute();
			ARE.getLog().debug("��ʼ������-SQ_CL_ERROR��-�������Ŷ����Ϣ-��ʼ���ɹ�!");
		} catch (SQLException e) {
			ARE.getLog().error("��ʼ������-SQ_CL_ERROR��-�������Ŷ����Ϣ-��ʼ��ʧ��!");
			e.printStackTrace();
		} finally {
			DBUtil.closePreparedStatement(pstmt);
		}
		//2.��ʼ��SQ_CL_ERROR-�ۺ����Ŷ����Ϣ
		sSql=" insert into SQ_CL_ERROR (LineID, CLTypeID, BusinessType, Currency, BusinessSum, EXPOSURESUM,CalCurrency,CHECKMODE) "+
			 " select LineID, CLTypeID, BusinessType, Currency, LineSum1, LineSum2 ,Currency,'1' from CL_INFO where CLTypeID = '060' and Status='1' ";
		try {
			pstmt=conn.prepareStatement(sSql);
			pstmt.execute();
			ARE.getLog().debug("��ʼ������-SQ_CL_ERROR��-�����ۺ����Ŷ����Ϣ-��ʼ���ɹ�!");
		} catch (SQLException e) {
			ARE.getLog().error("��ʼ������-SQ_CL_ERROR��-�����ۺ����Ŷ����Ϣ-��ʼ��ʧ��!");
			e.printStackTrace();
		} finally {
			DBUtil.closePreparedStatement(pstmt);
		}
		//3.��ʼ��SQ_CL_ERROR-ͬҵ�����Ϣ
		sSql=" insert into SQ_CL_ERROR (LineID, CLTypeID, BusinessType, Currency, BusinessSum, EXPOSURESUM,CalCurrency,CHECKMODE) "+
			 " select LineID, CLTypeID, BusinessType, Currency, LineSum1, LineSum2 ,Currency,'3' from CL_INFO where CLTypeID = '080' and Status='1' ";
		try {
			pstmt=conn.prepareStatement(sSql);
			pstmt.execute();
			ARE.getLog().debug("��ʼ������-SQ_CL_ERROR��-ͬҵ�����Ϣ-��ʼ���ɹ�!");
		} catch (SQLException e) {
			ARE.getLog().error("��ʼ������-SQ_CL_ERROR��-ͬҵ�����Ϣ-��ʼ��ʧ��!");
			e.printStackTrace();
		} finally {
			DBUtil.closePreparedStatement(pstmt);
		}
		
		//4.����������ϸ��-�������ų�ʼ��
		sSql=" insert into CL_INFO_MIG_BASE(LineID,MFCustomerID,Currency,Linesum1,Linesum2,ParentLineID,SortNo) "+
			 " select ci.LineID,t.MFCustomerID,ci.Currency,ci.Linesum1,ci.Linesum2,'',ci.LineID from CL_INFO ci,Customer_Info t where ci.CustomerID=t.CustomerID and ci.CLTypeID='010' ";
		try {
			pstmt=conn.prepareStatement(sSql);
			pstmt.execute();
			ARE.getLog().debug("��ʼ������-CL_INFO_MIG_BASE��-ҵ��˶�-�������Ŷ�ȳ�ʼ���ɹ�!");
		} catch (SQLException e) {
			ARE.getLog().error("��ʼ������-CL_INFO_MIG_BASE��-ҵ��˶�-�������Ŷ�ȳ�ʼ��ʧ��!");
			e.printStackTrace();
		} finally {
			DBUtil.closePreparedStatement(pstmt);
		}
		
		//5.����������ϸ��-���������з�ϸ���ʼ��
		sSql=" insert into CL_INFO_MIG_BASE(divideSerialno,MFCustomerID,BusinessType,DivideCurrency,BusinessSum,ExposureSum,ParentLineID,SortNo) "+
			 " select cd.SerialNo,t.MFCustomerID,cd.DivideCode,cd.Currency,cd.BusinessSum,cd.ExposureSum,cd.ObjectNo,cd.ObjectNo "+
			 " from CL_INFO ci,CL_DIVIDE cd,CUSTOMER_INFO t where ci.LineID=cd.ObjectNo and cd.ObjectType='CLInfo' "+
			 " and ci.CLTypeID='010' and ci.CustomerID=t.CustomerID ";
		try {
			pstmt=conn.prepareStatement(sSql);
			pstmt.execute();
			ARE.getLog().debug("��ʼ������-CL_INFO_MIG_BASE��-ҵ��˶�-���������з�ϸ���ʼ���ɹ�!");
		} catch (SQLException e) {
			ARE.getLog().error("��ʼ������-CL_INFO_MIG_BASE��-ҵ��˶�-���������з�ϸ���ʼ��ʧ��!");
			e.printStackTrace();
		} finally {
			DBUtil.closePreparedStatement(pstmt);
		}
		
		DBUtil.cleanResource(conn, pstmt, rs);//�ر���Դ
	}
	
	//3.���������Լ�洢����
	public void autoDataCheck(){
		DBUtil DBUtil=new DBUtil();
		Connection conn = null;
		CallableStatement cstmt =null;
		conn=DBUtil.getConnection();
		try {
			cstmt =conn.prepareCall(" {call SQ_Auto_CheckOut()} ");
			cstmt.execute();
			ARE.getLog().debug("��ʼ������-�����Լ�-SQ_BAD_DATA��ʼ���ɹ�!");
		} catch (SQLException e) {
			ARE.getLog().error("��ʼ������-�����Լ�-SQ_BAD_DATA��ʼ��ʧ��!");
			e.printStackTrace();
		}
		try {
			cstmt =conn.prepareCall(" {call SQ_CHECK_TABLEROW()} ");
			cstmt.execute();
			ARE.getLog().debug("��ʼ������-�ܼ�¼���Լ�-SQ_TABLE_ROW��ʼ���ɹ�!");
		} catch (SQLException e) {
			ARE.getLog().error("��ʼ������-�ܼ�¼���Լ�-SQ_TABLE_ROW��ʼ��ʧ��!");
			e.printStackTrace();
		}
		DBUtil.closeCallableStatement(cstmt);
		DBUtil.closeConnection(conn);
	}
	
	//4.�ۺ����Ŷ��У��
	public void checkZHCLInfo(){
		String sSql="";
		String sLineID="";
		String sCurrency="";
		String sValue="";
		String sCalLineID="";
		String sCalCurrency="";
		String sObject="";
		double dCalBusinessSum=0.0;
		double dCalExposureSum=0.0;
		DBUtil DBUtil=new DBUtil();
		CLManager clm = new CLManager();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn=DBUtil.getConnection();
		ArrayList<String> CLlist = new ArrayList<String>();
		sSql=" select lineID,Currency from SQ_CL_ERROR where CLTypeID='060' order by lineID ";
		try {
			pstmt=conn.prepareStatement(sSql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				sLineID=rs.getString("lineID");
				if(sLineID==null) sLineID="";
				sCurrency=rs.getString("Currency");
				if(sCurrency==null) sCurrency="";
				sObject=sLineID+"@"+sCurrency;
				CLlist.add(sObject);
			}
			DBUtil.closeResultSet(rs);
			DBUtil.closePreparedStatement(pstmt);
			String[] sArray=null;
			for(int i=0;i<CLlist.size();i++){
				sValue=CLlist.get(i);
				sArray=sValue.split("@");
				sCalLineID=sArray[0];
				sCalCurrency=sArray[1];
				dCalBusinessSum=clm.getZHBusinessSum(sCalLineID, sCalCurrency);
				dCalExposureSum=clm.getZHExposureSum(sCalLineID, sCalCurrency);
				clm.updateCalBusinessSum(sCalLineID, dCalBusinessSum);
				clm.updateCalExposureSum(sCalLineID, dCalExposureSum);
			}
			ARE.getLog().debug("��ʼ������-�ۺ����Ŷ��У��ɹ�!");
		} catch (SQLException e) {
			ARE.getLog().error("��ʼ������-�ۺ����Ŷ��У��ʧ��!");
			e.printStackTrace();
		} finally {
			DBUtil.cleanResource(conn, pstmt, rs);//�ر���Դ
		}
	}
	
	//5.���������зֶ��У��
	public void checkCLDivideInfo(){
		String sSql="";
		String sLineID="";
		String sCurrency="";
		String sValue="";
		String sCalLineID="";
		String sCalCurrency="";
		double dCalBusinessSum=0.0;
		double dCalExposureSum=0.0;
		DBUtil DBUtil=new DBUtil();
		CLManager clm = new CLManager();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn=DBUtil.getConnection();
		ArrayList<String> CLlist = new ArrayList<String>();
		String sObject="";
		sSql=" select lineID,Currency from SQ_CL_ERROR where CLTypeID='010' order by lineID ";
		try {
			pstmt=conn.prepareStatement(sSql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				sLineID=rs.getString("lineID");
				if(sLineID==null) sLineID="";
				sCurrency=rs.getString("Currency");
				if(sCurrency==null) sCurrency="";
				sObject=sLineID+"@"+sCurrency;
				CLlist.add(sObject);
			}
			DBUtil.closeResultSet(rs);
			DBUtil.closePreparedStatement(pstmt);
			
			String[] sArray=null;
			for(int i=0;i<CLlist.size();i++){
				sValue=CLlist.get(i);
				sArray=sValue.split("@");
				sCalLineID=sArray[0];
				sCalCurrency=sArray[1];
				dCalBusinessSum=clm.getDivideBusinessSum(sCalLineID, sCalCurrency);
				dCalExposureSum=clm.getDivideExposureSum(sCalLineID, sCalCurrency);
				clm.updateCalBusinessSum(sCalLineID, dCalBusinessSum);
				clm.updateCalExposureSum(sCalLineID, dCalExposureSum);
			}
			ARE.getLog().debug("��ʼ������-���������зֶ��У��ɹ�!");
		} catch (SQLException e) {
			ARE.getLog().error("��ʼ������-���������зֶ��У��ʧ��!");
			e.printStackTrace();
		} finally {
			DBUtil.cleanResource(conn, pstmt, rs);//�ر���Դ
		}
	}
	
	//6.ͬҵ���У��
	public void checkTYCLInfo(){
		String sSql="";
		String sLineID="";
		String sCurrency="";
		String sValue="";
		String sCalLineID="";
		String sCalCurrency="";
		double dCalBusinessSum=0.0;
		double dCalExposureSum=0.0;
		DBUtil DBUtil=new DBUtil();
		CLManager clm = new CLManager();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn=DBUtil.getConnection();
		ArrayList<String> CLlist = new ArrayList<String>();
		String sObject="";
		sSql=" select lineID,Currency from SQ_CL_ERROR where CLTypeID='080' order by lineID ";
		try {
			pstmt=conn.prepareStatement(sSql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				sLineID=rs.getString("lineID");
				if(sLineID==null) sLineID="";
				sCurrency=rs.getString("Currency");
				if(sCurrency==null) sCurrency="";
				sObject=sLineID+"@"+sCurrency;
				CLlist.add(sObject);
			}
			DBUtil.closeResultSet(rs);
			DBUtil.closePreparedStatement(pstmt);
			
			String[] sArray=null;
			for(int i=0;i<CLlist.size();i++){
				sValue=CLlist.get(i);
				sArray=sValue.split("@");
				sCalLineID=sArray[0];
				sCalCurrency=sArray[1];
				dCalBusinessSum=clm.getTYBusinessSum(sCalLineID, sCalCurrency);
				dCalExposureSum=clm.getTYExposureSum(sCalLineID, sCalCurrency);
				clm.updateCalBusinessSum(sCalLineID, dCalBusinessSum);
				clm.updateCalExposureSum(sCalLineID, dCalExposureSum);
			}
			ARE.getLog().debug("��ʼ������-ͬҵ���У��ɹ�!");
		} catch (SQLException e) {
			ARE.getLog().error("��ʼ������-ͬҵ���У��ʧ��!");
			e.printStackTrace();
		} finally {
			DBUtil.cleanResource(conn, pstmt, rs);//�ر���Դ
		}
	}
	
	//����SQ_CL_ERROR���쳣��ʶ
	public void updateExpFlag(){
		String sSql="";
		DBUtil DBUtil=new DBUtil();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn=DBUtil.getConnection();
		//��������ʱ�������쳣��ʶ
		sSql=" update SQ_CL_ERROR set ExpFlag='2' where BusinessSum is not null and ExposureSum is not null "+
			 " and CalBusinessSum is not null and CalExposureSum is not null and BusinessSum=CalBusinessSum "+
			 " and ExposureSum=CalExposureSum ";
		try {
			pstmt=conn.prepareStatement(sSql);
			pstmt.execute();
			ARE.getLog().debug("��ʼ������-����SQ_CL_ERROR��������ʶ�ɹ�!");
			pstmt.close();
		} catch (Exception e) {
			ARE.getLog().error("��ʼ������-����SQ_CL_ERROR��������ʶʧ��!");
			e.printStackTrace();
		}
		//�����쳣ʱ�������쳣��ʶ
		sSql=" update SQ_CL_ERROR set ExpFlag='1' where BusinessSum is not null and ExposureSum is not null "+
			 " and CalBusinessSum is not null and CalExposureSum is not null and (BusinessSum<>CalBusinessSum "+
			 " or ExposureSum<>CalExposureSum) ";
		try {
			pstmt=conn.prepareStatement(sSql);
			pstmt.execute();
			ARE.getLog().debug("��ʼ������-����SQ_CL_ERROR���쳣��ʶ�ɹ�!");
			pstmt.close();
		} catch (Exception e) {
			ARE.getLog().error("��ʼ������-����SQ_CL_ERROR���쳣��ʶʧ��!");
			e.printStackTrace();
		} finally {
			DBUtil.cleanResource(conn, pstmt, rs);//�ر���Դ
		}
	}
	
	//7.������Ա���Ŷ��У��
	public void checkPLCLInfo(){
		String sSql="";
		String sLineID="";
		String sCurrency="";
		double dLineSum1=0.0;
		double dLineSum2=0.0;
		DBUtil DBUtil=new DBUtil();
		CLManager clm = new CLManager();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn=DBUtil.getConnection();
		ArrayList<String> ls = new ArrayList<String>();
		ArrayList<String> lsLineID = new ArrayList<String>();
		ArrayList<String> lsCurrency = new ArrayList<String>();
		sSql=" select lineID,Currency,LineSum1,LineSum2 from CL_INFO_Mig where lineID in "
		   + "(select distinct RelativeBatchSerialno from APPLY_BATCHRELATIVE_Mig where IsOccupancy='01' and ObjectType='CLInfo')";
		try {
			pstmt=conn.prepareStatement(sSql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				sLineID=rs.getString("lineID");
				if(sLineID==null) sLineID="";
				lsLineID.add(sLineID);
				sCurrency=rs.getString("Currency");
				if(sCurrency==null) sCurrency="";
				lsCurrency.add(sCurrency);
//				dLineSum1=rs.getDouble("LineSum1");
//				dLineSum2=rs.getDouble("LineSum2");
//				if((dLineSum1 != clm.getPLOccupyBusinessSum(sLineID, sCurrency)) || 
//					(dLineSum2 != clm.getPLOccupyExposureSum(sLineID, sCurrency))
//					){
//					ls.add(sLineID);
//				}
			}
			for(int a=0;a<lsLineID.size();a++){
				if((dLineSum1 != clm.getPLOccupyBusinessSum(lsLineID.get(a), lsCurrency.get(a))) || 
					(dLineSum2 != clm.getPLOccupyExposureSum(lsLineID.get(a), lsCurrency.get(a)))
					){
					ls.add(sLineID);
				}
			}
			
			
		} catch (SQLException e) {
			ARE.getLog().error("��ʼ������-������Ա���Ŷ��У��ʧ��!");
			e.printStackTrace();
			DBUtil.cleanResource(conn, pstmt, rs);
			return;
		}
		if(ls.size()==0) {//�����쳣���ݣ���ִ��insert���
			ARE.getLog().debug("��ʼ������-������Ա���Ŷ��У���ʼ���ɹ�!");
			DBUtil.cleanResource(conn, pstmt, rs);
			return;
		}
		//��ʼ�����ռ���쳣��
		sSql=" insert into CL_OCCUPY_ERROR (SerialNo,ObjectNo,RelativeSerialno,Currency,BusinessSum,ExposureSum,Flag,sourceSysNo ) "+
				" (select SerialNo,ObjectNo,RelativeSerialno,Currency,BusinessSum,ExposureSum,'3',sourceSysNo from CL_OCCUPY_Mig where RelativeSerialno=?) ";
		for(int i=0;i<ls.size();i++){
			try {
				pstmt=conn.prepareStatement(sSql);
				pstmt.setString(1, ls.get(i));
				pstmt.execute();
				if(i==ls.size()-1){
					ARE.getLog().debug("��ʼ������-������Ա���Ŷ��У���ʼ���ɹ�!");
				}
			} catch (SQLException e) {
				ARE.getLog().error("��ʼ������-������Ա���Ŷ��У���ʼ��ʧ��!");
				e.printStackTrace();
			}
		}
		DBUtil.cleanResource(conn, pstmt, rs);//�ر���Դ
	}
	
	//8.���ռ�ý��У��-ռ���
	public void checkCLOccupy(){
		String sSql="";
		String sLineID="";
		String sCLTypeID="";
		String sCurrency="";
		double dUsedBusinessSum=0.0;//����������
		double dUsedExposureSum=0.0;//���ó��ڽ��
		DBUtil DBUtil=new DBUtil();
		CLManager clm = new CLManager();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn=DBUtil.getConnection();
		ArrayList<String> ls = new ArrayList<String>();
		
		sSql=" select LineID,CLTypeID,Currency,UsedBusinessSum,UsedExposureSum from CL_Info_Mig where UsedBusinessSum is not null and UsedExposureSum is not null and status='1' ";
		try {
			pstmt=conn.prepareStatement(sSql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				sLineID=rs.getString("LineID");
				if(sLineID==null) sLineID="";
				sCLTypeID=rs.getString("CLTypeID");
				if(sCLTypeID==null) sCLTypeID="";
				sCurrency=rs.getString("Currency");
				if(sCurrency==null) sCurrency="";
				dUsedBusinessSum=rs.getDouble("UsedBusinessSum");
				dUsedExposureSum=rs.getDouble("UsedExposureSum");
				if(dUsedBusinessSum != clm.getCLOccupyBusinessSum(sLineID, sCLTypeID, sCurrency)
					|| dUsedExposureSum !=clm.getCLOccupyExposureSum(sLineID, sCLTypeID, sCurrency)){
					ls.add(sLineID);
				}
			}
		} catch (SQLException e) {
			ARE.getLog().error("��ʼ������-���ռ�ý��У��ʧ��!");
			DBUtil.cleanResource(conn, pstmt, rs);//�ر���Դ
			e.printStackTrace();
			return;
		}
		if(ls.size()==0) {//�����쳣���ݣ���ִ��insert���
			ARE.getLog().debug("��ʼ������-���ռ�ý��У���ʼ���ɹ�!");
			DBUtil.cleanResource(conn, pstmt, rs);//�ر���Դ
			return;
		}
		//��ʼ�����ռ���쳣��
		sSql=" insert into CL_OCCUPY_ERROR (SerialNo,ObjectNo,RelativeSerialno,Currency,BusinessSum,ExposureSum,Flag,sourceSysNo ) "+
				" (select SerialNo,ObjectNo,RelativeSerialno,Currency,BusinessSum,ExposureSum,'1',sourceSysNo from CL_OCCUPY_Mig where RelativeSerialno=?) ";
		for(int i=0;i<ls.size();i++){
			try {
				pstmt=conn.prepareStatement(sSql);
				pstmt.setString(1, ls.get(i));
				pstmt.execute();
				pstmt.close();
				if(i==ls.size()-1){
					ARE.getLog().debug("��ʼ������-���ռ�ý��У���ʼ���ɹ�!");
				}
				DBUtil.closePreparedStatement(pstmt);//jzyang
			} catch (SQLException e) {
				ARE.getLog().error("��ʼ������-���ռ�ý��У���ʼ��ʧ��!");
				e.printStackTrace();
			}
		}
		DBUtil.cleanResource(conn, pstmt, rs);//�ر���Դ
	}
	
	//9.���ռ��-��ݽ��У��-��ݲ�
	public void checkDueBillInfo(){
		String sSql="";
		String sLineID="";
		String sSerialNo="";
		String sCurrency="";
		double dBusinessSum=0.0;//������
		double dExposureSum=0.0;//���ڽ��
		DBUtil DBUtil=new DBUtil();
		CLManager clm = new CLManager();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn=DBUtil.getConnection();
		ArrayList<String> ls = new ArrayList<String>();
		ArrayList<String> lsSerialno = new ArrayList<String>();
		ArrayList<String> lsLineID = new ArrayList<String>();
		try {
			sSql=" select ObjectNo,Currency,BusinessSum,ExposureSum,RelativeSerialno from CL_Occupy_Mig where ObjectType='PutOutApply' and ObjectNo in (select SerialNo from Business_Duebill_Mig) ";
			pstmt=conn.prepareStatement(sSql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				sSerialNo=rs.getString("ObjectNo");
				if(sSerialNo==null) sSerialNo="";
				lsSerialno.add(sSerialNo);
				sLineID=rs.getString("RelativeSerialno");
				if(sLineID==null) sLineID="";
				lsLineID.add(sLineID);
//				sCurrency=rs.getString("Currency");
//				if(sCurrency==null) sCurrency="";
//				dBusinessSum=rs.getDouble("BusinessSum");
//				dExposureSum=rs.getDouble("ExposureSum");
//				if( dBusinessSum !=clm.getDueBillBusinessSum(sSerialNo, sLineID) ||
//					dExposureSum !=clm.getDueBillExposureSum(sSerialNo, sLineID) ){
//					ls.add(sLineID);
//				}
			}
			for(int a=0;a<lsSerialno.size();a++){
				if( dBusinessSum !=clm.getDueBillBusinessSum(lsSerialno.get(a), lsLineID.get(a)) ||
						dExposureSum !=clm.getDueBillExposureSum(lsSerialno.get(a), lsLineID.get(a)) ){
						ls.add(sLineID);
					}
			}
			
		} catch (SQLException e) {
			ARE.getLog().error("��ʼ������-���ռ��-��ݽ��У��ʧ��!");
			DBUtil.cleanResource(conn, pstmt, rs);//�ر���Դ
			e.printStackTrace();
			return;
		}
		if(ls.size()==0) {//�����쳣���ݣ���ִ��insert���
			ARE.getLog().debug("��ʼ������-���ռ��-��ݽ��У���ʼ���ɹ�!");
			DBUtil.cleanResource(conn, pstmt, rs);//�ر���Դ
			return;
		}
		sSql=" insert into CL_OCCUPY_ERROR (SerialNo,ObjectNo,RelativeSerialno,Currency,BusinessSum,ExposureSum,Flag,sourceSysNo ) "+
				" (select SerialNo,ObjectNo,RelativeSerialno,Currency,BusinessSum,ExposureSum,'2',sourceSysNo from CL_OCCUPY_Mig where RelativeSerialno=?) ";
		for(int i=0;i<ls.size();i++){
			try {
				pstmt=conn.prepareStatement(sSql);
				pstmt.setString(1, ls.get(i));
				pstmt.execute();
				pstmt.close();
				if(i==ls.size()-1){
					ARE.getLog().debug("��ʼ������-���ռ��-��ݽ��У���ʼ���ɹ�!");
				}
			} catch (SQLException e) {
				ARE.getLog().error("��ʼ������-���ռ��-��ݽ��У���ʼ��ʧ��!");
				e.printStackTrace();
			}
		}
		DBUtil.cleanResource(conn, pstmt, rs);//�ر���Դ
	}
	
	
	
	
}