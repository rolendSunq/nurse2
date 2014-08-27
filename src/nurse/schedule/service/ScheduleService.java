package nurse.schedule.service;

import java.util.List;

import nurse.emp.vo.Nurse;
import nurse.schedule.vo.Schedule;
import nurse.schedule.vo.ScheduleTable;

public interface ScheduleService {
	public List<Schedule> getSelectScheduleList(Schedule s);
	public void insertSchedule(Schedule s);
	public void updateSchedule(Schedule s);
	public void deleteSchedule(Schedule s);
	
	public List<Nurse> getEmpList(Nurse n);
	public void dropChangeSchedule(Schedule s);
	public List<ScheduleTable> getScheduleTable(ScheduleTable s);
}


