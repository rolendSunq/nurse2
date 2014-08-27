package nurse.signin.service;

import nurse.signin.model.SignInVO;

public interface SignInService {
	public String getIdService(String id);
	public String getPwdService(String ssn);
	public String getEmailService(String email);
	public String insertMember(SignInVO signInVO);
	public int getNewestJobno();
}
