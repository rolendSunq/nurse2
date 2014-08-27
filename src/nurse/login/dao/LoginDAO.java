package nurse.login.dao;

import java.util.List;

import nurse.login.model.FindVO;
import nurse.login.model.LoginVO;
import nurse.login.model.MenuAuthVO;

public interface LoginDAO {
	public int findByIDnPWD(LoginVO loginVO);
	public LoginVO findJobNOnNameByIDnPWD(LoginVO loginVO);
	public List<MenuAuthVO> findMenuAuthByJobno(int jobno);
	public String findID(String email);
	public String findPWD(FindVO findVO);
}
