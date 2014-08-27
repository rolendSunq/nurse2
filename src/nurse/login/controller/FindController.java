package nurse.login.controller;

import nurse.login.model.FindVO;
import nurse.login.service.FindService;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("findController")
public class FindController {
	
	@Autowired(required=false)
	private FindService findService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "findId.do", method = RequestMethod.POST)
	@ResponseBody
	public String findId(@RequestParam("email") String email){
		
		String sendMessage = findService.getID(email);
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("sendMessage", sendMessage);
		jsonObj.put("section", "id");
		return jsonObj.toJSONString();
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "findPWD.do", method = RequestMethod.POST)
	@ResponseBody
	public String findPWD(FindVO findVO)
	{
		String sendMessage = findService.getPWD(findVO);
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("sendMessage", sendMessage);
		jsonObj.put("section", "pwd");
		return jsonObj.toJSONString();
	}
}
