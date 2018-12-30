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
	
	//创建Sheet，设置默认列宽
	public XSSFSheet createSheet(XSSFWorkbook wb,String sSheetName,int sDefaultColumnWidth){
		XSSFSheet sheet = wb.createSheet(sSheetName);
		sheet.setDefaultColumnWidth(sDefaultColumnWidth);//统一设置列宽
		return sheet;
	}
	
	//设置标题样式及标题值
	public void setRowStyleAndValue0(XSSFWorkbook wb, XSSFRow row1,XSSFSheet sheet,String titleName,int columnNumber){
		row1.setHeightInPoints(25);//标题的高度
		//第三步创建标题的单元格样式style2以及字体样式headerFont1
		CellStyle style1 = wb.createCellStyle();
		style1.setAlignment(HorizontalAlignment.CENTER);
		style1.setVerticalAlignment(VerticalAlignment.CENTER);
		style1.setFillForegroundColor((short) 15);
		style1.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		XSSFFont headerFont1 = (XSSFFont) wb.createFont();//创建字体样式
		headerFont1.setBold(true);
		headerFont1.setFontName("黑体");//设置字体类型
		headerFont1.setFontHeightInPoints((short) 15);//设置字体大小
		style1.setFont(headerFont1);//为标题样式设置字体样式
		XSSFCell cell1 = row1.createCell(0);//创建标题第一列
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, columnNumber - 1)); //合并第0到第n列
		cell1.setCellValue(titleName); //设置值标题
		cell1.setCellStyle(style1); //设置标题样式
	}
	
	//设置表头样式及列名值
	public void setRowStyleAndValue1(XSSFWorkbook wb, XSSFRow row2,XSSFSheet sheet,String titleName,int columnNumber,ArrayList<String> list){
		row2.setHeightInPoints(20);//设置表头高度
		//第四步，创建表头单元格样式 以及表头的字体样式
		XSSFCellStyle style2 = wb.createCellStyle();
		style2.setWrapText(true);//设置自动换行
		style2.setAlignment(HorizontalAlignment.CENTER);;
		style2.setVerticalAlignment(VerticalAlignment.CENTER);
		style2.setBottomBorderColor((short) 8);
		style2.setBorderBottom(BorderStyle.THIN);
		style2.setBorderLeft(BorderStyle.THIN);
		style2.setBorderRight(BorderStyle.THIN);
		style2.setBorderTop(BorderStyle.THIN);
		XSSFFont headerFont = (XSSFFont) wb.createFont();//创建字体样式
		headerFont.setBold(true);
		headerFont.setFontName("黑体");//设置字体类型
		headerFont.setFontHeightInPoints((short) 10);//设置字体大小
		style2.setFont(headerFont);//为标题样式设置字体样式
		for (int i = 0; i < columnNumber; i++) {
			XSSFCell cell = row2.createCell(i);
			cell.setCellValue(list.get(i));
			cell.setCellStyle(style2);
		}
	}
	
	//设置数据单元格样式
	public XSSFCellStyle setRowStyle2(XSSFWorkbook wb){
		XSSFCellStyle style2 = wb.createCellStyle();
		style2.setWrapText(true);//设置自动换行
		style2.setVerticalAlignment(VerticalAlignment.CENTER);
		style2.setAlignment(HorizontalAlignment.CENTER);
		//设置边框
		style2.setBottomBorderColor((short) 8);
		style2.setBorderBottom(BorderStyle.THIN);
		style2.setBorderLeft(BorderStyle.THIN);
		style2.setBorderRight(BorderStyle.THIN);
		style2.setBorderTop(BorderStyle.THIN);
		return style2;
	}
	
}