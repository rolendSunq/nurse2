package nurse.emp.service;

import nurse.emp.vo.AddressVO;
import nurse.emp.vo.EmailVO;
import nurse.emp.vo.PhoneVO;
import nurse.emp.vo.PwdVO;

public interface PersonInfoService {
	public int updatePersonPwd(PwdVO pwdVO);
	public int getPwdCheckPerson(PwdVO pwdVO);
	public int updateNewEmail(EmailVO emailVO);
	public int updateNewPhone(PhoneVO phoneVO);
	public int updateNewCellPhone(PhoneVO phoneVO);
	public int updateNewAddress(AddressVO addressVO);
}
