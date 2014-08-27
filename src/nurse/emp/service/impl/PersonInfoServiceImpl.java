package nurse.emp.service.impl;

import nurse.emp.dao.EmpDao;
import nurse.emp.service.PersonInfoService;
import nurse.emp.vo.AddressVO;
import nurse.emp.vo.EmailVO;
import nurse.emp.vo.PhoneVO;
import nurse.emp.vo.PwdVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("personInfoServiceImpl")
public class PersonInfoServiceImpl implements PersonInfoService {
	
	@Autowired(required=false)
	private EmpDao empDao;
	
	@Override
	public int updatePersonPwd(PwdVO pwdVO) {
		empDao.pwdUpdate(pwdVO);
		return empDao.rePwdCheck(pwdVO);
	}

	@Override
	public int getPwdCheckPerson(PwdVO pwdVO) {
		int result =  (int)empDao.pwdCheck(pwdVO);
		return result;
	}

	@Override
	public int updateNewEmail(EmailVO emailVO) {
		empDao.emailUpdate(emailVO);
		return empDao.emailUpdateCheck(emailVO);
	}

	@Override
	public int updateNewPhone(PhoneVO phoneVO) {
		empDao.phoneUpdate(phoneVO);
		return empDao.phoneUpdateCheck(phoneVO);
	}

	@Override
	public int updateNewCellPhone(PhoneVO phoneVO) {
		empDao.cellPhoneUpdate(phoneVO);
		return empDao.cellPhoneUpdateCheck(phoneVO);
	}

	@Override
	public int updateNewAddress(AddressVO addressVO) {
		empDao.addressUpdate(addressVO);
		return empDao.addressUpdateCheck(addressVO);
	}

}
