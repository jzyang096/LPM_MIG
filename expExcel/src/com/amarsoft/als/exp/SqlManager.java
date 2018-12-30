package com.amarsoft.als.exp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.amarsoft.are.ARE;
import com.amarsoft.are.util.xml.Document;
import com.amarsoft.are.util.xml.Element;

public class SqlManager {
	
	private String sSql="";
	private String sTableName = "";//����
	private String sSheetName = "";//Sheet��
	private String sTitleName = "";//������
	
	public String getSql(String sAction){
		Document doc = null;
		try {
			doc = new Document(ARE.getProperty("sqlFile"));
            Element root=doc.getRootElement();
            List<?> listSql=root.getChildren(sAction);
            Element ee = (Element)listSql.get(0);
            sSql = ee.getTextTrim();
            sSql=sSql.replace(";", "");//��ֹ���һλΪ";"��������ǿ���������
        } catch (Exception e) {
        	ARE.getLog().error("���� table.xml�ļ�����!"+e.getLocalizedMessage());
        }
		return sSql;
	}
	
	//��ȡ����
	public ArrayList<String> getOrgID(String sMode){
		DBUtil dbUtil=new DBUtil();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn=dbUtil.getConnection();
		ArrayList<String> list=new ArrayList<String>();
		if("1".equals(sMode)){//�����˶�
			list.add("all");
		}else{//ҵ��˶�
			sSql=" select OrgID from Org_Info where OrgLevel in ('3','6') ";
			try {
				pstmt=conn.prepareStatement(sSql);
				rs=pstmt.executeQuery();
				while(rs.next()){
					list.add(rs.getString("OrgID"));//װ�����
				}
				list.add("all");
			} catch (SQLException e) {
				ARE.getLog().error("��ȡ������ʧ��!");
				e.printStackTrace();
			}
			dbUtil.cleanResource(conn, pstmt, rs);//�ر���Դ
		}
		return list;
	}
	
	//��ȡ������
	public String getOrgName(String sOrgID){
		String sOrgName = "";
		DBUtil dbUtil = new DBUtil();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn = dbUtil.getConnection();
		sSql = " select OrgName from Org_Info where OrgID='"+sOrgID+"'";
		try {
			pstmt=conn.prepareStatement(sSql);
			rs=pstmt.executeQuery();
			if(rs.next()) sOrgName=rs.getString("OrgName");
			if(sOrgName==null) sOrgName="";
		} catch (SQLException e) {
			ARE.getLog().error("������:"+sOrgID+" ��ȡ������ʧ��!");
			e.printStackTrace();
		}
		dbUtil.cleanResource(conn, pstmt, rs);//�ر���Դ
		return sOrgName;
	}
	
	//װ�����ɶ���
	public ArrayList<String> getAction(String sMode){
		ArrayList<String> ls = new ArrayList<String>();
		DBUtil dbUtil = new DBUtil();
		ResultSet rs = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		conn = dbUtil.getConnection();
		if("1".equals(sMode) || "2".equals(sMode)){//��һ�˶�ģʽ
			sSql="select action from ExcelInfo where isInUse='1' and checkMode='"+sMode+"' order by SortNo";
		}else{//������ҵ��˶�
			sSql="select action from ExcelInfo where isInUse='1' and checkMode in ('1','2') order by SortNo";
		}
		try {
			pstmt=conn.prepareStatement(sSql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				ls.add(rs.getString("action"));
			}
		} catch (SQLException e) {
			ARE.getLog().error(" װ��Excel���ɶ���ʧ��! ");
			e.printStackTrace();
		}
		dbUtil.cleanResource(conn, pstmt, rs);//�ر���Դ
		return ls;
	}
	
	//��ȡ����
	public String getTableName(String sAction){
		DBUtil dbUtil = new DBUtil();
		ResultSet rs = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		conn = dbUtil.getConnection();
		sSql=" select tableName from ExcelInfo where action =? ";
		try {
			pstmt=conn.prepareStatement(sSql);
			pstmt.setString(1, sAction);
			rs=pstmt.executeQuery();
			if(rs.next()){
				sTableName=rs.getString("tableName");
				if(sTableName==null) sTableName="";
			}
		} catch (SQLException e) {
			ARE.getLog().error("["+sAction+"] ��ȡ���ݿ����ʧ��!");
			e.printStackTrace();
		}
		dbUtil.cleanResource(conn, pstmt, rs);//�ر���Դ
		return sTableName;
	}
	
	//��ȡSheet��
	public String getSheetName(String sAction){
		DBUtil dbUtil = new DBUtil();
		ResultSet rs = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		conn = dbUtil.getConnection();
		sSql=" select sheetName from ExcelInfo where action =? ";
		try {
			pstmt=conn.prepareStatement(sSql);
			pstmt.setString(1, sAction);
			rs=pstmt.executeQuery();
			if(rs.next()){
				sSheetName=rs.getString("sheetName");
				if(sSheetName==null) sSheetName="";
			}
		} catch (SQLException e) {
			ARE.getLog().error("["+sAction+"] ��ȡSheet��ʧ��!");
			e.printStackTrace();
		}
		dbUtil.cleanResource(conn, pstmt, rs);//�ر���Դ
		return sSheetName;
	}
	
	//��ȡ������
	public String getTitleName(String sAction){
		DBUtil dbUtil = new DBUtil();
		ResultSet rs = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		conn = dbUtil.getConnection();
		sSql=" select titleName from ExcelInfo where action =? ";
		try {
			pstmt=conn.prepareStatement(sSql);
			pstmt.setString(1, sAction);
			rs=pstmt.executeQuery();
			if(rs.next()){
				sTitleName=rs.getString("titleName");
				if(sTitleName==null) sTitleName="";
			}
		} catch (SQLException e) {
			ARE.getLog().error("["+sAction+"] ��ȡ������ʧ��!");
			e.printStackTrace();
		}
		dbUtil.cleanResource(conn, pstmt, rs);//�ر���Դ
		return sTitleName;
	}
	
	//��ȡ��������
	public String getActionName(String sAction){
		DBUtil dbUtil = new DBUtil();
		ResultSet rs = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		conn = dbUtil.getConnection();
		String sActionName="";
		sSql=" select actionName from ExcelInfo where action =? ";
		try {
			pstmt=conn.prepareStatement(sSql);
			pstmt.setString(1, sAction);
			rs=pstmt.executeQuery();
			if(rs.next()){
				sActionName=rs.getString("actionName");
				if(sActionName==null) sActionName="";
			}
		} catch (SQLException e) {
			ARE.getLog().error("["+sAction+"] ��ȡ������ʧ��!");
			e.printStackTrace();
		}
		dbUtil.cleanResource(conn, pstmt, rs);//�ر���Դ
		return sActionName;
	}	
	
	//Ŀ¼ҳ����������������sheet��
	public ArrayList<String> getIndexName(ArrayList<?> list){
		ArrayList<String> indexList=new ArrayList<String>();
		String sIndexName="";
		DBUtil dbUtil = new DBUtil();
		ResultSet rs = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		conn = dbUtil.getConnection();
		for(int i=0; i<list.size();i++){
			sSql=" select sheetName from ExcelInfo where action =? ";
			try {
				pstmt=conn.prepareStatement(sSql);
				pstmt.setString(1, (String) list.get(i));
				rs=pstmt.executeQuery();
				if(rs.next()){
					sIndexName=rs.getString("sheetName");
					if(sIndexName==null) sIndexName="";
					indexList.add(sIndexName);
				}
			} catch (SQLException e) {
				ARE.getLog().error("["+list.get(i)+"] ��ȡ������ʧ��!");
				e.printStackTrace();
			}finally{
				dbUtil.closePreparedStatement(pstmt);
				dbUtil.closeResultSet(rs);
			}
		}
		dbUtil.cleanResource(conn, pstmt, rs);//�ر���Դ
		return indexList;
	}
	
}