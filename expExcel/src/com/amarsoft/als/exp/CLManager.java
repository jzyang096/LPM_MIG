package com.amarsoft.als.exp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.amarsoft.are.ARE;

public class CLManager {

	//获取基本授信额度名义金额
	public double getBaseLineSum1(String sLineId){
		double LineSum1 = 0.0;
		String sSql="";
		DBUtil DBUtil=new DBUtil();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn=DBUtil.getConnection();
		sSql=" select getERate1(Currency,'156') * lineSum1 as LineSum1 from CL_Info_Mig where parentLineID=? and Status='1' and CLTypeId='010' ";
		try {
			pstmt=conn.prepareStatement(sSql);
			pstmt.setString(1, sLineId);
			rs=pstmt.executeQuery();
			if(rs.next()){
				LineSum1=rs.getDouble("LineSum1");
			}
		} catch (SQLException e) {
			ARE.getLog().error("初始化数据-获取基本授信额度名义金额失败!");
			e.printStackTrace();
		}finally{
			DBUtil.cleanResource(conn, pstmt, rs);//关闭资源
		}
		return LineSum1;
	}
	
	//获得基本授信额度敞口金额
	public double getBaseLineSum2(String sLineId){
		double LineSum2 = 0.0;
		String sSql="";
		DBUtil DBUtil=new DBUtil();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn=DBUtil.getConnection();
		sSql=" select getERate1(Currency,'156') * lineSum2 as LineSum2 from CL_Info_Mig where parentLineID=? and Status='1' and CLTypeId='010'";
		try {
			pstmt=conn.prepareStatement(sSql);
			pstmt.setString(1, sLineId);
			rs=pstmt.executeQuery();
			if(rs.next()){
				LineSum2=rs.getDouble("LineSum2");
			}
		} catch (SQLException e) {
			ARE.getLog().error("初始化数据-获得基本授信额度敞口金额失败!");
			e.printStackTrace();
		} finally{
			DBUtil.cleanResource(conn, pstmt, rs);//关闭资源
		}
		return LineSum2;
	}
	
	//获得专项额度名义金额
	public double getZXLineSum1(String sLineId){
		double LineSum1 = 0.0;
		String sSql="";
		DBUtil DBUtil=new DBUtil();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn=DBUtil.getConnection();
		sSql=" select sum(getERate1(Currency,'156')*lineSum1) as LineSum1 from CL_Info_Mig where parentLineID=? and Status='1' and CLTypeId='020'";
		try {
			pstmt=conn.prepareStatement(sSql);
			pstmt.setString(1, sLineId);
			rs=pstmt.executeQuery();
			if(rs.next()){
				LineSum1=rs.getDouble("LineSum1");
			}
		} catch (SQLException e) {
			ARE.getLog().error("初始化数据-获得专项额度名义金额失败!");
			e.printStackTrace();
		}
		DBUtil.cleanResource(conn, pstmt, rs);//关闭资源
		return LineSum1;
	}
	
	//获得专项额度敞口金额
	public double getZXLineSum2(String sLineId){
		double LineSum2 = 0.0;
		String sSql="";
		DBUtil DBUtil=new DBUtil();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn=DBUtil.getConnection();
		sSql=" select sum(getERate1(Currency,'156')*lineSum2) as LineSum2 from CL_Info_Mig where parentLineID=? and Status='1' and CLTypeId='020'";
		try {
			pstmt=conn.prepareStatement(sSql);
			pstmt.setString(1, sLineId);
			rs=pstmt.executeQuery();
			if(rs.next()){
				LineSum2=rs.getDouble("LineSum2");
			}
		} catch (SQLException e) {
			ARE.getLog().error("初始化数据-获得专项额度敞口金额失败!");
			e.printStackTrace();
		}
		DBUtil.cleanResource(conn, pstmt, rs);//关闭资源
		return LineSum2;
	}
	
	//获得基本授信额度流水
	public ArrayList<String> getBaseCLLineID(){
		ArrayList<String> ls = new ArrayList<String>();
		String sSql="";
		String sLineID="";
		DBUtil DBUtil=new DBUtil();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn=DBUtil.getConnection();
		sSql=" select lineID from CL_Info_Mig where CLTypeID='010' and Status='1' ";
		try {
			pstmt=conn.prepareStatement(sSql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				sLineID=rs.getString("lineID");
				if(sLineID==null) sLineID="";
				ls.add(sLineID);
			}
		} catch (SQLException e) {
			ARE.getLog().error("初始化数据-获得基本授信额度流水失败!");
			e.printStackTrace();
		}
		DBUtil.cleanResource(conn, pstmt, rs);//关闭资源
		return ls;
	}
	
	//获得基本授信切分额度汇总名义金额
	public double getDivideBusinessSum(String sLineId,String sCurrency){
		double LineSum1 = 0.0;
		String sSql="";
		DBUtil DBUtil=new DBUtil();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn=DBUtil.getConnection();
		sSql=" select sum(getERate1(Currency,?) * BusinessSum) as LineSum1 from CL_Divide where ObjectType='CLInfo' and ObjectNo=?";
		try {
			pstmt=conn.prepareStatement(sSql);
			pstmt.setString(1, sCurrency);
			pstmt.setString(2, sLineId);
			rs=pstmt.executeQuery();
			if(rs.next()){
				LineSum1=rs.getDouble("LineSum1"); }
		} catch (SQLException e) {
			ARE.getLog().error("初始化数据-获得基本授信切分额度汇总名义金额失败!");
			e.printStackTrace();
		} finally {
			DBUtil.cleanResource(conn, pstmt, rs);//关闭资源
		}
		return LineSum1;
	}
	
	//获得基本授信切分额度汇总敞口金额
	public double getDivideExposureSum(String sLineId,String sCurrency){
		double LineSum2 = 0.0;
		String sSql="";
		DBUtil DBUtil=new DBUtil();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn=DBUtil.getConnection();
		sSql=" select sum(getERate1(Currency,?) * ExposureSum) as LineSum2 from CL_Divide where ObjectType='CLInfo' and ObjectNo=?";
		try {
			pstmt=conn.prepareStatement(sSql);
			pstmt.setString(1, sCurrency);
			pstmt.setString(2, sLineId);
			rs=pstmt.executeQuery();
			if(rs.next()){
				LineSum2=rs.getDouble("LineSum2"); }
		} catch (SQLException e) {
			ARE.getLog().error("初始化数据-获得基本授信切分额度汇总敞口金额失败!");
			e.printStackTrace();
		} finally {
			DBUtil.cleanResource(conn, pstmt, rs);//关闭资源
		}
		return LineSum2;
	}
	
	//获得综合授信额度汇总名义金额
	/* 
	 	不纳入综合授信的额度
		302050	理财投资专项（标债）
		302055	理财投资专项（非标）
		302093	商票质押专项额度
		302095	专业担保公司专项额度
	*/
	public double getZHBusinessSum(String sLineId,String sCurrency){
		double LineSum1 = 0.0;
		double dBSLineSum1=0.0;
		double dZXLineSum1=0.0;
		String sSql="";
		DBUtil DBUtil=new DBUtil();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn=DBUtil.getConnection();
		//获取综合授信下基本授信额度名义金额
		sSql=" select getERate1(Currency,?) * LineSum1 as LineSum1 from CL_INFO where parentLineID=? and CLTypeId='010' and Status='1' ";
		try {
			pstmt=conn.prepareStatement(sSql);
			pstmt.setString(1, sCurrency);
			pstmt.setString(2, sLineId);
			rs=pstmt.executeQuery();
			if(rs.next()){
				dBSLineSum1=rs.getDouble("LineSum1"); }
		} catch (SQLException e) {
			ARE.getLog().error("初始化数据-获得综合授信额度下基本授信名义金额失败!");
			e.printStackTrace();
		} finally {
			DBUtil.closeResultSet(rs);
			DBUtil.closePreparedStatement(pstmt);
		}
		
		//获取综合授信下专项授信额度名义金额
		sSql=" select sum(getERate1(Currency,?)*LineSum1) as LineSum1 from CL_INFO where parentLineID=? and CLTypeId='020' and Status='1' "+
			 " and BusinessType<>'302095' and BusinessType<>'302050' and BusinessType<>'302093' and BusinessType<>'302055' ";
		try {
			pstmt=conn.prepareStatement(sSql);
			pstmt.setString(1, sCurrency);
			pstmt.setString(2, sLineId);
			rs=pstmt.executeQuery();
			if(rs.next()){
				dZXLineSum1=rs.getDouble("LineSum1"); }
		} catch (SQLException e) {
			ARE.getLog().error("初始化数据-获得综合授信额度下专项名义金额失败!");
			e.printStackTrace();
		} finally {
			DBUtil.cleanResource(conn, pstmt, rs);//关闭资源
		}
		//综合授信名义金额=基本授信名义金额+各专项授信名义金额
		LineSum1=dBSLineSum1+dZXLineSum1;
		return LineSum1;
	}
	
	
	//获得综合授信额度汇总敞口金额
	/* 
	 	不纳入综合授信的额度
		302050	理财投资专项（标债）
		302055	理财投资专项（非标）
		302093	商票质押专项额度
		302095	专业担保公司专项额度
	*/
	public double getZHExposureSum(String sLineId,String sCurrency){
		double LineSum2 = 0.0;
		double dBSLineSum2=0.0;
		double dZXLineSum2=0.0;
		String sSql="";
		DBUtil DBUtil=new DBUtil();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn=DBUtil.getConnection();
		//获取综合授信下基本授信额度名义金额
		sSql=" select getERate1(Currency,?) * LineSum2 as LineSum2 from CL_INFO where parentLineID=? and CLTypeId='010' and Status='1' ";
		try {
			pstmt=conn.prepareStatement(sSql);
			pstmt.setString(1, sCurrency);
			pstmt.setString(2, sLineId);
			rs=pstmt.executeQuery();
			if(rs.next()){
				dBSLineSum2=rs.getDouble("LineSum2");
			}
		} catch (SQLException e) {
			ARE.getLog().error("初始化数据-获得综合授信额度下基本授信敞口金额失败!");
			e.printStackTrace();
		} finally {
			DBUtil.closeResultSet(rs);
			DBUtil.closePreparedStatement(pstmt);
		}
		
		//获取综合授信下专项授信额度敞口金额
		sSql=" select sum(getERate1(Currency,?)*LineSum2) as LineSum2 from CL_INFO where parentLineID=? and CLTypeId='020' and Status='1' "+
			 " and BusinessType<>'302095' and BusinessType<>'302050' and BusinessType<>'302093' and BusinessType<>'302055' ";
		try {
			pstmt=conn.prepareStatement(sSql);
			pstmt.setString(1, sCurrency);
			pstmt.setString(2, sLineId);
			rs=pstmt.executeQuery();
			if(rs.next()){
				dZXLineSum2=rs.getDouble("LineSum2");
			}
		} catch (SQLException e) {
			ARE.getLog().error("初始化数据-获得综合授信额度下专项名义金额失败!");
			e.printStackTrace();
		} finally {
			DBUtil.cleanResource(conn, pstmt, rs);//关闭资源
		}
		//综合授信敞口金额=基本授信敞口金额+各专项授信敞口金额
		LineSum2=dBSLineSum2+dZXLineSum2;
		return LineSum2;
	}
	
	//获取同业额度名义金额
	/*
		3110 LSEC-长期债券发行人额度
		3121 RPNO-债券回购类名义额度
		3131 FX每日最高交收额度
		3133 BS-债券交收额度
		3135   债券保管机构保管上限
		3137 BCCR-债券交易对手结算前风险监察上限
		3145 ALG-接受担保上限
		3153 IOD-日间透支额度
		3181 NTS每日最高交收额度
		3183   理财资管额度(标债)
		3185   理财资管额度（非标） 
	 */
	public double getTYBusinessSum(String sLineId,String sCurrency){
		double LineSum1 = 0.0;
		String sSql="";
		DBUtil DBUtil=new DBUtil();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn=DBUtil.getConnection();
		//获取综同业额度名义金额
		sSql=" select getERate1(Currency,?) * LineSum1 as LineSum1 from CL_INFO where parentLineID=? and CLTypeId='130' and Status='1' "+
			 " and BusinessType not in ('3110','3121','3131','3133','3135','3137','3145','3153','3181','3183','3185') ";
		try {
			pstmt=conn.prepareStatement(sSql);
			pstmt.setString(1, sCurrency);
			pstmt.setString(2, sLineId);
			rs=pstmt.executeQuery();
			if(rs.next()){
				LineSum1=rs.getDouble("LineSum1"); }
		} catch (SQLException e) {
			ARE.getLog().error("初始化数据-获得同业额度名义金额失败!");
			e.printStackTrace();
		} finally {
			DBUtil.cleanResource(conn, pstmt, rs);//关闭资源
		}
		return LineSum1;
	}
	
	//获取同业额度敞口金额
	/*
		3110 LSEC-长期债券发行人额度
		3121 RPNO-债券回购类名义额度
		3131 FX每日最高交收额度
		3133 BS-债券交收额度
		3135   债券保管机构保管上限
		3137 BCCR-债券交易对手结算前风险监察上限
		3145 ALG-接受担保上限
		3153 IOD-日间透支额度
		3181 NTS每日最高交收额度
		3183   理财资管额度(标债)
		3185   理财资管额度（非标） 
	 */
	public double getTYExposureSum(String sLineId,String sCurrency){
		double LineSum2 = 0.0;
		String sSql="";
		DBUtil DBUtil=new DBUtil();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn=DBUtil.getConnection();
		//获取综同业额度名义金额
		sSql=" select getERate1(Currency,?) * LineSum2 as LineSum2 from CL_INFO where parentLineID=? and CLTypeId='130' and Status='1' "+
			 " and BusinessType not in ('3110','3121','3131','3133','3135','3137','3145','3153','3181','3183','3185') ";
		try {
			pstmt=conn.prepareStatement(sSql);
			pstmt.setString(1, sCurrency);
			pstmt.setString(2, sLineId);
			rs=pstmt.executeQuery();
			if(rs.next()){
				LineSum2=rs.getDouble("LineSum2"); }
		} catch (SQLException e) {
			ARE.getLog().error("初始化数据-获得同业额度敞口金额失败!");
			e.printStackTrace();
		} finally {
			DBUtil.cleanResource(conn, pstmt, rs);//关闭资源
		}
		return LineSum2;
	}
	
	//更新SQ_CL_ERROR表CalBusinessSum字段
	public void updateCalBusinessSum(String sLineID,double CalBusinessSum){
		String sSql="";
		DBUtil DBUtil=new DBUtil();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn=DBUtil.getConnection();
		sSql=" update SQ_CL_ERROR set CalBusinessSum=? where LineID=? ";
		try {
			pstmt=conn.prepareStatement(sSql);
			pstmt.setDouble(1, CalBusinessSum);
			pstmt.setString(2, sLineID);
			pstmt.execute();
		} catch (SQLException e) {
			ARE.getLog().error("基本授信切分细项核对-更新计算名义金额失败!");
			e.printStackTrace();
		} finally {
			DBUtil.cleanResource(conn, pstmt, rs);//关闭资源
		}
	}
	
	//更新SQ_CL_ERROR表CalExposureSum字段
	public void updateCalExposureSum(String sLineID,double CalExposureSum){
		String sSql="";
		DBUtil DBUtil=new DBUtil();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn=DBUtil.getConnection();
		sSql=" update SQ_CL_ERROR set CalExposureSum=? where LineID=? ";
		try {
			pstmt=conn.prepareStatement(sSql);
			pstmt.setDouble(1, CalExposureSum);
			pstmt.setString(2, sLineID);
			pstmt.execute();
		} catch (SQLException e) {
			ARE.getLog().error("基本授信切分细项核对-更新计算敞口金额失败!");
			e.printStackTrace();
		} finally {
			DBUtil.cleanResource(conn, pstmt, rs);//关闭资源
		}
	}	
	
	//获取批量授信成员额度已用名义总金额
	public double getPLLineSum1(String sLineId,String sCurrency){
		double LineSum1 = 0.0;
		String sSql="";
		String sSerialNo="";
		DBUtil DBUtil=new DBUtil();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn=DBUtil.getConnection();
		sSql=" select SerialNo from APPLY_BATCHRELATIVE_Mig where RelativeBatchSerialNo=? and IsOccupancy='01' and ObjectType='CLInfo' ";
		try {
			pstmt=conn.prepareStatement(sSql);
			pstmt.setString(1, sLineId);
			rs=pstmt.executeQuery();
			while(rs.next()){
				sSerialNo=rs.getString("SerialNo");
				if(sSerialNo==null) sSerialNo="";
				LineSum1=LineSum1+getPLOccupyBusinessSum(sLineId, sCurrency);
			}
		} catch (SQLException e) {
			ARE.getLog().error("初始化数据-获取批量授信成员额度已用名义总金额失败!");
			e.printStackTrace();
		}
		DBUtil.cleanResource(conn, pstmt, rs);//关闭资源
		return LineSum1;
	}
	
	//获取批量授信额度关联额度总占用名义金额
	public double getPLOccupyBusinessSum(String sLineID,String sCurrency){
		double dBusinessSum = 0.0;
		String sSql="";
		DBUtil DBUtil=new DBUtil();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn=DBUtil.getConnection();
		sSql=" select sum(getERate1(Currency,?)*BusinessSum) as BusinessSum from CL_Occupy_Mig where RelativeSerialNo=? and ObjectType='PutOutApply' ";
		try {
			pstmt=conn.prepareStatement(sSql);
			pstmt.setString(1, sCurrency);
			pstmt.setString(2, sLineID);
			rs=pstmt.executeQuery();
			if(rs.next()){
				dBusinessSum=rs.getDouble("BusinessSum");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dBusinessSum;
	}
	
	//获取批量授信成员额度已用敞口总金额
	public double getPLLineSum2(String sLineId,String sCurrency){
		double LineSum2 = 0.0;
		String sSql="";
		String sSerialNo="";
		DBUtil DBUtil=new DBUtil();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn=DBUtil.getConnection();
		sSql=" select SerialNo from APPLY_BATCHRELATIVE_Mig where RelativeBatchSerialNo=? and IsOccupancy='01' and ObjectType='CLInfo' ";
		try {
			pstmt=conn.prepareStatement(sSql);
			pstmt.setString(1, sLineId);
			rs=pstmt.executeQuery();
			while(rs.next()){
				sSerialNo=rs.getString("SerialNo");
				if(sSerialNo==null) sSerialNo="";
				LineSum2=LineSum2+getPLOccupyExposureSum(sLineId, sCurrency);
			}
		} catch (SQLException e) {
			ARE.getLog().error("初始化数据-获取批量授信成员额度已用敞口总金额失败!");
			e.printStackTrace();
		}
		DBUtil.cleanResource(conn, pstmt, rs);//关闭资源
		return LineSum2;
	}
	
	//获取批量授信额度关联总占用敞口金额
	public double getPLOccupyExposureSum(String sLineID,String sCurrency){
		double dExposureSum = 0.0;
		String sSql="";
		DBUtil DBUtil=new DBUtil();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn=DBUtil.getConnection();
		sSql=" select sum(getERate1(Currency,?)*ExposureSum) as ExposureSum from CL_Occupy_Mig where RelativeSerialNo=? and ObjectType='PutOutApply' ";
		try {
			pstmt=conn.prepareStatement(sSql);
			pstmt.setString(1, sCurrency);
			pstmt.setString(2, sLineID);
			rs=pstmt.executeQuery();
			if(rs.next()){
				dExposureSum=rs.getDouble("ExposureSum");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dExposureSum;
	}
	
	//获得额度占用名义金额
	public double getCLOccupyBusinessSum(String sLineID,String sCLTypeID,String sCurrency){
		double dBusinessSum = 0.0;
		String sSql="";
		DBUtil DBUtil = new DBUtil();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn=DBUtil.getConnection();
		try {
			if("050".equals(sCLTypeID)){
				sSql=" select sum(getERate1(Currency, ?) * ci.linesum1) as BUSINESSSUM from APPLY_BATCHRELATIVE_Mig ab,CL_info_Mig ci where ab.Serialno=ci.LineID "+
						"and ab.RelativeBatchSerialno=? and ab.IsOccupancy='01'";
				pstmt=conn.prepareStatement(sSql);
				pstmt.setString(1, sCurrency);
				pstmt.setString(2, sLineID);
			}else{
				sSql=" select sum( getERate1(Currency, ?) * BusinessSum) as BUSINESSSUM from CL_Occupy_Mig where RelativeSerialno=? and ObjectType='PutOutApply' ";
				pstmt=conn.prepareStatement(sSql);
				pstmt.setString(1, sCurrency);
				pstmt.setString(2, sLineID);
			}
			rs=pstmt.executeQuery();
			if(rs.next()) dBusinessSum=rs.getDouble("BUSINESSSUM");
			
		} catch (SQLException e) {
			ARE.getLog().error("初始化数据-获得额度占用名义金额失败!");
			e.printStackTrace();
		}
		DBUtil.cleanResource(conn, pstmt, rs);//关闭资源
		//System.out.println("sLineID="+sLineID+",sCurrency="+sCurrency+",dBusinessSum="+dBusinessSum);
		return dBusinessSum;
	}
	
	//获得额度占用敞口金额
	public double getCLOccupyExposureSum(String sLineID,String sCLTypeID,String sCurrency){
		double dExposureSum = 0.0;
		String sSql="";
		DBUtil DBUtil = new DBUtil();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn=DBUtil.getConnection();
		try {
			if("050".equals(sCLTypeID)){
				sSql=" select sum(getERate1(Currency, ?) * ci.linesum2) as EXPOSURESUM from APPLY_BATCHRELATIVE_Mig ab,CL_info_Mig ci where ab.Serialno=ci.LineID "+
						"and ab.RelativeBatchSerialno=? and ab.IsOccupancy='01'";
				pstmt=conn.prepareStatement(sSql);
				pstmt.setString(1, sCurrency);
				pstmt.setString(2, sLineID);
			}else{
				sSql=" select sum( getERate1(Currency, ?) * ExposureSum) as EXPOSURESUM from CL_Occupy_Mig where RelativeSerialno=? and ObjectType='PutOutApply' ";
				pstmt=conn.prepareStatement(sSql);
				pstmt.setString(1, sCurrency);
				pstmt.setString(2, sLineID);
			}
			rs=pstmt.executeQuery();
			if(rs.next()) dExposureSum=rs.getDouble("EXPOSURESUM");
		} catch (SQLException e) {
			ARE.getLog().error("初始化数据-获得额度占用敞口金额失败!");
			e.printStackTrace();
		}
		DBUtil.cleanResource(conn, pstmt, rs);//关闭资源
		//System.out.println("sLineID="+sLineID+",sCurrency="+sCurrency+",dExposureSum="+dExposureSum);
		return dExposureSum;
	}
	
	//获取借据占用名义金额
	public double getDueBillBusinessSum(String sSerialNo,String sLineID){
		double DueBillBusinessSum=0.0;
		String sSql="";
		String sRotative="";
		String sCurrency="";
		DBUtil DBUtil = new DBUtil();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn=DBUtil.getConnection();
		try {
			sSql=" select Rotative,Currency from CL_Info_Mig where LineID=? ";
			pstmt=conn.prepareStatement(sSql);
			pstmt.setString(1, sLineID);
			rs=pstmt.executeQuery();
			if(rs.next()){
				sRotative=rs.getString("Rotative");
				if(sRotative==null) sRotative="";
				sCurrency=rs.getString("Currency");
				if(sCurrency==null) sCurrency="";
			}
			pstmt.close();//jzyang
			rs.close();//jzyang
			DBUtil.closePreparedStatement(pstmt);
			DBUtil.closeResultSet(rs);
			if("1".equals(sRotative)){//循环额度
				sSql=" select getERate1(BusinessCurrency, ?)*Balance as BusinessSum from Business_Duebill_Mig where SerialNo=? ";
			}else{//非循环额度
				sSql=" select getERate1(BusinessCurrency, ?)*BusinessSum as BusinessSum from Business_Duebill_Mig where SerialNo=? ";
			}
			pstmt=conn.prepareStatement(sSql);
			pstmt.setString(1, sCurrency);
			pstmt.setString(2, sSerialNo);
			rs=pstmt.executeQuery();
			if(rs.next()) DueBillBusinessSum=rs.getDouble("BusinessSum");
			pstmt.close();//jzyang
			rs.close();//jzyang
			DBUtil.closePreparedStatement(pstmt);
			DBUtil.closeResultSet(rs);
		} catch (SQLException e) {
			ARE.getLog().error("初始化数据-获取借据占用名义金额失败!");
			e.printStackTrace();
		}
		DBUtil.cleanResource(conn, pstmt, rs);//关闭资源
		return DueBillBusinessSum;
	}
	
	//获取借据敞口金额 = 名义金额-保证金-低风险质押金额
	public double getDueBillExposureSum(String sSerialNo,String sLineID){
		double DueBillBusinessSum=getDueBillBusinessSum(sSerialNo, sLineID);//名义金额，币种与额度币种一致
		double DueBillExposureSum=0.0;
		double MarginValue=0.0;
		String sSql="";
		String sCurrency="";
		DBUtil DBUtil = new DBUtil();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn=DBUtil.getConnection();
		try {
			sSql=" select Currency from CL_Info_Mig where LineID=? ";
			pstmt=conn.prepareStatement(sSql);
			pstmt.setString(1, sLineID);
			rs=pstmt.executeQuery();
			if(rs.next()){
				sCurrency=rs.getString("Currency");
				if(sCurrency==null) sCurrency="";
			}
			DBUtil.closeResultSet(rs);
			DBUtil.closePreparedStatement(pstmt);
			sSql=" select sum(getERate1(GuarantyCurrency, ?) * ConfirmValue) as ConfirmValue from Margin_Info_Mig where ObjectNo=? and ObjectType='PutOutApply' and CustGuarantyType in ('01','02','03')";
			pstmt=conn.prepareStatement(sSql);
			pstmt.setString(1, sCurrency);
			pstmt.setString(2, sSerialNo);
			rs=pstmt.executeQuery();
			if(rs.next()) MarginValue=rs.getDouble("ConfirmValue");//保证金金额
			DueBillExposureSum=DueBillBusinessSum-MarginValue;
			DBUtil.closePreparedStatement(pstmt);
			DBUtil.closeResultSet(rs);
		} catch (SQLException e) {
			ARE.getLog().error("初始化数据-获取借据名义金额失败!");
			e.printStackTrace();
		}
		DBUtil.cleanResource(conn, pstmt, rs);//关闭资源
		return DueBillExposureSum;
	}
	
}
