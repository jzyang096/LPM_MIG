package com.amarsoft.als.exp;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.amarsoft.are.ARE;


public class DBUtil {
	
	//数据库联通性测试
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
			ARE.getLog().debug("当前数据库时间:"+sSysDate);
			ARE.getLog().debug("数据库连接测试成功!");
		} catch (SQLException e) {
			ARE.getLog().error("数据库连接失败!");
			e.printStackTrace();
		}finally{
			cleanResource(conn, pstmt, rs);
		}
	}
	
	//获取数据库连接
	public Connection getConnection(){
		Connection conn=null;
		try {
			conn=ARE.getDBConnection("als");
		} catch (SQLException e){
			ARE.getLog().error("ARE获取数据库连接失败!");
			e.printStackTrace();
		}
		return conn;
	}
	
	//关闭资源
	public void cleanResource(Connection conn,PreparedStatement pstmt,ResultSet rs){
		if(conn!=null){
			try{
				conn.close();
				conn=null;
			}catch(SQLException e){
				e.printStackTrace();
				ARE.getLog().error("Connection-释放资源失败!");
			}
		}
		
		if(pstmt !=null){
			try {
				pstmt.close();
				pstmt=null;
			} catch (SQLException e) {
				e.printStackTrace();
				ARE.getLog().error("PreparedStatement-释放资源失败!");
			}
		}
		
		if(rs !=null){
			try {
				rs.close();
				rs=null;
			} catch (SQLException e) {
				e.printStackTrace();
				ARE.getLog().error("ResultSet-释放资源失败!");
			}
		}
	}
	
	//关闭Connection
	public void closeConnection(Connection conn){
		if(conn!=null){
			try{
				conn.close();
				conn=null;
			}catch(SQLException e){
				e.printStackTrace();
				ARE.getLog().error("Connection-释放资源失败!");
			}
		}
	}
	
	//关闭PreparedStatement
	public void closePreparedStatement(PreparedStatement pstmt){
		if(pstmt !=null){
			try {
				pstmt.close();
				pstmt=null;
			} catch (SQLException e) {
				e.printStackTrace();
				ARE.getLog().error("PreparedStatement-释放资源失败!");
			}
		}
	}
	
	//关闭ResultSet
	public void closeResultSet(ResultSet rs){
		if(rs !=null){
			try {
				rs.close();
				rs=null;
			} catch (SQLException e) {
				e.printStackTrace();
				ARE.getLog().error("ResultSet-释放资源失败!");
			}
		}
	}
	
	//关闭CallableStatement
	public void closeCallableStatement(CallableStatement cstmt){
		if(cstmt !=null){
			try {
				cstmt.close();
				cstmt=null;
			} catch (SQLException e) {
				e.printStackTrace();
				ARE.getLog().error("CallableStatement-释放资源失败!");
			}
		}
	}
	
}