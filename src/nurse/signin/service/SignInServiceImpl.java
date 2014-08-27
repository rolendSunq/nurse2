package nurse.signin.service;

import nurse.signin.dao.SignInDAO;
import nurse.signin.model.SignInVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SignInServiceImpl implements SignInService {
	
	@Autowired(required=false)
	private SignInDAO signInDAO;
	
	@Override
	public String getIdService(String id) {
		
		String message = null;
		int idCheck = signInDAO.idCheck(id);
		if (idCheck == 1)
			message = "0";
		else
			message = "1";
		
		return message;
	}

	@Override
	public String getPwdService(String ssn) {
		String message = null;
		int ssnCheck = signInDAO.ssnCheck(ssn);
		if ( ssnCheck == 1)
			message = "0";
		else
			message = "1";
		
		return message;
	}

	@Override
	public String getEmailService(String email) {
		String message = null;
		int emailCheck = signInDAO.emailCheck(email);
		if ( emailCheck == 1)
			message = "0";
		else
			message = "1";
		
		return message;
	}

	@Override
	public String insertMember(SignInVO signInVO) {
		int jobnoValue = getNewestJobno();
		jobnoValue += 1;
		signInVO.setJobno(jobnoValue);
		signInDAO.insertMember(signInVO);
		String success = getIdService(signInVO.getId());
		String result = null;
		if (success.equals("0"))
			result = "1";
		else
			result = "0";
		return result;
	}

	@Override
	public int getNewestJobno() {
		return (int)signInDAO.newestJobno();
	}

}
