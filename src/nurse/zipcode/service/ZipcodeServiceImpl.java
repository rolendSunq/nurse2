package nurse.zipcode.service;

import java.util.List;

import nurse.zipcode.dao.ZipcodeDAO;
import nurse.zipcode.model.ZipcodeVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class ZipcodeServiceImpl implements ZipcodeService {

	@Autowired(required=false)
	private ZipcodeDAO zipcodeDAO;
	
	@Override
	public List<ZipcodeVO> getDong(String dong) {
		return zipcodeDAO.dongSearch(dong);
	}
}
