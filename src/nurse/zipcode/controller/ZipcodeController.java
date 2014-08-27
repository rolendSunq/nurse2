package nurse.zipcode.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import nurse.zipcode.model.ZipcodeVO;
import nurse.zipcode.service.ZipcodeService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller("zipcodeController")
public class ZipcodeController {
	@Autowired(required=false)
	private ZipcodeService zipcodeService;
	
	@RequestMapping(value = "zipcode.do", method=RequestMethod.GET)
	public String zipcodeLoad(){
		return "login/zipModal";
	}
	
	@RequestMapping(value = "zipcode.do", method=RequestMethod.POST)
	public ModelAndView zipcode(@RequestParam String dong){
		Map<String, Object> map;
		ModelAndView model;
		List<ZipcodeVO> list = zipcodeService.getDong(dong);
		if ( list.size() > 0)
		{
			map = new HashMap<String, Object>();
			map.put("zipcodeList", list);
			map.put("check", "yes");
			map.put("result", 1);
			model = new ModelAndView("login/zipModal");
			model.addAllObjects(map);
		}
		else
		{
			map = new HashMap<String, Object>();
			map.put("check", "no");
			map.put("result", 0);
			model = new ModelAndView("login/zipModal");
			model.addAllObjects(map);
		}
		return model;
	}
}
