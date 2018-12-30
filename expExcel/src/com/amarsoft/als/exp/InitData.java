package com.amarsoft.als.exp;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.amarsoft.are.ARE;

public class InitData {
	
	//0.数据自检，技术核对
	public void dataCheck(){
		//1.初始化中间表
		truncateTable();
		initData();
		//2.数据自检,总记录数自检
		autoDataCheck();
		//3.额度检查
		checkZHCLInfo();//综合授信额度汇总校验
		checkCLDivideInfo();//基本授信切分汇总校验
		checkTYCLInfo();//同业额度汇总校验
		updateExpFlag();
//		checkCLOccupy();//占额校验
//		checkDueBillInfo();//jzyang
//		checkPLCLInfo();//jzyang
	}
	
	//1.初始化中间表数据-清除数据
	public void truncateTable(){
		DBUtil DBUtil=new DBUtil();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn=DBUtil.getConnection();
		try {
			pstmt=conn.prepareStatement(" truncate table SQ_CL_ERROR ");
			pstmt.execute();
			ARE.getLog().debug("SQ_CL_ERROR表初始化数据-清除成功!");
		} catch (SQLException e) {
			ARE.getLog().error("SQ_CL_ERROR表初始化数据-清除异常!");
			e.printStackTrace();
		} finally {
			DBUtil.closePreparedStatement(pstmt);
		}
		try {
			pstmt=conn.prepareStatement(" truncate table CL_OCCUPY_ERROR ");
			ARE.getLog().debug("CL_OCCUPY_ERROR表初始化数据-清除成功!");
		} catch (SQLException e) {
			ARE.getLog().error("CL_OCCUPY_ERROR表初始化数据-清除异常!");
			e.printStackTrace();
		} finally {
			DBUtil.closePreparedStatement(pstmt);
		}
		try {
			pstmt=conn.prepareStatement(" truncate table SQ_BAD_DATA ");
			pstmt.execute();
			ARE.getLog().debug("SQ_BAD_DATA表初始化数据-清除成功!");
		} catch (SQLException e) {
			ARE.getLog().error("SQ_BAD_DATA表初始化数据-清除异常!");
			e.printStackTrace();
		} finally {
			DBUtil.closePreparedStatement(pstmt);
		}
		try {
			pstmt=conn.prepareStatement(" truncate table CL_INFO_MIG_BASE ");
			pstmt.execute();
			ARE.getLog().debug("CL_INFO_MIG_BASE表初始化数据-清除成功!");
		} catch (SQLException e) {
			ARE.getLog().error("CL_INFO_MIG_BASE表初始化数据-清除异常!");
			e.printStackTrace();
		} finally {
			DBUtil.closePreparedStatement(pstmt);
		}
		
		DBUtil.cleanResource(conn, pstmt, rs);//关闭资源
	}

	//2.初始化核对中间表数据
	public void initData(){
		String sSql="";
		DBUtil DBUtil=new DBUtil();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn=DBUtil.getConnection();
		//1.初始化SQ_CL_ERROR-基本授信额度信息
		sSql=" insert into SQ_CL_ERROR (LineID, CLTypeID, BusinessType, Currency, BusinessSum, EXPOSURESUM,CalCurrency,CHECKMODE) "+
			 " select LineID, CLTypeID, BusinessType, Currency, LineSum1, LineSum2 ,Currency,'2' from CL_INFO where CLTypeID = '010' and Status='1' ";
		try {
			pstmt=conn.prepareStatement(sSql);
			pstmt.execute();
			ARE.getLog().debug("初始化数据-SQ_CL_ERROR表-基本授信额度信息-初始化成功!");
		} catch (SQLException e) {
			ARE.getLog().error("初始化数据-SQ_CL_ERROR表-基本授信额度信息-初始化失败!");
			e.printStackTrace();
		} finally {
			DBUtil.closePreparedStatement(pstmt);
		}
		//2.初始化SQ_CL_ERROR-综合授信额度信息
		sSql=" insert into SQ_CL_ERROR (LineID, CLTypeID, BusinessType, Currency, BusinessSum, EXPOSURESUM,CalCurrency,CHECKMODE) "+
			 " select LineID, CLTypeID, BusinessType, Currency, LineSum1, LineSum2 ,Currency,'1' from CL_INFO where CLTypeID = '060' and Status='1' ";
		try {
			pstmt=conn.prepareStatement(sSql);
			pstmt.execute();
			ARE.getLog().debug("初始化数据-SQ_CL_ERROR表-大中综合授信额度信息-初始化成功!");
		} catch (SQLException e) {
			ARE.getLog().error("初始化数据-SQ_CL_ERROR表-大中综合授信额度信息-初始化失败!");
			e.printStackTrace();
		} finally {
			DBUtil.closePreparedStatement(pstmt);
		}
		//3.初始化SQ_CL_ERROR-同业额度信息
		sSql=" insert into SQ_CL_ERROR (LineID, CLTypeID, BusinessType, Currency, BusinessSum, EXPOSURESUM,CalCurrency,CHECKMODE) "+
			 " select LineID, CLTypeID, BusinessType, Currency, LineSum1, LineSum2 ,Currency,'3' from CL_INFO where CLTypeID = '080' and Status='1' ";
		try {
			pstmt=conn.prepareStatement(sSql);
			pstmt.execute();
			ARE.getLog().debug("初始化数据-SQ_CL_ERROR表-同业额度信息-初始化成功!");
		} catch (SQLException e) {
			ARE.getLog().error("初始化数据-SQ_CL_ERROR表-同业额度信息-初始化失败!");
			e.printStackTrace();
		} finally {
			DBUtil.closePreparedStatement(pstmt);
		}
		
		//4.基本授信明细表-基本授信初始化
		sSql=" insert into CL_INFO_MIG_BASE(LineID,MFCustomerID,Currency,Linesum1,Linesum2,ParentLineID,SortNo) "+
			 " select ci.LineID,t.MFCustomerID,ci.Currency,ci.Linesum1,ci.Linesum2,'',ci.LineID from CL_INFO ci,Customer_Info t where ci.CustomerID=t.CustomerID and ci.CLTypeID='010' ";
		try {
			pstmt=conn.prepareStatement(sSql);
			pstmt.execute();
			ARE.getLog().debug("初始化数据-CL_INFO_MIG_BASE表-业务核对-基本授信额度初始化成功!");
		} catch (SQLException e) {
			ARE.getLog().error("初始化数据-CL_INFO_MIG_BASE表-业务核对-基本授信额度初始化失败!");
			e.printStackTrace();
		} finally {
			DBUtil.closePreparedStatement(pstmt);
		}
		
		//5.基本授信明细表-基本授信切分细项初始化
		sSql=" insert into CL_INFO_MIG_BASE(divideSerialno,MFCustomerID,BusinessType,DivideCurrency,BusinessSum,ExposureSum,ParentLineID,SortNo) "+
			 " select cd.SerialNo,t.MFCustomerID,cd.DivideCode,cd.Currency,cd.BusinessSum,cd.ExposureSum,cd.ObjectNo,cd.ObjectNo "+
			 " from CL_INFO ci,CL_DIVIDE cd,CUSTOMER_INFO t where ci.LineID=cd.ObjectNo and cd.ObjectType='CLInfo' "+
			 " and ci.CLTypeID='010' and ci.CustomerID=t.CustomerID ";
		try {
			pstmt=conn.prepareStatement(sSql);
			pstmt.execute();
			ARE.getLog().debug("初始化数据-CL_INFO_MIG_BASE表-业务核对-基本授信切分细项初始化成功!");
		} catch (SQLException e) {
			ARE.getLog().error("初始化数据-CL_INFO_MIG_BASE表-业务核对-基本授信切分细项初始化失败!");
			e.printStackTrace();
		} finally {
			DBUtil.closePreparedStatement(pstmt);
		}
		
		DBUtil.cleanResource(conn, pstmt, rs);//关闭资源
	}
	
	//3.调用数据自检存储过程
	public void autoDataCheck(){
		DBUtil DBUtil=new DBUtil();
		Connection conn = null;
		CallableStatement cstmt =null;
		conn=DBUtil.getConnection();
		try {
			cstmt =conn.prepareCall(" {call SQ_Auto_CheckOut()} ");
			cstmt.execute();
			ARE.getLog().debug("初始化数据-数据自检-SQ_BAD_DATA初始化成功!");
		} catch (SQLException e) {
			ARE.getLog().error("初始化数据-数据自检-SQ_BAD_DATA初始化失败!");
			e.printStackTrace();
		}
		try {
			cstmt =conn.prepareCall(" {call SQ_CHECK_TABLEROW()} ");
			cstmt.execute();
			ARE.getLog().debug("初始化数据-总记录数自检-SQ_TABLE_ROW初始化成功!");
		} catch (SQLException e) {
			ARE.getLog().error("初始化数据-总记录数自检-SQ_TABLE_ROW初始化失败!");
			e.printStackTrace();
		}
		DBUtil.closeCallableStatement(cstmt);
		DBUtil.closeConnection(conn);
	}
	
	//4.综合授信额度校验
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
			ARE.getLog().debug("初始化数据-综合授信额度校验成功!");
		} catch (SQLException e) {
			ARE.getLog().error("初始化数据-综合授信额度校验失败!");
			e.printStackTrace();
		} finally {
			DBUtil.cleanResource(conn, pstmt, rs);//关闭资源
		}
	}
	
	//5.基本授信切分额度校验
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
			ARE.getLog().debug("初始化数据-基本授信切分额度校验成功!");
		} catch (SQLException e) {
			ARE.getLog().error("初始化数据-基本授信切分额度校验失败!");
			e.printStackTrace();
		} finally {
			DBUtil.cleanResource(conn, pstmt, rs);//关闭资源
		}
	}
	
	//6.同业额度校验
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
			ARE.getLog().debug("初始化数据-同业额度校验成功!");
		} catch (SQLException e) {
			ARE.getLog().error("初始化数据-同业额度校验失败!");
			e.printStackTrace();
		} finally {
			DBUtil.cleanResource(conn, pstmt, rs);//关闭资源
		}
	}
	
	//更新SQ_CL_ERROR表异常标识
	public void updateExpFlag(){
		String sSql="";
		DBUtil DBUtil=new DBUtil();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn=DBUtil.getConnection();
		//数据正常时，更新异常标识
		sSql=" update SQ_CL_ERROR set ExpFlag='2' where BusinessSum is not null and ExposureSum is not null "+
			 " and CalBusinessSum is not null and CalExposureSum is not null and BusinessSum=CalBusinessSum "+
			 " and ExposureSum=CalExposureSum ";
		try {
			pstmt=conn.prepareStatement(sSql);
			pstmt.execute();
			ARE.getLog().debug("初始化数据-更新SQ_CL_ERROR表正常标识成功!");
			pstmt.close();
		} catch (Exception e) {
			ARE.getLog().error("初始化数据-更新SQ_CL_ERROR表正常标识失败!");
			e.printStackTrace();
		}
		//数据异常时，更新异常标识
		sSql=" update SQ_CL_ERROR set ExpFlag='1' where BusinessSum is not null and ExposureSum is not null "+
			 " and CalBusinessSum is not null and CalExposureSum is not null and (BusinessSum<>CalBusinessSum "+
			 " or ExposureSum<>CalExposureSum) ";
		try {
			pstmt=conn.prepareStatement(sSql);
			pstmt.execute();
			ARE.getLog().debug("初始化数据-更新SQ_CL_ERROR表异常标识成功!");
			pstmt.close();
		} catch (Exception e) {
			ARE.getLog().error("初始化数据-更新SQ_CL_ERROR表异常标识失败!");
			e.printStackTrace();
		} finally {
			DBUtil.cleanResource(conn, pstmt, rs);//关闭资源
		}
	}
	
	//7.批量成员授信额度校验
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
			ARE.getLog().error("初始化数据-批量成员授信额度校验失败!");
			e.printStackTrace();
			DBUtil.cleanResource(conn, pstmt, rs);
			return;
		}
		if(ls.size()==0) {//若无异常数据，则不执行insert语句
			ARE.getLog().debug("初始化数据-批量成员授信额度校验初始化成功!");
			DBUtil.cleanResource(conn, pstmt, rs);
			return;
		}
		//初始化额度占用异常表
		sSql=" insert into CL_OCCUPY_ERROR (SerialNo,ObjectNo,RelativeSerialno,Currency,BusinessSum,ExposureSum,Flag,sourceSysNo ) "+
				" (select SerialNo,ObjectNo,RelativeSerialno,Currency,BusinessSum,ExposureSum,'3',sourceSysNo from CL_OCCUPY_Mig where RelativeSerialno=?) ";
		for(int i=0;i<ls.size();i++){
			try {
				pstmt=conn.prepareStatement(sSql);
				pstmt.setString(1, ls.get(i));
				pstmt.execute();
				if(i==ls.size()-1){
					ARE.getLog().debug("初始化数据-批量成员授信额度校验初始化成功!");
				}
			} catch (SQLException e) {
				ARE.getLog().error("初始化数据-批量成员授信额度校验初始化失败!");
				e.printStackTrace();
			}
		}
		DBUtil.cleanResource(conn, pstmt, rs);//关闭资源
	}
	
	//8.额度占用金额校验-占额层
	public void checkCLOccupy(){
		String sSql="";
		String sLineID="";
		String sCLTypeID="";
		String sCurrency="";
		double dUsedBusinessSum=0.0;//已用名义金额
		double dUsedExposureSum=0.0;//已用敞口金额
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
			ARE.getLog().error("初始化数据-额度占用金额校验失败!");
			DBUtil.cleanResource(conn, pstmt, rs);//关闭资源
			e.printStackTrace();
			return;
		}
		if(ls.size()==0) {//若无异常数据，则不执行insert语句
			ARE.getLog().debug("初始化数据-额度占用金额校验初始化成功!");
			DBUtil.cleanResource(conn, pstmt, rs);//关闭资源
			return;
		}
		//初始化额度占用异常表
		sSql=" insert into CL_OCCUPY_ERROR (SerialNo,ObjectNo,RelativeSerialno,Currency,BusinessSum,ExposureSum,Flag,sourceSysNo ) "+
				" (select SerialNo,ObjectNo,RelativeSerialno,Currency,BusinessSum,ExposureSum,'1',sourceSysNo from CL_OCCUPY_Mig where RelativeSerialno=?) ";
		for(int i=0;i<ls.size();i++){
			try {
				pstmt=conn.prepareStatement(sSql);
				pstmt.setString(1, ls.get(i));
				pstmt.execute();
				pstmt.close();
				if(i==ls.size()-1){
					ARE.getLog().debug("初始化数据-额度占用金额校验初始化成功!");
				}
				DBUtil.closePreparedStatement(pstmt);//jzyang
			} catch (SQLException e) {
				ARE.getLog().error("初始化数据-额度占用金额校验初始化失败!");
				e.printStackTrace();
			}
		}
		DBUtil.cleanResource(conn, pstmt, rs);//关闭资源
	}
	
	//9.额度占用-借据金额校验-借据层
	public void checkDueBillInfo(){
		String sSql="";
		String sLineID="";
		String sSerialNo="";
		String sCurrency="";
		double dBusinessSum=0.0;//名义金额
		double dExposureSum=0.0;//敞口金额
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
			ARE.getLog().error("初始化数据-额度占用-借据金额校验失败!");
			DBUtil.cleanResource(conn, pstmt, rs);//关闭资源
			e.printStackTrace();
			return;
		}
		if(ls.size()==0) {//若无异常数据，则不执行insert语句
			ARE.getLog().debug("初始化数据-额度占用-借据金额校验初始化成功!");
			DBUtil.cleanResource(conn, pstmt, rs);//关闭资源
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
					ARE.getLog().debug("初始化数据-额度占用-借据金额校验初始化成功!");
				}
			} catch (SQLException e) {
				ARE.getLog().error("初始化数据-额度占用-借据金额校验初始化失败!");
				e.printStackTrace();
			}
		}
		DBUtil.cleanResource(conn, pstmt, rs);//关闭资源
	}
	
	
	
	
}