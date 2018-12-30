package com.amarsoft.als.exp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class GenExcelSheet {
	
	public XSSFWorkbook genExcelSheet(XSSFWorkbook wb,String sAction,String sTableName,String sheetName, String titleName,int columnNumber,ArrayList<String> list) throws Exception {
		//定义数据库变量
		DBUtil DBUtil = new DBUtil();
		SqlManager sqlManager = new SqlManager();
		String sSql = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//2.在Excel中添加一个sheet,对应Excel文件中的sheet
		ExcelSheetTool excelSheet=new ExcelSheetTool();
		XSSFSheet sheet=excelSheet.createSheet(wb, sheetName, 20);
		//3.创建第0行--标题,合并列
		XSSFRow row0 = sheet.createRow((int) 0);
		excelSheet.setRowStyleAndValue0(wb, row0, sheet, titleName, columnNumber);
		//4.创建第1行--表头
		XSSFRow row1 = sheet.createRow((int) 1);
		excelSheet.setRowStyleAndValue1(wb, row1, sheet, titleName, columnNumber, list);
		//5.获取数据
		sSql=sqlManager.getSql(sAction);//生成Sheet数据Sql
		conn=DBUtil.getConnection();
		pstmt=conn.prepareStatement(sSql);
		rs = pstmt.executeQuery();
		//6.为数据内容设置单元格样式(自动换行,上下居中,左右居中)
		XSSFCellStyle style2=excelSheet.setRowStyle2(wb);
		int i = 1;
		while(rs.next()){
			//第五步，创建单元格并设置值
			row1 = sheet.createRow((int) i + 1);
			i++;
			//为数据内容设置特点新单元格样式1 自动换行 上下居中
			XSSFCell datacell = null;
			for (int j = 0; j < columnNumber; j++){
				datacell = row1.createCell(j);
				datacell.setCellValue(rs.getString(j+1));
				datacell.setCellStyle(style2);
			}
		}
		DBUtil.cleanResource(conn, pstmt, rs);
		return wb;
	}
	
}