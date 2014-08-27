package nurse.emp.service;

import nurse.emp.vo.EmpVo;

public interface EmpService {

	public int empSertNumCheck(EmpVo empVo);

	public void insertEmpWrite(EmpVo empVo);

	public void fireDateNumCheck(EmpVo empVo);

	public EmpVo fireDateSelect(EmpVo empVo);

	public void viewUpDate(EmpVo empVo);

}
