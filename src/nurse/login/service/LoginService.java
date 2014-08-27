package nurse.login.service;

import javax.servlet.http.HttpSession;

import nurse.login.model.LoginVO;

public interface LoginService {
	public String loginCheck(LoginVO loginVO, HttpSession session);
	public LoginVO getJobnoName(LoginVO loginVO);
	public void mainPageAuth(int jobno, HttpSession session);
	public int idNPwdCheck(LoginVO loginVO);
}
