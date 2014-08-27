package nurse.schedule.vo;

public class Schedulemain {
	private String schedulekey;
	private String title;
	private String startdte;
	private String enddte;
	private String url;
	private String owner;
	private String studio;
	private String allDay;
	private String id;
	
	public String getSchedulekey() {
		return schedulekey;
	}
	public void setSchedulekey(String schedulekey) {
		this.schedulekey = schedulekey;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStartdte() {
		return startdte;
	}
	public void setStartdte(String startdte) {
		this.startdte = startdte;
	}
	public String getEnddte() {
		return enddte;
	}
	public void setEnddte(String enddte) {
		this.enddte = enddte;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	public String getStudio() {
		return studio;
	}
	public void setStudio(String studio) {
		this.studio = studio;
	}
	public String getAllDay() {
		return allDay;
	}
	public void setAllDay(String allDay) {
		this.allDay = allDay;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public static void main(String[]args){
		String dte="201310120930";
		System.out.println(dte.substring(0,4));
		System.out.println(dte.substring(4,6));
		System.out.println(dte.substring(6,8));
		System.out.println(dte.substring(8,10));
		System.out.println(dte.substring(10,12));
	}
	
}
