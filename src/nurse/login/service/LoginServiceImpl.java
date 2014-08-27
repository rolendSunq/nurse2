package nurse.login.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import nurse.login.dao.LoginDAO;
import nurse.login.model.LoginVO;
import nurse.login.model.MenuAuthVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("LoginService")
public class LoginServiceImpl implements LoginService {
	
	@Autowired(required=false)
	private LoginDAO loginDAO;
	
	@Override
	public String loginCheck(LoginVO loginVO, HttpSession session) {
		loginVO = loginDAO.findJobNOnNameByIDnPWD(loginVO);
		session.setAttribute("name", loginVO.getName());
		session.setAttribute("jobno", loginVO.getJobno());
		return "success";
	}

	@Override
	public LoginVO getJobnoName(LoginVO loginVO) {
		return loginDAO.findJobNOnNameByIDnPWD(loginVO);
	}

	@Override
	public void mainPageAuth(int jobno, HttpSession session) {
		
		List<MenuAuthVO> list = loginDAO.findMenuAuthByJobno(jobno);
		String value = "";
		for (MenuAuthVO menuAuthVO : list) {
			value += String.valueOf((int)menuAuthVO.getMenuno());
		}
		session.setAttribute("pageAuth", value);
	}

	@Override
	public int idNPwdCheck(LoginVO loginVO) {
		return loginDAO.findByIDnPWD(loginVO);
	}

}
