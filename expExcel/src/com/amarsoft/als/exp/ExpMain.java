package com.amarsoft.als.exp;

import com.amarsoft.are.ARE;
import com.amarsoft.are.util.CommandLineArgument;

public class ExpMain {
	
	public static void main(String[] args) {
		CommandLineArgument arg = new CommandLineArgument(args);
		String are = arg.getArgument("are");
		if (are != null)
			ARE.init(are);
		else
			ARE.init("etc/are.xml");
//		DBUtil DBUtil= new DBUtil();
//		DBUtil.DBConnectionTest();
		InitData init= new InitData();
//		init.dataCheck();
		//���ɺ˶��ļ�
		String sMode=ARE.getProperty("DebugMode");//1-�����˶� 2-ҵ��˶� 3-������ҵ��˶�
		if(sMode==null) sMode="";
		if(!"1".equals(sMode) || !"2".equals(sMode) || "".equals(sMode)) sMode="3";//��������Ĭ�ϼ�����ҵ��˶�
		String taskFile = ARE.getProperty("taskFile");
		ExpExcelCtrl dm = new ExpExcelCtrl(new TaskInfo(taskFile,sMode));
		dm.migration();
	}
}