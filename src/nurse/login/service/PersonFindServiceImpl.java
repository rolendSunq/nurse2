package nurse.login.service;

import nurse.login.dao.LoginDAO;
import nurse.login.model.FindVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("findIDnPassService")
public class PersonFindServiceImpl implements PersonFindService{
	
	@Autowired(required=false)
	private LoginDAO loginDAO;
	
	@Override
	public String getID(String email) {
		String sendMessage = null;
		String result = loginDAO.findID(email);
		if (result.equals(null))
			sendMessage = "아이디가 존재하지 않습니다.";
		else
			sendMessage = "success";
		return sendMessage;
	}

	@Override
	public String getPassword(FindVO findVO) {
		// TODO Auto-generated method stub
		return null;
	}

}
