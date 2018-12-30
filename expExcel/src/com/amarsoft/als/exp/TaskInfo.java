package com.amarsoft.als.exp;

import java.util.ArrayList;

import com.amarsoft.are.ARE;
import com.amarsoft.are.util.xml.Document;
import com.amarsoft.are.util.xml.Element;

public class TaskInfo {
	private String src = "als";
	private int QueueLen = 20;
	private int ThreadPoolSize = 20;
	private ArrayList<String> actionList = new ArrayList<String>();
	private String Mode="";

	public TaskInfo(String etc,String sMode) {
		//��ǰ�˶�ģʽ
		setMode(sMode);
		
    	Document doc = null;
		try {
			doc = new Document(etc);
			Element root = doc.getRootElement();
			String s = root.getChildTextTrim("Src");
			if (s != null) {
				setSrc(s);
				ARE.getLog().debug("Task Src="+getSrc());
			}else {
				ARE.getLog().warn("Task default Src="+getSrc());
			}

			//���г���
			s = root.getChildTextTrim("QueueLen");
			if (s != null) {
				setQueueLen(Integer.parseInt(s));
				ARE.getLog().debug("Task QueueLen="+getQueueLen());
			}else {
				ARE.getLog().warn("Task default QueueLen="+getQueueLen());
			}

			//�����̸߳���
			s = root.getChildTextTrim("ThreadPoolSize");
			if (s != null) {
				setThreadPoolSize(Integer.parseInt(s));
				ARE.getLog().debug("Task ThreadPoolSize="+getThreadPoolSize());
			}else {
				ARE.getLog().warn("Task defalut ThreadPoolSize="+getThreadPoolSize());
			}
			
			SqlManager sqlManager = new SqlManager();
			actionList =  sqlManager.getAction(sMode);
			for(int a =0;a<actionList.size();a++){
				ARE.getLog().debug("Task Load �������� �������:"+actionList.get(a));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int getQueueLen() {
		return QueueLen;
	}

	public void setQueueLen(int queueLen) {
		QueueLen = queueLen;
	}

	public int getThreadPoolSize() {
		return ThreadPoolSize;
	}

	public void setThreadPoolSize(int threadPoolSize) {
		ThreadPoolSize = threadPoolSize;
	}
	
	public void setSrc(String src) {
		this.src = src;
	}

	public String getSrc() {
		return src;
	}

	public ArrayList<String> getActionList() {
		return actionList;
	}

	public void setActionList(ArrayList<String> actionList) {
		this.actionList = actionList;
	}

	public String getMode() {
		return Mode;
	}

	public void setMode(String mode) {
		Mode = mode;
	}
	
}