package nurse.schedule.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.google.gson.Gson;
import com.sun.org.glassfish.gmbal.ParameterNames;

import nurse.emp.vo.Nurse;
import nurse.schedule.service.ScheduleService;
import nurse.schedule.vo.Schedule;
import nurse.schedule.vo.ScheduleTable;

@Controller("myScheduleController")
@RequestMapping("/calendar.do")
public class ScheduleController {

	@Autowired(required=false)
	private ScheduleService scheduleService;
	
	@RequestMapping(method=RequestMethod.GET)
	public String calendarForm(Schedule s, Model md){
		List<Nurse> nurse = scheduleService.getEmpList(new Nurse());
		if(nurse!=null){
			md.addAttribute("nurse", nurse);
		}
		md.addAttribute("jsonList", getCalendarList(s));
		int pageSelecter=10;
		md.addAttribute("pageSelecter",pageSelecter);
		//return "schedule/_calendar";
		//return "schedule/caltest";
		return "main";
	}
	
	@RequestMapping(params = "method=manual")
	public String goToManual(Model md){
		
		int pageSelecter=15;
		md.addAttribute("pageSelecter",pageSelecter);
		return "main";
	}
	
	@RequestMapping(params = "method=month")
	public String goToMonth(@Param("y") String y, 
							@Param("m") String m,
							Model md){

		md.addAttribute("myCurrentView","month");
		if(m!=null){
			m=m.length()==1?"0"+m:m;
		}	
		List<Nurse> nurse = scheduleService.getEmpList(new Nurse());
		if(nurse!=null){
			md.addAttribute("nurse", nurse);
		}
		
		//TODO:달을 변경하여 정보를 구하기
		md.addAttribute("jsonList", getCalendarList(new Schedule()));
		
		int pageSelecter=10;
		md.addAttribute("pageSelecter",pageSelecter);
		return "main";
	}
	
	@RequestMapping(params = "method=day")
	public String goToAgendaDay(@Param("y") String y, 
								@Param("m") String m,
								@Param("d") String d,
								Model md){

		md.addAttribute("myCurrentView","agendaDay");
		m=m.length()==1?"0"+m:m;
		d=d.length()==1?"0"+d:d;
		String goToDate=y+m+d+"0600";
		System.out.println("goToDate >> "+goToDate);
		md.addAttribute("goToDate",goToDate);
		
		List<Nurse> nurse = scheduleService.getEmpList(new Nurse());
		if(nurse!=null){
			md.addAttribute("nurse", nurse);
		}
		md.addAttribute("jsonList", getCalendarList(new Schedule()));
		int pageSelecter=10;
		md.addAttribute("pageSelecter",pageSelecter);
		return "main";
	}
	
	@RequestMapping(params = "method=insert")
	@ResponseBody
	public String insertData(Schedule s){

		//System.out.println("s.getIsDot(): "+s.getIsDot());
		if(s.getColor()!=null && !s.getColor().trim().equals("")){
			String color=s.getColor();
			if(color.indexOf("#")==-1){
				color="#"+color;
			}
			s.setClassName("");
			s.setBackgroundColor(color);
			s.setBorderColor(color);
			s.setTextColor("#ffffff");
		} else {
			s.setBackgroundColor("");
			s.setBorderColor("");
			s.setTextColor("");
		}
		System.out.println("insertData >>> "+s.getJobno()+"/"+s.getTitle());
		insertCal(s);
		s.setJobno(null);
		return getCalendarList(s);
	}
	
	@RequestMapping(params = "method=delete")
	@ResponseBody
	public String deleteData(Schedule s){
		System.out.println("deleteData >>> "+s.getSno()+"/"+s.getTitle());
		deleteCal(s);
		s.setJobno(null);
		return getCalendarList(s);
	}
	
	@RequestMapping(params = "method=update")
	@ResponseBody
	public String updateData(Schedule s){
		if(s.getColor()!=null && !s.getColor().trim().equals("")){
			String color=s.getColor();
			if(color.indexOf("#")==-1){
				color="#"+color;
			}
			s.setClassName("");
			s.setBackgroundColor(color);
			s.setBorderColor(color);
			s.setTextColor("#ffffff");
		} else {
			s.setBackgroundColor("");
			s.setBorderColor("");
			s.setTextColor("");
		}
		System.out.println("updateData >>> "+s.getSno()+"/"+s.getTitle());
		updateCal(s);
		s.setJobno(null);
		return getCalendarList(s);
	}
	
	@RequestMapping(params = "method=drop")
	@ResponseBody
	public String dropChangeData(Schedule s){
		System.out.println("dropChangeData >>> "+s.getSno()+"/"+s.getTitle());
		System.out.println(s.getStartdate()+"/"+s.getEnddate()+"/"+s.getType());
		dropChangeCal(s);
		return getCalendarList(s);
	}
	
	@RequestMapping(params = "method=list")
	public String getCalTable(ScheduleTable s, Model md){
		System.out.println("s.getY() >> "+s.getY()+", s.getM() >> "+s.getM());
		
		if(s.getY()==null || s.getM()==null){
			int startYear=0;
			if(s.getY()!=null){
				startYear=Integer.parseInt(s.getY());
			}
			int startMonth=0;
			if(s.getM()!=null){
				startMonth=Integer.parseInt(s.getM());
			}
			
			if(startYear==0 || startMonth==0){
				Calendar calendar = Calendar.getInstance();
				startYear = calendar.get(Calendar.YEAR);
				startMonth = calendar.get(Calendar.MONTH)+1;
			}
			s.setY(""+startYear);
			s.setM(""+startMonth);
		}
		md.addAttribute("y", s.getY());
		md.addAttribute("m", s.getM());
		
		List<ScheduleTable> stList = scheduleService.getScheduleTable(s);
		md.addAttribute("stList", stList);
		System.out.println("scheduleTable.size() >> " + stList.size());
		
		int pageSelecter = 13;
		md.addAttribute("pageSelecter", pageSelecter);
		return "main";
	}
	
	private void dropChangeCal(Schedule s){
		scheduleService.dropChangeSchedule(s);
	}
	
	private void updateCal(Schedule s){
		scheduleService.updateSchedule(s);
	}
	
	private void deleteCal(Schedule s){
		scheduleService.deleteSchedule(s);
	}
	
	private void insertCal(Schedule s){
		//s.setTitle(s.getTitle());
		scheduleService.insertSchedule(s);
	}
	
	private String getCalendarList(Schedule s){
		
		List<Schedule> list = scheduleService.getSelectScheduleList(s);
		System.out.println("getCalendarList() >>> list.size():"+list.size());
		
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObj = null;
		
		int cnt=0;
		for(Schedule sch : list){
			
			jsonObj = new JSONObject();	
			jsonObj.put("title",chKor(chNull(sch.getTitle())));
			
			if(sch.getStartdate()!=null&&!sch.getStartdate().trim().equals("")){
				jsonObj.put("start",sch.getStartdate());
			}
			if(sch.getEnddate()!=null&&!sch.getEnddate().trim().equals("")){
				jsonObj.put("end", sch.getEnddate());		
			}	
			if(sch.getAllday()!=null&&!sch.getAllday().trim().equals("")){
				jsonObj.put("allDay", sch.getAllday());		
			}
			if(sch.getSno()!=null&&!sch.getSno().trim().equals("")){
				jsonObj.put("id", sch.getSno().trim()); /// 중요: sno를 fc내 정보제어를 위한 id로 사용
			}
			if(sch.getType()!=null&&!sch.getType().trim().equals("")){
				jsonObj.put("type", sch.getType().trim());
			}
			if(sch.getJobno()!=null&&!sch.getJobno().trim().equals("")){
				jsonObj.put("jobno", sch.getJobno().trim());
			}
			
			if(sch.getClassName()!=null&&!sch.getClassName().trim().equals("")){
				jsonObj.put("className", sch.getClassName().trim());
			}
			if(sch.getEditable()!=null&&!sch.getEditable().trim().equals("")){
				jsonObj.put("editable", sch.getEditable().trim());
			}
			if(sch.getBackgroundColor()!=null&&!sch.getBackgroundColor().trim().equals("")){
				jsonObj.put("backgroundColor", sch.getBackgroundColor().trim());
			}
			if(sch.getBorderColor()!=null&&!sch.getBorderColor().trim().equals("")){
				jsonObj.put("borderColor", sch.getBorderColor().trim());
			}
			if(sch.getTextColor()!=null&&!sch.getTextColor().trim().equals("")){
				jsonObj.put("textColor", sch.getTextColor().trim());
			}
			//System.out.println(++cnt+" : sch.getSchedulekey() >>> "+sch.getSno());
			
			jsonArray.add(jsonObj);
		}
		//System.out.println("jsonData:"+jsonArray.toString());
		
		//gson-2.2.jar.zip 파일을 lib 에 추가
		/*
		Gson gson = new Gson();
		String jsonData = gson.toJson(list);
		System.out.println(jsonData);
		*/
		return jsonArray.toString();
	}
	
	private String chNull(String inNull){
		String str=" ";
		if(inNull==null||inNull.trim().equals("")){
			str=" ";
		}else{
			str =inNull;
		}
		return str;
	}
	private String chKor(String in){
		String str="";
		try {
			str = URLEncoder.encode(in, "UTF-8").replaceAll("\\+", " ");
			str = str.replaceAll("%3F", "?");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return str;
	}	
	/*
	private String deKor(String in){
		String str="";
		try {
			str = URLDecoder.decode(in, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return str;
	}	
	*/
}
