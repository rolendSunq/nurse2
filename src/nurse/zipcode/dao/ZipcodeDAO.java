package nurse.zipcode.dao;

import java.util.List;

import nurse.zipcode.model.ZipcodeVO;

public interface ZipcodeDAO {
	public List<ZipcodeVO> dongSearch(String dong);
}
