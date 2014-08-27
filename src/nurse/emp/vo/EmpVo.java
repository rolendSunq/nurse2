package nurse.emp.vo;

/**
 * @author 이진우 write 입력 순서:jobno/아이디/ 비번 /주민 /생일 /이름 /사진 /이메일 /성별 /우편번호 /기본주소
 *         /상세주소 /집전화 /핸드폰 /면허번호 /부서 /입사일
 */

public class EmpVo {

	private String certnum;
	private String id;
	private String pwd;
	private String ssn;
	private String birthday;
	private String jobno;
	private String name;
	private String photo;
	private String email;
	private String sex;
	private String zipcode;
	private String address1;
	private String address2;
	private String phone;
	private String cellphone;
	private String dno;
	private String hiredate;
	private String menuno;
	private String firedate;
	private String state;

	
	
	private int start;
	private int end;
	private int currentPage; //pageNum
	private int totalCount; //count
	private int totalPage;
	private int pagePerBlock;
	private int articlePerPage; //default pageSize
	private int firstPage;
	private int lastPage;
	
	public EmpVo(){}
	public EmpVo(int pagePerBlock, int articlePerPage){
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

	public String getSsn() {
		return ssn;
	}

	public void setSsn(String ssn) {
		this.ssn = ssn;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
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

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCellphone() {
		return cellphone;
	}

	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}

	public String getDno() {
		return dno;
	}

	public void setDno(String dno) {
		this.dno = dno;
	}

	public String getCertnum() {
		return certnum;
	}

	public void setCertnum(String certnum) {
		this.certnum = certnum;
	}

	public String getHiredate() {
		return hiredate;
	}

	public void setHiredate(String hiredate) {
		this.hiredate = hiredate;
	}

	public String getMenuno() {
		return menuno;
	}

	public void setMenuno(String menuno) {
		this.menuno = menuno;
	}
	public String getFiredate() {
		return firedate;
	}
	public void setFiredate(String firedate) {
		this.firedate = firedate;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}

}
