package nurse.schedule.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.google.gson.Gson;

import nurse.schedule.service.ScheduleService;
import nurse.schedule.vo.Schedulemain;
import nurse.schedule.dao.ScheduleMapper;
/*
// z01_fullCalendar.A01_Calendar
@Controller("myScheduleController")
@RequestMapping("/calendar3.do")
public class CalendarController {

	@Autowired(required=false)
	private ScheduleMapper sm;	
	
	@Autowired(required=false)
	private ScheduleService ss;
	
	@RequestMapping(method=RequestMethod.GET)
	public String calendarForm(Model md){
		
		
		md.addAttribute("jsonList", getCalendarList());
		return "schedule/calendar3";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	@ResponseBody
	public String jsonLoading(Schedulemain s){
		insertCal(s);
		return getCalendarList();
	}
	
	@RequestMapping(params = "method=delete")
	@ResponseBody
	public String deleteData(Schedulemain s){
		System.out.println("deleteData >>> s.getId() >>> "+s.getId());
		deleteCal(s);
		return getCalendarList();
	}
	
	@RequestMapping(params = "method=update")
	@ResponseBody
	public String updateData(Schedulemain s){
		System.out.println("updateData >>> s.getId() >>> "+s.getId());
		updateCal(s);
		return getCalendarList();
	}
	
	private void updateCal(Schedulemain s){
		sm.updateSchedule(s);
	}
	
	private void deleteCal(Schedulemain s){
		sm.deleteSchedule(s);
	}
	
	private void insertCal(Schedulemain s){
		s.setTitle(s.getTitle());
		sm.insertSchedule(s);
	}
	
	private String getCalendarList(){
		
		List<Schedulemain> li = sm.getSelectScheduleList();
		System.out.println(":"+li.size());
		
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObj = null;
		
		
		
		int cnt=0;
		for(Schedulemain sch:li){
			
			jsonObj = new JSONObject();	
			jsonObj.put("title",chKor(chNull(sch.getTitle())));
			if(sch.getStartdte()!=null&&!sch.getStartdte().trim().equals("")){
				jsonObj.put("start",sch.getStartdte());
			}
			if(sch.getEnddte()!=null&&!sch.getEnddte().trim().equals("")){
				jsonObj.put("end", sch.getEnddte());		
			}	
			if(sch.getAllDay()!=null&&!sch.getAllDay().trim().equals("")){
				jsonObj.put("allDay", sch.getAllDay());		
			}
			
			System.out.println(++cnt+" : sch.getSchedulekey() >>> "+sch.getSchedulekey());
			
			if(sch.getSchedulekey()!=null&&!sch.getSchedulekey().trim().equals("")){
				jsonObj.put("id", sch.getSchedulekey().trim());
			}
			jsonArray.add(jsonObj);
		}
		System.out.println("jsonData:"+jsonArray.toString());
		
		//gson-2.2.jar.zip 파일을 lib 에 추가
//		Gson gson = new Gson();
//		String jsonData = gson.toJson(li);
//		System.out.println(jsonData);
		
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
	
	private String deKor(String in){
		String str="";
		try {
			str = URLDecoder.decode(in, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return str;
	}	
	
}
*/