package com.amarsoft.als.exp;

import java.util.ArrayList;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;

public class ExcelSheetTool {
	
	//����Sheet������Ĭ���п�
	public XSSFSheet createSheet(XSSFWorkbook wb,String sSheetName,int sDefaultColumnWidth){
		XSSFSheet sheet = wb.createSheet(sSheetName);
		sheet.setDefaultColumnWidth(sDefaultColumnWidth);//ͳһ�����п�
		return sheet;
	}
	
	//���ñ�����ʽ������ֵ
	public void setRowStyleAndValue0(XSSFWorkbook wb, XSSFRow row1,XSSFSheet sheet,String titleName,int columnNumber){
		row1.setHeightInPoints(25);//����ĸ߶�
		//��������������ĵ�Ԫ����ʽstyle2�Լ�������ʽheaderFont1
		CellStyle style1 = wb.createCellStyle();
		style1.setAlignment(HorizontalAlignment.CENTER);
		style1.setVerticalAlignment(VerticalAlignment.CENTER);
		style1.setFillForegroundColor((short) 15);
		style1.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		XSSFFont headerFont1 = (XSSFFont) wb.createFont();//����������ʽ
		headerFont1.setBold(true);
		headerFont1.setFontName("����");//������������
		headerFont1.setFontHeightInPoints((short) 15);//���������С
		style1.setFont(headerFont1);//Ϊ������ʽ����������ʽ
		XSSFCell cell1 = row1.createCell(0);//���������һ��
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, columnNumber - 1)); //�ϲ���0����n��
		cell1.setCellValue(titleName); //����ֵ����
		cell1.setCellStyle(style1); //���ñ�����ʽ
	}
	
	//���ñ�ͷ��ʽ������ֵ
	public void setRowStyleAndValue1(XSSFWorkbook wb, XSSFRow row2,XSSFSheet sheet,String titleName,int columnNumber,ArrayList<String> list){
		row2.setHeightInPoints(20);//���ñ�ͷ�߶�
		//���Ĳ���������ͷ��Ԫ����ʽ �Լ���ͷ��������ʽ
		XSSFCellStyle style2 = wb.createCellStyle();
		style2.setWrapText(true);//�����Զ�����
		style2.setAlignment(HorizontalAlignment.CENTER);;
		style2.setVerticalAlignment(VerticalAlignment.CENTER);
		style2.setBottomBorderColor((short) 8);
		style2.setBorderBottom(BorderStyle.THIN);
		style2.setBorderLeft(BorderStyle.THIN);
		style2.setBorderRight(BorderStyle.THIN);
		style2.setBorderTop(BorderStyle.THIN);
		XSSFFont headerFont = (XSSFFont) wb.createFont();//����������ʽ
		headerFont.setBold(true);
		headerFont.setFontName("����");//������������
		headerFont.setFontHeightInPoints((short) 10);//���������С
		style2.setFont(headerFont);//Ϊ������ʽ����������ʽ
		for (int i = 0; i < columnNumber; i++) {
			XSSFCell cell = row2.createCell(i);
			cell.setCellValue(list.get(i));
			cell.setCellStyle(style2);
		}
	}
	
	//�������ݵ�Ԫ����ʽ
	public XSSFCellStyle setRowStyle2(XSSFWorkbook wb){
		XSSFCellStyle style2 = wb.createCellStyle();
		style2.setWrapText(true);//�����Զ�����
		style2.setVerticalAlignment(VerticalAlignment.CENTER);
		style2.setAlignment(HorizontalAlignment.CENTER);
		//���ñ߿�
		style2.setBottomBorderColor((short) 8);
		style2.setBorderBottom(BorderStyle.THIN);
		style2.setBorderLeft(BorderStyle.THIN);
		style2.setBorderRight(BorderStyle.THIN);
		style2.setBorderTop(BorderStyle.THIN);
		return style2;
	}
	
}