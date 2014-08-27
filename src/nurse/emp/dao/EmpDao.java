package nurse.emp.dao;

import nurse.emp.vo.AddressVO;
import nurse.emp.vo.EmailVO;
import nurse.emp.vo.EmpVo;
import nurse.emp.vo.PhoneVO;
import nurse.emp.vo.PwdVO;

public interface EmpDao {

	public int empSertNumCheck(EmpVo empVo);

	public void insertEmpWrite(EmpVo empVo);

	public void fireDateNumCheck(EmpVo empVo);

	public EmpVo fireDateSelect(EmpVo empVo);

	public void viewUpDate(EmpVo empVo);
	
	public void pwdUpdate(PwdVO pwdVO);
	
	public int pwdCheck(PwdVO pwdVO);
	
	public int rePwdCheck(PwdVO pwdVO);
	
	public void emailUpdate(EmailVO emailVO);
	
	public int emailUpdateCheck(EmailVO emailVO);
	
	public int phoneUpdateCheck(PhoneVO phoneVO);
	
	public void phoneUpdate(PhoneVO phoneVO);
	
	public int cellPhoneUpdateCheck(PhoneVO phonVO);

	public void cellPhoneUpdate(PhoneVO phoneVO);
	
	public int addressUpdateCheck(AddressVO addressVO);
	
	public void addressUpdate(AddressVO addressVO);
}
