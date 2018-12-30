package com.amarsoft.als.exp;

import java.io.FileOutputStream;
import java.util.ArrayList;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import com.amarsoft.are.ARE;

public class ExpExcelTask {

	public double export(String sAction,String sMode){
		double time = 0.00;
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy/MM/dd HH:mm:ss:SSS");
		java.text.SimpleDateFormat sdf1 = new java.text.SimpleDateFormat("yyyyMMdd");
		java.util.Date dBeginTime = new java.util.Date();
		SqlManager sqlManager = new SqlManager();
		String sFileName = "";
		String sActionName="";
		sActionName=sqlManager.getActionName(sAction);//获取核对报表名
		sFileName=sAction+"_"+sActionName+"_"+sdf1.format(dBeginTime)+".xlsx";
		//创建Excel文件
		ARE.getLog().debug("开始创建 "+sFileName+"文件......");
		XSSFWorkbook wb = new XSSFWorkbook();
		GenExcelSheet GenExcelSheet=new GenExcelSheet();
		String sTableName = "";//表名
		String sSheetName = "";//Sheet名
		String sTitleName = "";//标题名

		sTableName = sqlManager.getTableName(sAction);//获取表名
		sSheetName = sqlManager.getSheetName(sAction);//获取Sheet名
		sTitleName = sqlManager.getTitleName(sAction);//获取标题名
		//获得对应列名
		XmlManager ColumnManager=new XmlManager();
		ArrayList<String> list = ColumnManager.getColumnName(sAction);
		int iColumnLength=list.size();
		try {
			wb = GenExcelSheet.genExcelSheet(wb, sAction, sTableName, sSheetName, sTitleName, iColumnLength, list);
			ARE.getLog().debug(sFileName+" "+sSheetName+":生成Sheet成功!");
		} catch (Exception e) {
			ARE.getLog().error(sFileName+" "+sSheetName+":生成Sheet失败!");
			e.printStackTrace();
		}finally {
			
		}
		//若Sheet都成功生成，则生成Excel文件
		String sPath="";
		try {
			sPath=ARE.getProperty("FilePath");//获取文件路径
			if(sPath==null) sPath="./export/";//不配置默认文件生成在工程下
			sPath=sPath+sFileName;
			FileOutputStream fout = new FileOutputStream(sPath);
			wb.write(fout);
			fout.flush();
			fout.close();
			ARE.getLog().debug(sFileName+" 生成Excel文件成功!");
		} catch (Exception e) {
			ARE.getLog().error(sFileName+" 生成Excel文件失败!");
			e.printStackTrace();
		}
		
		java.util.Date dEndTime = new java.util.Date();
		time = (dEndTime.getTime() - dBeginTime.getTime()) / 1000.0;
		ARE.getLog().debug("报表编号:"+sAction+" 报表名:"+sActionName+" ExpExcelTask BeginTime:["+ sdf.format(dBeginTime) + "] EndTime:[" + sdf.format(dEndTime) + "]耗时[" + time + "]秒 [" + time / 60+ "]分");
		return time;
	}
	
}