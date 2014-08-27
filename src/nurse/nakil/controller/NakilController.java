package nurse.nakil.controller;

import java.util.ArrayList;

import nurse.nakil.service.NakilService;
import nurse.nakil.vo.DataGraph;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("NakilController")
@RequestMapping("/nakil.do")
public class NakilController {

	@Autowired(required=false)
	private NakilService nakilService;
	
	// http://localhost:8080/nurse2/nakil.do?method=pc
	@RequestMapping(params = "method=pc")
	public String productionCrew(){
		nakilService.callService();
		return "productioncrew/productioncrew";
	}
	
	// http://localhost:8080/nurse2/nakil.do?method=date
	@RequestMapping(params = "method=date")
	public String datePicker(){
		return "schedule/datepicker1";
	}
	
	// http://localhost:8080/nurse2/nakil.do?method=datagraph
	@RequestMapping(params = "method=datagraph")
	public String showdg(Model md){
		int pageSelecter=14;
		md.addAttribute("pageSelecter",pageSelecter);
		return "main";
	}
	
		@RequestMapping(params = "method=datagraph", method=RequestMethod.POST)
		public String dataGraph(DataGraph dg, Model md){
			/*System.out.println(dg.getStartdate());
			System.out.println(dg.getAllc());*/
			String alldaycount = dg.getAllc();
//			System.out.println("alldaycount : "+alldaycount);
			md.addAttribute("alldaycount",alldaycount);
			ArrayList<DataGraph> dglist = nakilService.getDataGraphList(dg);
//			System.out.println("크기"+dglist.size());
			md.addAttribute("dglist",dglist);
			int pageSelecter=14;
			md.addAttribute("pageSelecter",pageSelecter);
			return "main";
			/*return "datagraph/datagraph1";*/
		}
	
}
