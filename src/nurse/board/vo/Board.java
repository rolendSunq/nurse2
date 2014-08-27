package nurse.board.vo;

import java.io.Serializable;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class Board implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private String num;
	private String writer;
	private String email;
	private String subject;
	private String pass;
	private String readcount;
	private String ref; //�ъ슜 ����
	private String step; //�ъ슜 ����
	private String depth; //�ъ슜 ����
	private String regdate;
	private String content;
	private String ip;
	private String filename;
	
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
	
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public Board(){}
	public Board(int pagePerBlock, int articlePerPage){
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
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getReadcount() {
		return readcount;
	}
	public void setReadcount(String readcount) {
		this.readcount = readcount;
	}
	public String getRef() {
		return ref;
	}
	public void setRef(String ref) {
		this.ref = ref;
	}
	public String getStep() {
		return step;
	}
	public void setStep(String step) {
		this.step = step;
	}
	public String getDepth() {
		return depth;
	}
	public void setDepth(String depth) {
		this.depth = depth;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIp() {
		if (ip==null) {
			InetAddress inetAddress;
			try {
				inetAddress = InetAddress.getLocalHost();
				ip = inetAddress.getHostName()+"/"+inetAddress.getHostAddress();
			} catch (UnknownHostException e) {
				System.out.println(e.getMessage());
			}
			finally{
				ip="";
			}
		}
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
	private String gno="0";
	private String ccnt="0"; //does not use
	private String srtno="1";
	private String gap="0";

	public String getGno() {
		if (gno==null) {
			gno="0";
		}
		return gno;
	}
	public void setGno(String gno) {
		this.gno = gno;
	}
	public String getCcnt() {
		if (ccnt==null) {
			ccnt="0";
		}
		return ccnt;
	}
	public void setCcnt(String ccnt) {
		this.ccnt = ccnt;
	}
	public String getSrtno() {
		if (srtno==null) {
			srtno="1";
		}
		return srtno;
	}
	public void setSrtno(String srtno) {
		this.srtno = srtno;
	}
	public String getGap() {
		if (gap==null) {
			gap="0";
		}
		return gap;
	}
	public void setGap(String gap) {
		this.gap = gap;
	}
	
	public static void main(String[] args){
		//TODO:�섎뒗 濡쒖쭅 援ъ꽦
		String ip="";
		if (ip.equals("")) {
			InetAddress inetAddress;
			try {
				inetAddress = InetAddress.getLocalHost();
				ip = inetAddress.getHostName()+"/"+inetAddress.getHostAddress();
			} catch (UnknownHostException e) {
				System.out.println(e.getMessage());
			}
			finally{
				ip="";
			}
		}
		System.out.println("ip >> "+ip);
	}
	
	
	
	//////////////////////////EmpList/////////////////////////////
	private String name;  /* name */
	private String dno;  /* 부서번호 000 */
	private String id;  /* id 000*/
	private String pwd;  /* pwd 000*/
	private String phone;  /* phone 000*/
	private String telecom;  /* telecom 000*/
	private String cellphone;  /* cellphone 000*/
	private String state;  /* 수간호사냐 일반간호사냐 */
	private String photo;  /* photo */
	private String ssn;  /* 주민번호 */
	private String sex;  /* 1:남자, 2:여자 */
	private String zipcode;  /* zipcode */
	private String address1;  /* address1 */
	private String address2;  /* address2 */
	private String hiredate;  /*입사일 */
	private String certnum;  /* 면허번호 000중복체크*/
	private String birthday;  /* birthday */
	private String firedate;  /* 퇴직일 */
	private String dowork;  /* 1:재직 0:퇴직 */
	private String manager;  /* manager's jobno */
	private String jobno;  /* 예전넘버 000*/
	
	//=========================================//
	private String menuno;
	
	
	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getJobno() {
		return jobno;
	}
	public void setJobno(String jobno) {
		this.jobno = jobno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDno() {
		return dno;
	}
	public void setDno(String dno) {
		this.dno = dno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getTelecom() {
		return telecom;
	}
	public void setTelecom(String telecom) {
		this.telecom = telecom;
	}
	public String getCellphone() {
		return cellphone;
	}
	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getSsn() {
		return ssn;
	}
	public void setSsn(String ssn) {
		this.ssn = ssn;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getHiredate() {
		return hiredate;
	}
	public void setHiredate(String hiredate) {
		this.hiredate = hiredate;
	}
	public String getCertnum() {
		return certnum;
	}
	public void setCertnum(String certnum) {
		this.certnum = certnum;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getFiredate() {
		return firedate;
	}
	public void setFiredate(String firedate) {
		this.firedate = firedate;
	}
	public String getDowork() {
		return dowork;
	}
	public void setDowork(String dowork) {
		this.dowork = dowork;
	}
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	public String getMenuno() {
		return menuno;
	}
	public void setMenuno(String menuno) {
		this.menuno = menuno;
	}

	
	
	
}
