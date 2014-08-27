package nurse.login.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import nurse.login.model.LoginVO;
import nurse.login.service.LoginService;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller("login.do")
public class LoginController {
	
	@Autowired(required=false)
	private LoginService loginService;
	
	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public String loginPageLoad(Model model){
		int random = (int) (Math.random() * 7)+1; 
		model.addAttribute("random", random);
		return "login/login";
	}
	
	@RequestMapping(value = "findPass.do", method = RequestMethod.POST)
	public String idNpasswordPageLoad(){
		return "login/findIdnPass";
	}
	
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public ModelAndView checkingLogin(LoginVO loginVO, HttpSession session){
		String message = loginService.loginCheck(loginVO, session);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("message", message);
		ModelAndView mav = new ModelAndView();
		if (message == "success")
			mav.setViewName("main");
		else 
			mav.setViewName("login/login");
		mav.addAllObjects(map);
		loginService.mainPageAuth((int)session.getAttribute("jobno"), session);
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "loginAjax.do", method = RequestMethod.POST)
	@ResponseBody
	public String joinLogin(LoginVO loginVO){
		int sendMessage = 0;
		System.out.println("id: " + loginVO.getId());
		System.out.println("pwd: " + loginVO.getPwd());
		sendMessage = loginService.idNPwdCheck(loginVO);
		System.out.println(sendMessage);
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("sendMessage", sendMessage);
		return jsonObj.toJSONString();
	}
	
	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session, Model model){
		session.invalidate();
		int random = (int) (Math.random() * 7)+1; 
		model.addAttribute("random", random);
		return "login/login";
	}
	
	@RequestMapping(value = "goMain.do", method = RequestMethod.GET)
	public String callMain(){
		return "main";
	}
	
}
