package nurse.login.service;

import nurse.login.model.FindVO;

public interface PersonFindService {
	public String getID(String email);
	public String getPassword(FindVO findVO);
}
