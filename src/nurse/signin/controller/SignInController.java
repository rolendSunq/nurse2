package nurse.signin.controller;

import nurse.signin.model.SignInVO;
import nurse.signin.service.SignInService;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("signInController")
public class SignInController {
	
	@Autowired(required=false)
	SignInService signInService;
	
	@RequestMapping(value="signIn.do", method=RequestMethod.POST)
	public String signInLoad(Model model)
	{
		int random = (int) (Math.random() * 7)+1; 
		model.addAttribute("random", random);
		return "login/signIn";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="signEmail.do", method=RequestMethod.POST)
	@ResponseBody
	public String signInAjaxEmail(@RequestParam String email)
	{
		String sendMessage = signInService.getEmailService(email);
		JSONObject json = new JSONObject();
		json.put("sendMessage", sendMessage);
		return json.toJSONString();
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="signId.do", method=RequestMethod.POST)
	@ResponseBody
	public String signInAjaxId(@RequestParam String id)
	{
		String sendMessage = signInService.getIdService(id);
		JSONObject json = new JSONObject();
		json.put("sendMessage", sendMessage);
		return json.toJSONString();
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="signSsn.do", method=RequestMethod.POST)
	@ResponseBody
	public String signInAjaxSsn(@RequestParam String ssn)
	{
		String sendMessage = signInService.getPwdService(ssn);
		JSONObject json = new JSONObject();
		json.put("sendMessage", sendMessage);
		return json.toJSONString();
	}
	
	@RequestMapping(value="signInMember.do", method=RequestMethod.POST)
	public String signInMember(SignInVO signInVO, Model model)
	{
		String isSuccess = signInService.insertMember(signInVO);
		System.out.println(isSuccess);
		model.addAttribute("result", isSuccess);
		return "login/login";
	}
}
