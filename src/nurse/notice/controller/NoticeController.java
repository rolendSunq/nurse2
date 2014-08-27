package nurse.notice.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import nurse.notice.service.NoticeMaker;
import nurse.notice.service.NoticeService;
import nurse.notice.vo.Notice;
import nurse.notice.vo.UpFile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller("noticeController")
@RequestMapping("/notice.do")
public class NoticeController {
	@Autowired(required = false)
	private NoticeService noticeService;
	@Autowired(required = false)
	private NoticeMaker noticeMaker;

	@RequestMapping(params = "method=list")
	public String list(Notice n, Model md, UpFile f) {
		int pageSelecter = 5;
		Notice notice = noticeMaker.makeNotice(noticeService, n);
		md.addAttribute("notice", notice);
		ArrayList<Notice> noticeList = noticeService.getNoticeList(n);
		ArrayList<Notice> noticeList2 = noticeService.getNoticeList2(n);
		md.addAttribute("noticeList", noticeList);
		md.addAttribute("noticeList2", noticeList2);
		ArrayList<UpFile> file = noticeService.getFileNum(f);
		md.addAttribute("file", file);
		md.addAttribute("pageSelecter", pageSelecter);
		return "main";
	}

	@RequestMapping(params = "method=news")
	public String news(Notice n, Model md, UpFile f) {
		int pageSelecter = 7;
		Notice notice = noticeMaker.makeNotice2(noticeService, n);
		md.addAttribute("notice2", notice);
		ArrayList<Notice> noticeList3 = noticeService.getNoticeList3(n);
		md.addAttribute("noticeList3", noticeList3);
		ArrayList<UpFile> file = noticeService.getFileNum(f);
		md.addAttribute("file", file);
		md.addAttribute("pageSelecter", pageSelecter);
		return "main";
	}

	@RequestMapping(params = "method=view")
	public String view(Notice n, Model md, String sno, String jobno)
			throws Exception {
		int pageSelecter = 11;
		Notice notice = noticeService.getNoticeArticle(n.getSno());
		notice.setArticlePerPage(n.getArticlePerPage());
		notice.setCurrentPage(n.getCurrentPage());
		md.addAttribute("notice", notice);
		UpFile file = noticeService.getFileList(sno);
		md.addAttribute("file", file);
		md.addAttribute("pageSelecter", pageSelecter);
		if (jobno != n.getJobno()) {
			noticeService.plusArticleCount(sno);
		}
		return "main";
	}

	@RequestMapping(params = "method=write")
	public String write(Notice n, Model md) throws Exception {
		int pageSelecter = 6;
		int maxnum = 1;
		if (noticeService.getTotalCount() != 0) {
			maxnum = noticeService.getMaxNum();
		}
		md.addAttribute("maxnum", maxnum);
		md.addAttribute("pageSelecter", pageSelecter);
		return "main";
	}

	@RequestMapping(params = "method=writeup")
	public String writeup(MultipartHttpServletRequest r, Model md, Notice n)
			throws Exception {
		noticeService.insertArticle(n);
		// ---- 파일 업로드 ----
		MultipartFile report = r.getFile("filename");
		if (report.getSize() != 0) {
			UpFile f = new UpFile();
			f.setFilename(n.getSno() + "_" + report.getOriginalFilename());
			f.setFno(r.getParameter("fno"));
			f.setSno(r.getParameter("sno"));
			fileUpload(report, n);
			noticeService.insertfile(f);
		}
		// ----------------------
		return "redirect:notice.do?method=list&articlePerPage="
				+ n.getArticlePerPage();
	}

	@RequestMapping(params = "method=delete")
	public String delete(Notice n, Model md) throws Exception {
		noticeService.deleteNoticeArticle(n);
		return "redirect:notice.do?method=list&articlePerPage="
				+ n.getArticlePerPage() + "&currentPage=" + n.getCurrentPage();
	}

	@RequestMapping(params = "method=deleteFile")
	public String deleteFile(Notice n, Model md, String sno) throws Exception {
		noticeService.deleteFile(sno);
		int pageSelecter = 8;
		Notice notice = noticeService.getNoticeArticle(n.getSno());
		notice.setArticlePerPage(n.getArticlePerPage());
		notice.setCurrentPage(n.getCurrentPage());
		md.addAttribute("notice", notice);
		md.addAttribute("pageSelecter", pageSelecter);
		return "main";
	}

	@RequestMapping(params = "method=edit")
	public String edit(Notice n, Model md, String sno) throws Exception {
		int pageSelecter = 8;
		Notice notice = noticeService.getNoticeArticle(n.getSno());
		notice.setArticlePerPage(n.getArticlePerPage());
		notice.setCurrentPage(n.getCurrentPage());
		UpFile file = noticeService.getFileList(sno);
		md.addAttribute("file", file);
		md.addAttribute("notice", notice);
		md.addAttribute("pageSelecter", pageSelecter);
		return "main";
	}

	@RequestMapping(params = "method=editup")
	public String editup(Notice n, Model md, MultipartHttpServletRequest r,
			String sno) throws Exception {
		noticeService.updateNoticeArticle(n);
		// ---- 파일 업로드 ----
		MultipartFile report = r.getFile("filename");
		UpFile f = new UpFile();
		UpFile file = noticeService.getFileList(sno);
		System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ>" + file);
		if (file == null) {
			if (!report.isEmpty()) {
				if (report.getSize() != 0) {
					f.setFilename(n.getSno() + "_"
							+ report.getOriginalFilename());
					f.setFno(r.getParameter("fno"));
					f.setSno(r.getParameter("sno"));
					fileUpload(report, n);
					noticeService.insertfile(f);
				}
			}
		}
		return "redirect:notice.do?method=view&articlePerPage="
				+ n.getArticlePerPage() + "&currentPage=" + n.getCurrentPage()
				+ "&sno=" + n.getSno();
	}

	@RequestMapping(params = "method=append")
	public String append(Notice n, Model md) throws Exception {
		int pageSelecter = 9;
		int maxnum = noticeService.getMaxNum();
		md.addAttribute("maxnum", maxnum);
		md.addAttribute("notice", n);
		md.addAttribute("pageSelecter", pageSelecter);
		return "main";
	}

	@RequestMapping(params = "method=appendup")
	public String appendup(Notice n, Model md, MultipartHttpServletRequest r)
			throws Exception {
		Notice bd = noticeService.getNoticeArticle(n.getGno());
		n.setGap((Integer.parseInt(bd.getGap()) + 1) + "");
		n.setGno(bd.getGno());
		n.setSrtno((Integer.parseInt(bd.getSrtno()) + 1) + "");

		noticeService.updateSameGroupSrtno(n);
		noticeService.insertArticlePlus(n);

		// ---- 파일 업로드 ----
		MultipartFile report = r.getFile("filename");
		if (report.getSize() != 0) {
			UpFile f = new UpFile();
			f.setFilename(n.getSno() + "_" + report.getOriginalFilename());
			f.setFno(r.getParameter("fno"));
			f.setSno(r.getParameter("sno"));
			fileUpload(report, n);
			noticeService.insertfile(f);
		}
		// --------------------
		return "redirect:notice.do?method=list&articlePerPage="
				+ n.getArticlePerPage() + "&currentPage=" + n.getCurrentPage();
	}

	private void fileUpload(MultipartFile report, Notice n) {
		File f = new File(
				"C:/Users/PC/workspace/nurse2/WebContent/file/"
						+ n.getSno() + "_" + report.getOriginalFilename());
		// D:/java/workspace/nurse2/WebContent/photo/
		// /Users/changin99/Documents/nurse/workspace/nurse2/WebContent/WEB-INF/jsp/notice/file/
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

	@RequestMapping(params = "method=filedown")
	public ModelAndView download(HttpServletRequest request) throws Exception {

		File downloadFile = new File(
				"C:/Users/PC/workspace/nurse2/WebContent/file/"
						+ request.getParameter("fileName"));
		// File downloadFile = new File("/Users/changin99/down/" +
		// request.getParameter("fileName"));
		return new ModelAndView("downloadView", "downloadFile", downloadFile);
	}
}
