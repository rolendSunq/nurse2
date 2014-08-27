package nurse.login.service;

import nurse.login.model.FindVO;

public interface FindService {
	public String getID(String email);
	public String getPWD(FindVO findVO);
}
