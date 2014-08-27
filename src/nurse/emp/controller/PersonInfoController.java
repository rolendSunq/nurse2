package nurse.emp.controller;

import nurse.emp.service.PersonInfoService;
import nurse.emp.vo.AddressVO;
import nurse.emp.vo.EmailVO;
import nurse.emp.vo.PhoneVO;
import nurse.emp.vo.PwdVO;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("personInfoContoller")
public class PersonInfoController {
	@Autowired(required=false)
	private PersonInfoService personInfoService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "personPwdUpdate.do", method=RequestMethod.POST)
	@ResponseBody
	public String personPwdUpdate(PwdVO pwdVO)
	{
		int sendMessage = personInfoService.updatePersonPwd(pwdVO);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("sendMessage", sendMessage);
		return jsonObject.toJSONString();
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "personPwdCheck.do", method=RequestMethod.POST)
	@ResponseBody
	public String personPwdCheck(PwdVO pwdVO){
		int sendMessage = personInfoService.getPwdCheckPerson(pwdVO);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("sendMessage", sendMessage);
		return jsonObject.toJSONString();
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "personEmailUpdate.do", method=RequestMethod.POST)
	@ResponseBody
	public String personEmailUpdate(EmailVO emailVO){
		int sendMessage = personInfoService.updateNewEmail(emailVO);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("sendMessage", sendMessage);
		return jsonObject.toJSONString();
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "personPhoneModify.do", method=RequestMethod.POST)
	@ResponseBody
	public String personPhoneModify(PhoneVO phoneVO)
	{
		int sendMessage = personInfoService.updateNewPhone(phoneVO);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("sendMessage", sendMessage);
		return jsonObject.toJSONString();
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "personCellPhoneModify.do", method=RequestMethod.POST)
	@ResponseBody
	public String personCellPhoneModify(PhoneVO phoneVO)
	{
		int sendMessage = personInfoService.updateNewCellPhone(phoneVO);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("sendMessage", sendMessage);
		return jsonObject.toJSONString();
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "personAddressModify.do", method=RequestMethod.POST)
	@ResponseBody
	public String personAddressModify(AddressVO addressVO)
	{
		int sendMessage = personInfoService.updateNewAddress(addressVO);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("sendMessage", sendMessage);
		return jsonObject.toJSONString();
	}
	
}
