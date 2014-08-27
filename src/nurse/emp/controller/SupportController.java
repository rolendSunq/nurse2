package nurse.emp.controller;

import nurse.board.service.BoardService;
import nurse.emp.service.EmpService;
import nurse.emp.vo.EmpVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("supportController")
public class SupportController {

	@Autowired(required=false)
	private EmpService empService;
	
	@Autowired(required=false)
	private BoardService boardService;
	
	@RequestMapping(value="empEdit.do", method=RequestMethod.POST)
	@ResponseBody
	public void empEdit(EmpVo empVo )
	{
		empService.viewUpDate(empVo);
	}
}
