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
	private String sTableName = "";//表名
	private String sSheetName = "";//Sheet名
	private String sTitleName = "";//标题名
	
	public String getSql(String sAction){
		Document doc = null;
		try {
			doc = new Document(ARE.getProperty("sqlFile"));
            Element root=doc.getRootElement();
            List<?> listSql=root.getChildren(sAction);
            Element ee = (Element)listSql.get(0);
            sSql = ee.getTextTrim();
            sSql=sSql.replace(";", "");//防止最后一位为";"报错。增强程序兼容性
        } catch (Exception e) {
        	ARE.getLog().error("解析 table.xml文件出错!"+e.getLocalizedMessage());
        }
		return sSql;
	}
	
	//获取机构
	public ArrayList<String> getOrgID(String sMode){
		DBUtil dbUtil=new DBUtil();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn=dbUtil.getConnection();
		ArrayList<String> list=new ArrayList<String>();
		if("1".equals(sMode)){//技术核对
			list.add("all");
		}else{//业务核对
			sSql=" select OrgID from Org_Info where OrgLevel in ('3','6') ";
			try {
				pstmt=conn.prepareStatement(sSql);
				rs=pstmt.executeQuery();
				while(rs.next()){
					list.add(rs.getString("OrgID"));//装入机构
				}
				list.add("all");
			} catch (SQLException e) {
				ARE.getLog().error("获取机构号失败!");
				e.printStackTrace();
			}
			dbUtil.cleanResource(conn, pstmt, rs);//关闭资源
		}
		return list;
	}
	
	//获取机构名
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
			ARE.getLog().error("机构号:"+sOrgID+" 获取机构名失败!");
			e.printStackTrace();
		}
		dbUtil.cleanResource(conn, pstmt, rs);//关闭资源
		return sOrgName;
	}
	
	//装载生成动作
	public ArrayList<String> getAction(String sMode){
		ArrayList<String> ls = new ArrayList<String>();
		DBUtil dbUtil = new DBUtil();
		ResultSet rs = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		conn = dbUtil.getConnection();
		if("1".equals(sMode) || "2".equals(sMode)){//单一核对模式
			sSql="select action from ExcelInfo where isInUse='1' and checkMode='"+sMode+"' order by SortNo";
		}else{//技术，业务核对
			sSql="select action from ExcelInfo where isInUse='1' and checkMode in ('1','2') order by SortNo";
		}
		try {
			pstmt=conn.prepareStatement(sSql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				ls.add(rs.getString("action"));
			}
		} catch (SQLException e) {
			ARE.getLog().error(" 装载Excel生成动作失败! ");
			e.printStackTrace();
		}
		dbUtil.cleanResource(conn, pstmt, rs);//关闭资源
		return ls;
	}
	
	//获取表名
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
			ARE.getLog().error("["+sAction+"] 获取数据库表名失败!");
			e.printStackTrace();
		}
		dbUtil.cleanResource(conn, pstmt, rs);//关闭资源
		return sTableName;
	}
	
	//获取Sheet名
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
			ARE.getLog().error("["+sAction+"] 获取Sheet名失败!");
			e.printStackTrace();
		}
		dbUtil.cleanResource(conn, pstmt, rs);//关闭资源
		return sSheetName;
	}
	
	//获取标题名
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
			ARE.getLog().error("["+sAction+"] 获取标题名失败!");
			e.printStackTrace();
		}
		dbUtil.cleanResource(conn, pstmt, rs);//关闭资源
		return sTitleName;
	}
	
	//获取报表名称
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
			ARE.getLog().error("["+sAction+"] 获取标题名失败!");
			e.printStackTrace();
		}
		dbUtil.cleanResource(conn, pstmt, rs);//关闭资源
		return sActionName;
	}	
	
	//目录页面根据生产工作获得sheet名
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
				ARE.getLog().error("["+list.get(i)+"] 获取标题名失败!");
				e.printStackTrace();
			}finally{
				dbUtil.closePreparedStatement(pstmt);
				dbUtil.closeResultSet(rs);
			}
		}
		dbUtil.cleanResource(conn, pstmt, rs);//关闭资源
		return indexList;
	}
	
}