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
		//�������ݿ����
		DBUtil DBUtil = new DBUtil();
		SqlManager sqlManager = new SqlManager();
		String sSql = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//2.��Excel�����һ��sheet,��ӦExcel�ļ��е�sheet
		ExcelSheetTool excelSheet=new ExcelSheetTool();
		XSSFSheet sheet=excelSheet.createSheet(wb, sheetName, 20);
		//3.������0��--����,�ϲ���
		XSSFRow row0 = sheet.createRow((int) 0);
		excelSheet.setRowStyleAndValue0(wb, row0, sheet, titleName, columnNumber);
		//4.������1��--��ͷ
		XSSFRow row1 = sheet.createRow((int) 1);
		excelSheet.setRowStyleAndValue1(wb, row1, sheet, titleName, columnNumber, list);
		//5.��ȡ����
		sSql=sqlManager.getSql(sAction);//����Sheet����Sql
		conn=DBUtil.getConnection();
		pstmt=conn.prepareStatement(sSql);
		rs = pstmt.executeQuery();
		//6.Ϊ�����������õ�Ԫ����ʽ(�Զ�����,���¾���,���Ҿ���)
		XSSFCellStyle style2=excelSheet.setRowStyle2(wb);
		int i = 1;
		while(rs.next()){
			//���岽��������Ԫ������ֵ
			row1 = sheet.createRow((int) i + 1);
			i++;
			//Ϊ�������������ص��µ�Ԫ����ʽ1 �Զ����� ���¾���
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