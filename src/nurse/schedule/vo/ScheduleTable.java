package nurse.schedule.vo;

import java.util.HashMap;
import java.util.Map;

public class ScheduleTable {
	private String title;
	private String jobno;
	private Map<String,String> dayMap=new HashMap<String,String>();
	private String y;
	private String m;
	private String startYM;
	private String endYM;
	
	public String getStartYM() {
		return startYM;
	}
	public void setStartYM(String startYM) {
		this.startYM = startYM;
	}
	public String getEndYM() {
		return endYM;
	}
	public void setEndYM(String endYM) {
		this.endYM = endYM;
	}
	public String getY() {
		return y;
	}
	public void setY(String y) {
		this.y = y;
	}
	public String getM() {
		return m;
	}
	public void setM(String m) {
		this.m = m;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getJobno() {
		return jobno;
	}
	public void setJobno(String jobno) {
		this.jobno = jobno;
	}
	public Map<String, String> getDayMap() {
		return dayMap;
	}
	public void setDayMap(Map<String, String> dayMap) {
		this.dayMap = dayMap;
	}
	
}
