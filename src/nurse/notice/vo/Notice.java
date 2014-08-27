package nurse.notice.vo;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;


import org.springframework.web.multipart.MultipartFile;

public class Notice {
		
//	sno number(7) NOT NULL, /* sno */
//	name VARCHAR2(60) NOT NULL, /* name */
//	subject VARCHAR2(200), /* subject */
//	readcount number(6), /* readcount */
//	gno number(7), /* gno */
//	srtno number(4), /* srtno */
//	gap number(3), /* gap */
//	regdate timestamp, /* regdate */
//	content varchar2(4000), /* content */
//	flag char(1), /* 1:공지, 0:일반글 */
//	jobno number(5) /* jobno */
	private String sno;
	private String name;
	private String subject;
	private String readcount;
	private String gno;
	private String srtno;
	private String gap;
	private String regdate;
	private String content;
	private String flag;
	private String jobno;
	

//TODO: 파일을 여러개 업로드
//	private String filename;
//	private String fno;
	
	
// /////////////////////////////////
	private int start;
	private int end;
	private int currentPage; //pageNum
	private int totalCount; //count
	private int totalPage;
	private int pagePerBlock;
	private int articlePerPage; //default pageSize
	private int firstPage;
	private int lastPage;
	
	private DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private Date date = new Date();
	private String[] nowDateAry = dateFormat.format(date).split(" ");
	
	public Notice(){}
	public Notice(int pagePerBlock, int articlePerPage){
		this.pagePerBlock = pagePerBlock;
		this.articlePerPage = articlePerPage;
	}
	
	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}
	public int getFirstPage() {
		return firstPage;
	}
	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}
	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	public void setArticlePerPage(int articlePerPage) {
		this.articlePerPage = articlePerPage;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getTotalPage() {
		if (totalPage==0) {
			totalPage=1;
		}
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getCurrentPage() {
		if (currentPage==0) {
			currentPage=1;
		}
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getPagePerBlock() {
		if (pagePerBlock==0) {
			pagePerBlock=5;
		}
		return pagePerBlock;
	}
	public int getArticlePerPage() {
		if (articlePerPage==0) {
			articlePerPage=10;
		}
		return articlePerPage;
	}
	
	
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getReadcount() {
		return readcount;
	}
	public void setReadcount(String readcount) {
		this.readcount = readcount;
	}
	public String getGno() {
		return gno;
	}
	public void setGno(String gno) {
		this.gno = gno;
	}
	public String getSrtno() {
		return srtno;
	}
	public void setSrtno(String srtno) {
		this.srtno = srtno;
	}
	public String getGap() {
		return gap;
	}
	public void setGap(String gap) {
		this.gap = gap;
	}

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getJobno() {
		return jobno;
	}
	public void setJobno(String jobno) {
		this.jobno = jobno;
	}

	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		
		String[] articleDateAry = regdate.split(" ");
		if (nowDateAry[0].trim().equals(articleDateAry[0].trim())) {
			//show time instead day
			this.regdate = articleDateAry[1];
		} else {
			this.regdate = articleDateAry[0];
		}
		
	}

}
