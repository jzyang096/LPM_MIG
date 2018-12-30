package com.amarsoft.als.exp;

import java.util.ArrayList;
import java.util.List;

import com.amarsoft.are.ARE;
import com.amarsoft.are.util.xml.Document;
import com.amarsoft.are.util.xml.Element;

public class XmlManager {

	public ArrayList<String> getColumnName(String sTableName){
		if(sTableName==null) sTableName="";
		ArrayList<String> list = new ArrayList<String>();
		Document doc = null;
		try {
			doc = new Document(ARE.getProperty("taskFile"));
            Element root=doc.getRootElement();
            Element listElement=root.getChild("SheetList");
            Element sheetEle=listElement.getChild(sTableName);
            List<?> ls1=sheetEle.getChildren();
            for(int a=0;a<ls1.size();a++){
            	Element e = (Element)ls1.get(a);
            	list.add(e.getAttributeValue("name"));
            }
        } catch (Exception e) {
        	ARE.getLog().error("解析 table.xml文件出错!"+e.getLocalizedMessage());
        }
		return list;
	}
	
}