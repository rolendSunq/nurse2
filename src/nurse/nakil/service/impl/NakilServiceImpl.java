package nurse.nakil.service.impl;

import java.util.ArrayList;

import nurse.nakil.dao.NakilDao;
import nurse.nakil.service.NakilService;
import nurse.nakil.vo.DataGraph;
import nurse.schedule.dao.ScheduleMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("nakilService")
public class NakilServiceImpl implements NakilService{

	@Autowired(required=false)
	private NakilDao nakilDao;
	
	@Autowired(required=false)
	private ScheduleMapper sm;
	
	@Override
	public void callService() {
		// TODO Auto-generated method stub
		System.out.println("datagraph");
		return;
	}

	@Override
	public ArrayList<DataGraph> getDataGraphList(DataGraph dg) {
		// TODO Auto-generated method stub
		return sm.getDataGraphList(dg);
	}
	
}
