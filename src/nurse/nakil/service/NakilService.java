package nurse.nakil.service;

import java.util.ArrayList;

import nurse.nakil.vo.DataGraph;

public interface NakilService {

	public void callService();

	public ArrayList<DataGraph> getDataGraphList(DataGraph dg);
	
}
