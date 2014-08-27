package nurse.login.service;

import nurse.login.dao.LoginDAO;
import nurse.login.model.FindVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service("findServiceImpl")
public class FindServiceImpl implements FindService {

	@Autowired(required=false)
	private LoginDAO loginDAO;
	
	@Override
	public String getID(String email) {
		String result = null;
		result =  loginDAO.findID(email);
		if (result == null)
			result = "0";
		return result;
	}

	@Override
	public String getPWD(FindVO findVO) {
		String result = null;
		result = loginDAO.findPWD(findVO);
		if (result == null)
			result = "0";
		return result;
	}
	
	/*private String chKor(String in){
		String str="";
		try {
			str = URLEncoder.encode(in, "UTF-8").replaceAll("\\+", " ");
			str = str.replaceAll("%3F", "?");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return str;
	}*/
}
