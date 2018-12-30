package com.amarsoft.als.exp;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.amarsoft.are.ARE;


public class DBUtil {
	
	//���ݿ���ͨ�Բ���
	public void DBConnectionTest(){
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		Connection conn=null;
		String sSysDate="";
		conn=getConnection();
		try {
			pstmt=conn.prepareStatement(" select sysDate from dual ");
			rs=pstmt.executeQuery();
			if(rs.next()){
				sSysDate=rs.getString("sysDate");
				if(sSysDate==null) sSysDate="";
			}
			ARE.getLog().debug("��ǰ���ݿ�ʱ��:"+sSysDate);
			ARE.getLog().debug("���ݿ����Ӳ��Գɹ�!");
		} catch (SQLException e) {
			ARE.getLog().error("���ݿ�����ʧ��!");
			e.printStackTrace();
		}finally{
			cleanResource(conn, pstmt, rs);
		}
	}
	
	//��ȡ���ݿ�����
	public Connection getConnection(){
		Connection conn=null;
		try {
			conn=ARE.getDBConnection("als");
		} catch (SQLException e){
			ARE.getLog().error("ARE��ȡ���ݿ�����ʧ��!");
			e.printStackTrace();
		}
		return conn;
	}
	
	//�ر���Դ
	public void cleanResource(Connection conn,PreparedStatement pstmt,ResultSet rs){
		if(conn!=null){
			try{
				conn.close();
				conn=null;
			}catch(SQLException e){
				e.printStackTrace();
				ARE.getLog().error("Connection-�ͷ���Դʧ��!");
			}
		}
		
		if(pstmt !=null){
			try {
				pstmt.close();
				pstmt=null;
			} catch (SQLException e) {
				e.printStackTrace();
				ARE.getLog().error("PreparedStatement-�ͷ���Դʧ��!");
			}
		}
		
		if(rs !=null){
			try {
				rs.close();
				rs=null;
			} catch (SQLException e) {
				e.printStackTrace();
				ARE.getLog().error("ResultSet-�ͷ���Դʧ��!");
			}
		}
	}
	
	//�ر�Connection
	public void closeConnection(Connection conn){
		if(conn!=null){
			try{
				conn.close();
				conn=null;
			}catch(SQLException e){
				e.printStackTrace();
				ARE.getLog().error("Connection-�ͷ���Դʧ��!");
			}
		}
	}
	
	//�ر�PreparedStatement
	public void closePreparedStatement(PreparedStatement pstmt){
		if(pstmt !=null){
			try {
				pstmt.close();
				pstmt=null;
			} catch (SQLException e) {
				e.printStackTrace();
				ARE.getLog().error("PreparedStatement-�ͷ���Դʧ��!");
			}
		}
	}
	
	//�ر�ResultSet
	public void closeResultSet(ResultSet rs){
		if(rs !=null){
			try {
				rs.close();
				rs=null;
			} catch (SQLException e) {
				e.printStackTrace();
				ARE.getLog().error("ResultSet-�ͷ���Դʧ��!");
			}
		}
	}
	
	//�ر�CallableStatement
	public void closeCallableStatement(CallableStatement cstmt){
		if(cstmt !=null){
			try {
				cstmt.close();
				cstmt=null;
			} catch (SQLException e) {
				e.printStackTrace();
				ARE.getLog().error("CallableStatement-�ͷ���Դʧ��!");
			}
		}
	}
	
}