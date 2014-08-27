package nurse.schedule.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import nurse.schedule.vo.Schedule;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("myTestController")
@RequestMapping("mytest.do")
public class TestController {
	@RequestMapping(method=RequestMethod.GET)
	public String getForm(Schedule s, Model md){
		return "schedule/mytest";
	}
	@RequestMapping(method=RequestMethod.POST)
	public String postForm(Schedule s, Model md){
		if(s.getIsDot()==null){
			System.out.println("s.getIsDot() is null");
			s.setIsDot("");
		}
		if(s.getIsDot().equals("")){
			System.out.println("s.getIsDot() is ''");
		}
		System.out.println("s.getIsDot(): "+s.getIsDot());
		md.addAttribute("schedule",s);
		return "schedule/mytest";
	}
	
	public static void main(String[] args){
		Calendar cal = new GregorianCalendar(2013, 2, 0);
		Date date = cal.getTime();
		DateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		DateFormat onlydf = new SimpleDateFormat("dd");
		System.out.println("Date : " + sdf.format(date));
		System.out.println("Date : " + onlydf.format(date));
		cal.add(Calendar.DATE, 1);
		date = cal.getTime();
		System.out.println("Date : " + sdf.format(date));

	}
}
