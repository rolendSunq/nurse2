package nurse.emp.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nurse.emp.dao.EmpDao;
import nurse.emp.service.EmpService;
import nurse.emp.vo.EmpVo;

@Service("empService")
public class EmpServiceImpl implements EmpService {

	@Autowired(required = false)
	private EmpDao empDao;    

	@Override
	public int empSertNumCheck(EmpVo empVo) {
		return empDao.empSertNumCheck(empVo);
	}

	@Override
	public void insertEmpWrite(EmpVo empVo) {

		empDao.insertEmpWrite(empVo);
	}

	@Override
	public void fireDateNumCheck(EmpVo empVo) {
		
		empDao.fireDateNumCheck(empVo);
	}

	@Override
	public EmpVo fireDateSelect(EmpVo empVo) {
		
		return empDao.fireDateSelect(empVo);
	}

	@Override
	public void viewUpDate(EmpVo empVo) {
		
		empDao.viewUpDate(empVo);
	}

}
