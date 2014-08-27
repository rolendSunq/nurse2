package nurse.schedule.dao;

import java.util.ArrayList;
import java.util.List;

import nurse.emp.vo.Nurse;
import nurse.nakil.vo.DataGraph;
import nurse.schedule.vo.Schedule;
import nurse.schedule.vo.ScheduleData;
import nurse.schedule.vo.ScheduleTable;

public interface ScheduleMapper {
	public List<Schedule> getSelectScheduleList(Schedule s);
	public void insertSchedule(Schedule s);
	public void updateSchedule(Schedule s);
	public void deleteSchedule(Schedule s);
	
	public ArrayList<Nurse> getEmpList(Nurse n);
	public void dropChangeSchedule(Schedule s);
	public List<ScheduleData> getScheduleTable(ScheduleTable s);
	public ArrayList<DataGraph> getDataGraphList(DataGraph dg);
}
