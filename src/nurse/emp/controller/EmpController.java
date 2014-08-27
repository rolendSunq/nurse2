package nurse.emp.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import nurse.board.service.BoardMaker;
import nurse.board.service.BoardService;
import nurse.board.vo.Board;
import nurse.emp.service.EmpService;
import nurse.emp.vo.EmpVo;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


@Controller("EmpController")
public class EmpController {

	@Autowired(required = false)
	private EmpService empService;

	@Autowired(required = false)
	private BoardService boardService;

	@Autowired(required = false)
	private BoardMaker boardMaker;

	@RequestMapping(params = "method=list")
	public String list(Board b, Model md) throws Exception {

		int pageSelecter = 1;
		Board board = boardMaker.makeBoard(boardService, b);
		md.addAttribute("board", board);

		List<Board> boardList = boardService.getEmpList(b);
		md.addAttribute("boardList", boardList);

		md.addAttribute("pageSelecter", pageSelecter);

		return "main";
	}

	@RequestMapping(params = "method=view")
	public String view(Board b, Model md) throws Exception {
		int pageSelecter = 4;
		Board board = boardService.getEmpArticle(b.getJobno());
		board.setArticlePerPage(b.getArticlePerPage());
		board.setCurrentPage(b.getCurrentPage());

		List<Board> menuList = boardService.getEmpMenuauthList(b);
		if (menuList.size() != 0) {
			String tot = "";
			for (Board a : menuList) {
				tot += Integer.parseInt(a.getMenuno());
			}
			md.addAttribute("menuList", tot);
		}
		md.addAttribute("board", board);
		md.addAttribute("pageSelecter", pageSelecter);
		return "main";
	}

	@RequestMapping(params = "method=person")
	public String person(Board b, Model md) throws Exception {
		int pageSelecter = 12;
		Board board = boardService.getEmpArticle(b.getJobno());
		board.setArticlePerPage(b.getArticlePerPage());
		board.setCurrentPage(b.getCurrentPage());

		List<Board> menuList = boardService.getEmpMenuauthList(b);
		if (menuList.size() != 0) {
			String tot = "";
			for (Board a : menuList) {
				tot += Integer.parseInt(a.getMenuno());
			}
			md.addAttribute("menuList", tot);
		}
		md.addAttribute("board", board);
		md.addAttribute("pageSelecter", pageSelecter);
		return "main";
	}


	/*@RequestMapping(params = "method=editup")
	public String editup(EmpVo empVo, Model md)
			throws Exception {
		System.out.println("에디트업 테스트중");
		System.out.println(empVo.getDno());
		System.out.println(empVo.getState());
		System.out.println(empVo.getHiredate());
		System.out.println(empVo.getFiredate());
		Board b = new Board();
		b.setJobno(r.getParameter("jobno"));
		b.setId(r.getParameter("id"));
		b.setPwd(r.getParameter("pwd"));
		b.setName(r.getParameter("name"));
		b.setDno(r.getParameter("dno"));
		b.setEmail(r.getParameter("email"));
		b.setPhone(r.getParameter("phone"));
		b.setTelecom(r.getParameter("telecom"));
		b.setCellphone(r.getParameter("cellphone"));
		b.setState(r.getParameter("state"));
		b.setPhoto(r.getParameter("photo"));
		b.setSsn(r.getParameter("ssn"));
		b.setSex(r.getParameter("sex"));
		b.setZipcode(r.getParameter("zipcode"));
		b.setAddress1(r.getParameter("address1"));
		b.setAddress2(r.getParameter("address2"));
		b.setHiredate(r.getParameter("hiredate"));
		b.setCertnum(r.getParameter("certnum"));
		b.setBirthday(r.getParameter("birthday"));
		b.setFiredate(r.getParameter("firedate"));
		b.setDowork(r.getParameter("dowork"));
		b.setManager(r.getParameter("manager"));
	

		MultipartFile report = r.getFile("photo");
		System.out.println(report.getOriginalFilename());
		if (report.getSize() != 0) {
			b.setPhoto(b.getJobno() + "_" + report.getOriginalFilename());
			fileUpload(report, b);
		}
		empService.viewUpDate(empVo);

		// boardService.deleteAuth(b);
		// if(menuno!=null){
		// String [] menuno1 = menuno.split(",");
		// for(String aa : menuno1){
		// System.out.println(b.getJobno());
		// b.setMenuno(aa);
		// System.out.println(b.getMenuno());
		// boardService.empInsetauth(b);
		// }
		// }

		return "redirect:emp.do?method=list&articlePerPage="
				+ empVo.getArticlePerPage() + "&currentPage=" + empVo.getCurrentPage()
				+ "&jobno=" + empVo.getJobno();
	}*/

	@RequestMapping(params = "method=write")
	public String write(Board b, Model model) {
		int pageSelecter = 3;
		model.addAttribute("pageSelecter", pageSelecter);

		b.setJobno(Integer.toString(boardService.getEmpMaxNum()));
		model.addAttribute("job", b);
		return "main";
	}

	@RequestMapping(params = "method=edit")
	public String edit(Board b, Model md) {
		int pageSelecter = 2;

		Board board = boardService.getEmpArticle(b.getJobno());
		md.addAttribute("board", board);
		board.setArticlePerPage(b.getArticlePerPage());
		board.setCurrentPage(b.getCurrentPage());
		List<Board> menuList = boardService.getEmpMenuauthList(b);
		if (menuList.size() != 0) {
			String tot = "";
			for (Board a : menuList) {
				tot += Integer.parseInt(a.getMenuno());
			}
			md.addAttribute("menuList", tot);
		}


		md.addAttribute("pageSelecter", pageSelecter);
		// return "emp/myedit";
		return "main";
	}
	//controller
	// 사진 업로드(changin-start)
	@RequestMapping(params = "method=writeup")
	public String writeup(String menuno, Model md, MultipartHttpServletRequest r)
			throws Exception {
		EmpVo empVo = new EmpVo();
		empVo.setJobno(r.getParameter("jobno"));
		empVo.setId(r.getParameter("id"));
		empVo.setPwd(r.getParameter("pwd"));
		empVo.setName(r.getParameter("name"));
		empVo.setDno(r.getParameter("dno"));
		empVo.setEmail(r.getParameter("email"));
		empVo.setPhone(r.getParameter("phone"));
		empVo.setCellphone(r.getParameter("cellphone"));
		empVo.setPhoto(r.getParameter("photo"));
		empVo.setSsn(r.getParameter("ssn"));
		empVo.setSex(r.getParameter("sex"));
		empVo.setZipcode(r.getParameter("zipcode"));
		empVo.setAddress1(r.getParameter("address1"));
		empVo.setAddress2(r.getParameter("address2"));
		empVo.setHiredate(r.getParameter("hiredate"));
		empVo.setCertnum(r.getParameter("certnum"));
		empVo.setBirthday(r.getParameter("birthday"));

		MultipartFile report = r.getFile("photo");
		empVo.setPhoto(empVo.getJobno() + "_" + report.getOriginalFilename());
		fileUploadEmp(report, empVo);
		empService.insertEmpWrite(empVo);
		if (menuno != null) {
			String[] menuno1 = menuno.split(",");
			for (String aa : menuno1) {
				System.out.println(empVo.getJobno());
				empVo.setMenuno(aa);
				System.out.println(empVo.getMenuno());
				//boardService.empInsetauth(empVo); 권한처리 다시 생각해야함...
			}
		}

		return "redirect:emp.do?method=list&articlePerPage="
				+ empVo.getArticlePerPage() + "&currentPage=" + empVo.getCurrentPage();
	}
	
	
	// 사진 업로드 진우 (changin-end)
	private void fileUploadEmp(MultipartFile report, EmpVo empVo) {
		File f = new File(
				//"/Users/changin99/Documents/nurse/workspace/nurse2/WebContent/photo/"
				"D:/java/workspace/nurse2/WebContent/photo/"
				+ empVo.getJobno() + "_" + report.getOriginalFilename());
		// Users/changin99/Documents/nurse/workspace
		try {
			report.transferTo(f);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
			System.out.println(e.getMessage());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}
	// 사진 업로드 창인 (changin-end)
		private void fileUpload(MultipartFile report, Board b) {
			File f = new File(
					"/Users/changin99/Documents/nurse/workspace/nurse2/WebContent/photo/"

					+ b.getJobno() + "_" + report.getOriginalFilename());
			// Users/changin99/Documents/nurse/workspace
			try {
				report.transferTo(f);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				// e.printStackTrace();
				System.out.println(e.getMessage());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				// e.printStackTrace();
				System.out.println(e.getMessage());
			}
		}
	
	/**
	 * 작성자:이진우
	 * @param board  id값만 인자값으로 받아드려서
	 * @return 0일때 Y값 아닐경우 N 값을 _write페이지로 비동기 처리함
	 * 아이디중복체크
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/emp.do", method = RequestMethod.POST)
	@ResponseBody
	public String idCheck(Board board) {
		// 아이디 중복쿼리
		System.out.println("여기타면 안됨...");
		int boardCount = boardService.nurseIdcheck(board);
		JSONObject jsonObj = new JSONObject();
		if (boardCount == 0) {
			jsonObj.put("id", "Y");
		} else {
			jsonObj.put("id", "N");
		} 
		return jsonObj.toString();
	}
	/**
	 * 작성자:이진우
	 * @param empVo
	 * @return json 형태로 넘어감
	 * 면허번호 중복체크 로직
	 */ 
	@SuppressWarnings("unchecked")
	@RequestMapping(params = "method=Cerch")
	@ResponseBody
	public String certNumCheck(EmpVo empVo) {

		int boardCount = empService.empSertNumCheck(empVo);
		JSONObject jsonObj = new JSONObject();
		System.out.println(boardCount);
		if (boardCount == 0) {
			jsonObj.put("certnum", "Y");
		} else {
			jsonObj.put("certnum", "N");
		}

		return jsonObj.toString();

	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/emp1.do", method = RequestMethod.POST)
	@ResponseBody
	public String fireDateNumCheck(EmpVo empVo,Model model) {
		//퇴사일이 입력되는 쿼리전송(jobno,firedate)
		System.out.println("ddd");
		empService.fireDateNumCheck(empVo);
		//(jobno전송)
		EmpVo firedate = empService.fireDateSelect(empVo); 
		model.addAttribute("firedate", firedate);
		JSONObject jsonObj = new JSONObject();
		
		if (firedate != null) {
			jsonObj.put("firedate", "Y");
		} else {
			jsonObj.put("firedate", "N");
		}

		return jsonObj.toString();

	}
	
}
