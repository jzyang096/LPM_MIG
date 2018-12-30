package com.amarsoft.als.exp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.amarsoft.are.ARE;

public class CLManager {

	//��ȡ�������Ŷ��������
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
			ARE.getLog().error("��ʼ������-��ȡ�������Ŷ��������ʧ��!");
			e.printStackTrace();
		}finally{
			DBUtil.cleanResource(conn, pstmt, rs);//�ر���Դ
		}
		return LineSum1;
	}
	
	//��û������Ŷ�ȳ��ڽ��
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
			ARE.getLog().error("��ʼ������-��û������Ŷ�ȳ��ڽ��ʧ��!");
			e.printStackTrace();
		} finally{
			DBUtil.cleanResource(conn, pstmt, rs);//�ر���Դ
		}
		return LineSum2;
	}
	
	//���ר����������
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
			ARE.getLog().error("��ʼ������-���ר����������ʧ��!");
			e.printStackTrace();
		}
		DBUtil.cleanResource(conn, pstmt, rs);//�ر���Դ
		return LineSum1;
	}
	
	//���ר���ȳ��ڽ��
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
			ARE.getLog().error("��ʼ������-���ר���ȳ��ڽ��ʧ��!");
			e.printStackTrace();
		}
		DBUtil.cleanResource(conn, pstmt, rs);//�ر���Դ
		return LineSum2;
	}
	
	//��û������Ŷ����ˮ
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
			ARE.getLog().error("��ʼ������-��û������Ŷ����ˮʧ��!");
			e.printStackTrace();
		}
		DBUtil.cleanResource(conn, pstmt, rs);//�ر���Դ
		return ls;
	}
	
	//��û��������зֶ�Ȼ���������
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
			ARE.getLog().error("��ʼ������-��û��������зֶ�Ȼ���������ʧ��!");
			e.printStackTrace();
		} finally {
			DBUtil.cleanResource(conn, pstmt, rs);//�ر���Դ
		}
		return LineSum1;
	}
	
	//��û��������зֶ�Ȼ��ܳ��ڽ��
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
			ARE.getLog().error("��ʼ������-��û��������зֶ�Ȼ��ܳ��ڽ��ʧ��!");
			e.printStackTrace();
		} finally {
			DBUtil.cleanResource(conn, pstmt, rs);//�ر���Դ
		}
		return LineSum2;
	}
	
	//����ۺ����Ŷ�Ȼ���������
	/* 
	 	�������ۺ����ŵĶ��
		302050	���Ͷ��ר���ծ��
		302055	���Ͷ��ר��Ǳ꣩
		302093	��Ʊ��Ѻר����
		302095	רҵ������˾ר����
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
		//��ȡ�ۺ������»������Ŷ��������
		sSql=" select getERate1(Currency,?) * LineSum1 as LineSum1 from CL_INFO where parentLineID=? and CLTypeId='010' and Status='1' ";
		try {
			pstmt=conn.prepareStatement(sSql);
			pstmt.setString(1, sCurrency);
			pstmt.setString(2, sLineId);
			rs=pstmt.executeQuery();
			if(rs.next()){
				dBSLineSum1=rs.getDouble("LineSum1"); }
		} catch (SQLException e) {
			ARE.getLog().error("��ʼ������-����ۺ����Ŷ���»�������������ʧ��!");
			e.printStackTrace();
		} finally {
			DBUtil.closeResultSet(rs);
			DBUtil.closePreparedStatement(pstmt);
		}
		
		//��ȡ�ۺ�������ר�����Ŷ��������
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
			ARE.getLog().error("��ʼ������-����ۺ����Ŷ����ר��������ʧ��!");
			e.printStackTrace();
		} finally {
			DBUtil.cleanResource(conn, pstmt, rs);//�ر���Դ
		}
		//�ۺ�����������=��������������+��ר������������
		LineSum1=dBSLineSum1+dZXLineSum1;
		return LineSum1;
	}
	
	
	//����ۺ����Ŷ�Ȼ��ܳ��ڽ��
	/* 
	 	�������ۺ����ŵĶ��
		302050	���Ͷ��ר���ծ��
		302055	���Ͷ��ר��Ǳ꣩
		302093	��Ʊ��Ѻר����
		302095	רҵ������˾ר����
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
		//��ȡ�ۺ������»������Ŷ��������
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
			ARE.getLog().error("��ʼ������-����ۺ����Ŷ���»������ų��ڽ��ʧ��!");
			e.printStackTrace();
		} finally {
			DBUtil.closeResultSet(rs);
			DBUtil.closePreparedStatement(pstmt);
		}
		
		//��ȡ�ۺ�������ר�����Ŷ�ȳ��ڽ��
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
			ARE.getLog().error("��ʼ������-����ۺ����Ŷ����ר��������ʧ��!");
			e.printStackTrace();
		} finally {
			DBUtil.cleanResource(conn, pstmt, rs);//�ر���Դ
		}
		//�ۺ����ų��ڽ��=�������ų��ڽ��+��ר�����ų��ڽ��
		LineSum2=dBSLineSum2+dZXLineSum2;
		return LineSum2;
	}
	
	//��ȡͬҵ���������
	/*
		3110 LSEC-����ծȯ�����˶��
		3121 RPNO-ծȯ�ع���������
		3131 FXÿ����߽��ն��
		3133 BS-ծȯ���ն��
		3135   ծȯ���ܻ�����������
		3137 BCCR-ծȯ���׶��ֽ���ǰ���ռ������
		3145 ALG-���ܵ�������
		3153 IOD-�ռ�͸֧���
		3181 NTSÿ����߽��ն��
		3183   ����ʹܶ��(��ծ)
		3185   ����ʹܶ�ȣ��Ǳ꣩ 
	 */
	public double getTYBusinessSum(String sLineId,String sCurrency){
		double LineSum1 = 0.0;
		String sSql="";
		DBUtil DBUtil=new DBUtil();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn=DBUtil.getConnection();
		//��ȡ��ͬҵ���������
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
			ARE.getLog().error("��ʼ������-���ͬҵ���������ʧ��!");
			e.printStackTrace();
		} finally {
			DBUtil.cleanResource(conn, pstmt, rs);//�ر���Դ
		}
		return LineSum1;
	}
	
	//��ȡͬҵ��ȳ��ڽ��
	/*
		3110 LSEC-����ծȯ�����˶��
		3121 RPNO-ծȯ�ع���������
		3131 FXÿ����߽��ն��
		3133 BS-ծȯ���ն��
		3135   ծȯ���ܻ�����������
		3137 BCCR-ծȯ���׶��ֽ���ǰ���ռ������
		3145 ALG-���ܵ�������
		3153 IOD-�ռ�͸֧���
		3181 NTSÿ����߽��ն��
		3183   ����ʹܶ��(��ծ)
		3185   ����ʹܶ�ȣ��Ǳ꣩ 
	 */
	public double getTYExposureSum(String sLineId,String sCurrency){
		double LineSum2 = 0.0;
		String sSql="";
		DBUtil DBUtil=new DBUtil();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn=DBUtil.getConnection();
		//��ȡ��ͬҵ���������
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
			ARE.getLog().error("��ʼ������-���ͬҵ��ȳ��ڽ��ʧ��!");
			e.printStackTrace();
		} finally {
			DBUtil.cleanResource(conn, pstmt, rs);//�ر���Դ
		}
		return LineSum2;
	}
	
	//����SQ_CL_ERROR��CalBusinessSum�ֶ�
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
			ARE.getLog().error("���������з�ϸ��˶�-���¼���������ʧ��!");
			e.printStackTrace();
		} finally {
			DBUtil.cleanResource(conn, pstmt, rs);//�ر���Դ
		}
	}
	
	//����SQ_CL_ERROR��CalExposureSum�ֶ�
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
			ARE.getLog().error("���������з�ϸ��˶�-���¼��㳨�ڽ��ʧ��!");
			e.printStackTrace();
		} finally {
			DBUtil.cleanResource(conn, pstmt, rs);//�ر���Դ
		}
	}	
	
	//��ȡ�������ų�Ա������������ܽ��
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
			ARE.getLog().error("��ʼ������-��ȡ�������ų�Ա������������ܽ��ʧ��!");
			e.printStackTrace();
		}
		DBUtil.cleanResource(conn, pstmt, rs);//�ر���Դ
		return LineSum1;
	}
	
	//��ȡ�������Ŷ�ȹ��������ռ��������
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
	
	//��ȡ�������ų�Ա������ó����ܽ��
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
			ARE.getLog().error("��ʼ������-��ȡ�������ų�Ա������ó����ܽ��ʧ��!");
			e.printStackTrace();
		}
		DBUtil.cleanResource(conn, pstmt, rs);//�ر���Դ
		return LineSum2;
	}
	
	//��ȡ�������Ŷ�ȹ�����ռ�ó��ڽ��
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
	
	//��ö��ռ��������
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
			ARE.getLog().error("��ʼ������-��ö��ռ��������ʧ��!");
			e.printStackTrace();
		}
		DBUtil.cleanResource(conn, pstmt, rs);//�ر���Դ
		//System.out.println("sLineID="+sLineID+",sCurrency="+sCurrency+",dBusinessSum="+dBusinessSum);
		return dBusinessSum;
	}
	
	//��ö��ռ�ó��ڽ��
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
			ARE.getLog().error("��ʼ������-��ö��ռ�ó��ڽ��ʧ��!");
			e.printStackTrace();
		}
		DBUtil.cleanResource(conn, pstmt, rs);//�ر���Դ
		//System.out.println("sLineID="+sLineID+",sCurrency="+sCurrency+",dExposureSum="+dExposureSum);
		return dExposureSum;
	}
	
	//��ȡ���ռ��������
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
			if("1".equals(sRotative)){//ѭ�����
				sSql=" select getERate1(BusinessCurrency, ?)*Balance as BusinessSum from Business_Duebill_Mig where SerialNo=? ";
			}else{//��ѭ�����
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
			ARE.getLog().error("��ʼ������-��ȡ���ռ��������ʧ��!");
			e.printStackTrace();
		}
		DBUtil.cleanResource(conn, pstmt, rs);//�ر���Դ
		return DueBillBusinessSum;
	}
	
	//��ȡ��ݳ��ڽ�� = ������-��֤��-�ͷ�����Ѻ���
	public double getDueBillExposureSum(String sSerialNo,String sLineID){
		double DueBillBusinessSum=getDueBillBusinessSum(sSerialNo, sLineID);//������������ȱ���һ��
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
			if(rs.next()) MarginValue=rs.getDouble("ConfirmValue");//��֤����
			DueBillExposureSum=DueBillBusinessSum-MarginValue;
			DBUtil.closePreparedStatement(pstmt);
			DBUtil.closeResultSet(rs);
		} catch (SQLException e) {
			ARE.getLog().error("��ʼ������-��ȡ���������ʧ��!");
			e.printStackTrace();
		}
		DBUtil.cleanResource(conn, pstmt, rs);//�ر���Դ
		return DueBillExposureSum;
	}
	
}
