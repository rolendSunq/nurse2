package nurse.productioncrew;
import java.sql.Date;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("productionController")
@RequestMapping("/pc.do")
public class Productioncrew {
	
	// http://localhost:8080/nurse2/pc.do?method=pc
		@RequestMapping(params = "method=pc")
		public String productionCrew(){
			return "WEB-INF/jsp/prodectioncrew/productioncrew.jsp";
		}
	
	// http://localhost:8080/nurse2/pc.do?method=date
		@RequestMapping(params = "method=date")
		public String datePicker(){
			return "WEB-INF/jsp/schedule/datepicker.jsp";
		}
		
}








