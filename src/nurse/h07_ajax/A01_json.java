package nurse.h07_ajax;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;



@Controller("json")
public class A01_json {
	/* 
	h07_ajax.A01_json
	 */
	@RequestMapping(value="/json.do",method=RequestMethod.GET)
	public String jsonForm(){
		
		return "h07_ajax/a01_form";
	}
	
	
	
	@RequestMapping(value="/json.do",method=RequestMethod.POST)
	@ResponseBody
	public String jsonLoading(@RequestParam("id") String id,
										@RequestParam("pwd") String pwd){
		String retStr="";
		
		
		if(id.equals("hong12")){
			retStr+="{id:'Y',";
		}else{
			retStr+="{id:'N',";
		}
		if(pwd.equals("1234")){
			retStr+="pwd:'Y'}";
		}else{
			retStr+="pwd:'N'}";
		}
		System.out.print(retStr);
		return retStr;
	}
	
	
	@RequestMapping(value="/json1.do",method=RequestMethod.POST)
	@ResponseBody
	public String jsonLoading1(@RequestParam("id") String id,
										@RequestParam("pwd") String pwd){
		
		/*List<Emp> empList = (ArrayList<Emp>)em.getSelectEmpList(e);
		System.out.println(empList.size());*/
		//JSONArray jsonObject�� ���� ��ü...
		//JSONObject -���� row����
		//	put(key,value)
		
	/*	for(Emp emp:empList){
			
			//{empno:������1,ename:������2}
			jsonobj.put("empno", emp.getEmpno());
			// null
			jsonobj.put("ename",emp.getEname());
			jsonobj.put("job", emp.getJob());
			jsonobj.put("deptno", emp.getDeptno());
			jsonArray.add(jsonobj);
		}
		*/
		//m.addAttribute("empList", empList);
		
		
		
		
		String retStr="";
		
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonobj =new JSONObject();
		if(id.equals("hong12")){
			jsonobj.put("id","Y");
		}else{
			jsonobj.put("id","N");
		}
		if(pwd.equals("1234")){
			jsonobj.put("pwd","Y");
		}else{
			jsonobj.put("pwd","N");
		}
			
		
			//jsonArray.add(jsonobj);	
			System.out.println(jsonobj);
		//System.out.println(jsonArray.toString());
		
		
		return jsonobj.toString();
	}
	
	
	
	@RequestMapping(value="/json2.do",method=RequestMethod.POST)
	@ResponseBody
	public String jsontable(@RequestParam("sel") String sel) {
		
		String retStr1="";	
		if(sel.equals("0")){
			retStr1+="{time:'9:30',contents:'�ڹ�',together:'�����'}";
		}
		if(sel.equals("1")){
			retStr1+="{time:'7:20',contents:'�ٴ�',together:'ģ��'}";
		}
		if(sel.equals("2")){
			retStr1+="{time:'6:30',contents:'������',together:'ģ��'}";
		}
		
		return retStr1;
	}

}
