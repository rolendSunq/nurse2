package nurse.schedule.service.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nurse.emp.vo.Nurse;
import nurse.schedule.dao.ScheduleMapper;
import nurse.schedule.service.ScheduleService;
import nurse.schedule.vo.Schedule;
import nurse.schedule.vo.ScheduleData;
import nurse.schedule.vo.ScheduleTable;

@Service("scheduleService")
public class ScheduleServiceImpl implements ScheduleService{
	
	@Autowired(required=false)
	private ScheduleMapper sm;
	
	@Override
	public List<Nurse> getEmpList(Nurse n) {
		return sm.getEmpList(n);
	}

	@Override
	public List<Schedule> getSelectScheduleList(Schedule s) {
		return sm.getSelectScheduleList(s);
	}
	
	private int getNextDateInt(String day){
		int starty=Integer.parseInt(day.substring(0,4));
		int startm=Integer.parseInt(day.substring(4,6));
		int startd=Integer.parseInt(day.substring(6,8));
		
		Calendar cal = new GregorianCalendar(starty, startm-1, startd);
		cal.add(Calendar.DATE, 1);
		Date date = cal.getTime();
		
		DateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		
		return Integer.parseInt(sdf.format(date));
	}
	
	private int getLastDayOfMonth(String day){
		int starty=Integer.parseInt(day.substring(0,4));
		int startm=Integer.parseInt(day.substring(4,6));
		
		Calendar cal = new GregorianCalendar(starty, startm, 0);
		Date date = cal.getTime();
		
		DateFormat onlyDf = new SimpleDateFormat("dd");
		
		return Integer.parseInt(onlyDf.format(date));
	}

	@Override
	public void insertSchedule(Schedule s) {
		
		String type=s.getType();
		int startDate=Integer.parseInt(s.getStartdate().substring(0,8));
		int endDate=Integer.parseInt(s.getEnddate().substring(0,8));
		String startTime=s.getStartdate().substring(8,12);
		String endTime=s.getEnddate().substring(8,12);
		
		//1:1500>0700,2:2200>1500
		if(type.equals("1") || type.equals("2")){
			if(startDate==endDate){
				sm.insertSchedule(s);
			} else {
				//20131101-20131102
				//20131031-20131101
				//20131031-20140101
				
				int tempDate=startDate;
				while(startDate<=endDate){
					//데이터 입력
					s.setStartdate(tempDate+startTime);
					s.setEnddate(tempDate+endTime);
					sm.insertSchedule(s);
					
					startDate=getNextDateInt(""+startDate);
					tempDate=startDate;
				}
			}
			
		} else if(type.equals("3")){ //3:0700>2200
			//20131101-20131102 이것이 하루치 분량!
			if((startDate+1)==endDate){
				int tempDate=startDate;
				s.setStartdate(tempDate+startTime);
				s.setEnddate(tempDate+"2400");
				sm.insertSchedule(s);
				tempDate=tempDate+1;
				s.setStartdate(tempDate+"0000");
				s.setEnddate(tempDate+"0700");
				sm.insertSchedule(s);
			} else {
				//20131101-20131103 이것이 이틀치 분량! > 20131101-20131102, 20131102-20131103
				int tempStartDate=startDate;
				int tempEndDate=tempStartDate+1;
				while(startDate<endDate){
					//데이터 입력
					s.setStartdate(tempStartDate+startTime);
					s.setEnddate(tempStartDate+"2400");
					sm.insertSchedule(s);
					s.setStartdate(tempEndDate+"0000");
					s.setEnddate(tempEndDate+"0700");
					sm.insertSchedule(s);
					
					startDate=getNextDateInt(""+startDate);
					tempStartDate=startDate;
					
					tempEndDate=getNextDateInt(""+tempStartDate);
				}
			}
		} else { //type:4
			if(s.getIsDot()!=null && s.getIsDot().trim().equals("true")){
				if(startDate==endDate){
					sm.insertSchedule(s);
				} else {
					//20131101-20131102
					int tempDate=startDate;
					System.out.println("startDate: "+startDate);
					System.out.println("endDate: "+endDate);
					while(startDate<=endDate){
						//데이터 입력
						s.setStartdate(tempDate+startTime);
						s.setEnddate(tempDate+endTime);
						sm.insertSchedule(s);
						
						startDate=getNextDateInt(""+startDate);
						tempDate=startDate;
					}
				}
			} else {
				sm.insertSchedule(s);
			}
		}
		
	}

	@Override
	public void updateSchedule(Schedule s) {
		sm.updateSchedule(s);
	}

	@Override
	public void deleteSchedule(Schedule s) {
		sm.deleteSchedule(s);
	}

	@Override
	public void dropChangeSchedule(Schedule s) {
		sm.dropChangeSchedule(s);
	}

	@Override
	public List<ScheduleTable> getScheduleTable(ScheduleTable s) {
		int startYear=Integer.parseInt(s.getY());
		int startMonth=Integer.parseInt(s.getM());
		
		int endYear=startYear;
		int endMonth=startMonth+1;
		if(startMonth==12){
			endYear=startYear+1;
			endMonth=1;
		}
		String strStartMonth=""+startMonth;
		String strEndMonth=""+endMonth;
		strStartMonth=strStartMonth.length()==1?"0"+strStartMonth:strStartMonth;
		strEndMonth=strEndMonth.length()==1?"0"+strEndMonth:strEndMonth;

		s.setStartYM(startYear+strStartMonth+"010000");
		s.setEndYM(endYear+strEndMonth+"010000");
		
		//정보 가져오기
		List<ScheduleData> scheduleData = sm.getScheduleTable(s);
		
		String jobno="";
		String title="";
		String day="";
		String type="";
		
		Boolean isFirst=true;
		
		ScheduleTable st;
		Map<String,String> dayMap=new HashMap<String,String>();
		List<ScheduleTable> stList=new ArrayList<ScheduleTable>();
		
		//ScheduleData Format >>> ScheduleTable Format
		for(ScheduleData sd:scheduleData){
			//e.g		title					jobno	day		type
			//			이영애                                             1 		10	 	1    
			//			이영애                                             1 		11  	3    
			//			한예슬                                             3 		06  	2   

			if(!jobno.equals(sd.getJobno())){
				//jobno가 변경 될 때가 리스트에 집어 넣어야 할 때, 단, 처음은 제외
				if(!isFirst){
					st = new ScheduleTable();
					st.setTitle(title);
					st.setJobno(jobno);
					st.setDayMap(dayMap);

					stList.add(st);
					
					dayMap=new HashMap<String,String>();
				}
				isFirst=false;
				
				jobno = sd.getJobno();
				title = sd.getTitle();
				
				day = sd.getDay();
				type = sd.getType();
				if(type.equals("1")){
					type="Dy";
				} else if(type.equals("2")){
					type="Ev";
				} else if(type.equals("3")){
					type="Ng";
				}
				
				dayMap.put(day, type);
			} else { //jobno가 같다. 유지된다. > 날자 정보 입력
				if(!day.equals(sd.getDay())){
					
					day = sd.getDay();
					type = sd.getType();
					if(type.equals("1")){
						type="Dy";
					} else if(type.equals("2")){
						type="Ev";
					} else if(type.equals("3")){
						type="Ng";
					}
					
					dayMap.put(day, type);
				}
			}
			
		}
		
		//마지막 유저 정보는 jobno 변경 시 입력하는 로직에 걸리지 않으므로 한번 더 입력하는 기능 추가
		st = new ScheduleTable();
		st.setTitle(title);
		st.setJobno(jobno);
		st.setDayMap(dayMap);

		stList.add(st);
		
		return stList;
	}

}
