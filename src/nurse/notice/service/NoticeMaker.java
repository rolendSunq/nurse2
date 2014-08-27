package nurse.notice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nurse.notice.vo.Notice;

@Service("noticeMaker")
public class NoticeMaker {

	@Autowired(required=false)
	private PagingManager2 pagingManager;
	
	public Notice makeNotice(NoticeService noticeService, Notice n){
		//전체 글 수 구하기
		
		int totalCount = noticeService.getNoticeCount();
		System.out.println(totalCount);
		n.setTotalCount(totalCount);
		
		//현재 페이지 구하기
		int currentPage = n.getCurrentPage()==0 ? 1 : n.getCurrentPage();
		n.setCurrentPage(currentPage);
		
		//페이지 당 표시 글 수
		int articlePerPage = n.getArticlePerPage();
		if (articlePerPage==0) {
			articlePerPage=10;
		}
		
		//검색쿼리 범위 값 설정
		//주의: boardList 조회쿼리 검색조건 > start 와 end 사용 > 따라서, 값이 없으면 boardList 값을 구할 수 없음
		n.setStart(pagingManager.getFirstArticleInPage(currentPage, articlePerPage));
		n.setEnd(pagingManager.getLastArticleInPage(currentPage, articlePerPage));
		
		//전체페이지 수 구하기
		int totalPage = pagingManager.getTotalPage(totalCount, articlePerPage);
		n.setTotalPage(totalPage);
		
		//블럭 당 표시 페이지 수, 시작 페이지, 끝 페이지 구하기
		int pagePerBlock = n.getPagePerBlock();
		n.setFirstPage(pagingManager.getFirstPageInBlock(totalPage, currentPage, pagePerBlock));
		n.setLastPage(pagingManager.getLastPageInBlock(totalPage, currentPage, pagePerBlock));
		
		return n;
	}
	public Notice makeNotice2(NoticeService noticeService, Notice n){
		//전체 글 수 구하기
		
		int totalCount = noticeService.getNoticeCount2();
		System.out.println(totalCount);
		n.setTotalCount(totalCount);
		
		//현재 페이지 구하기
		int currentPage = n.getCurrentPage()==0 ? 1 : n.getCurrentPage();
		n.setCurrentPage(currentPage);
		
		//페이지 당 표시 글 수
		int articlePerPage = n.getArticlePerPage();
		if (articlePerPage==0) {
			articlePerPage=10;
		}
		
		//검색쿼리 범위 값 설정
		//주의: boardList 조회쿼리 검색조건 > start 와 end 사용 > 따라서, 값이 없으면 boardList 값을 구할 수 없음
		n.setStart(pagingManager.getFirstArticleInPage(currentPage, articlePerPage));
		n.setEnd(pagingManager.getLastArticleInPage(currentPage, articlePerPage));
		
		//전체페이지 수 구하기
		int totalPage = pagingManager.getTotalPage(totalCount, articlePerPage);
		n.setTotalPage(totalPage);
		
		//블럭 당 표시 페이지 수, 시작 페이지, 끝 페이지 구하기
		int pagePerBlock = n.getPagePerBlock();
		n.setFirstPage(pagingManager.getFirstPageInBlock(totalPage, currentPage, pagePerBlock));
		n.setLastPage(pagingManager.getLastPageInBlock(totalPage, currentPage, pagePerBlock));
		
		return n;
	}	
}

