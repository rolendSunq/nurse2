package nurse.notice.dao;

import java.util.ArrayList;


import org.springframework.stereotype.Service;

import nurse.board.vo.Board;
import nurse.notice.vo.Notice;
import nurse.notice.vo.UpFile;

@Service("noticeDao")
public interface NoticeDao {
	public ArrayList<Notice> getNoticeList(Notice n);
	public ArrayList<Notice> getNoticeList2(Notice n);
	public ArrayList<Notice> getNoticeList3(Notice n);
	public int getNoticeCount();
	public int getNoticeCount2();
	public int getTotalCount();
	public Notice getNoticeArticle(String sno);
	public void plusArticleCount(String sno);
	public void insertArticle(Notice n);
	public void insertArticlePlus(Notice n);
	public void deleteNoticeArticle(Notice n);
	public void updateNoticeArticle(Notice n);
	public void updateSameGroupSrtno(Notice n);
	public int getMaxNum();
	// 파일
	public void insertfile(UpFile f);
	public UpFile getFileList(String sno);//파일명 가져오기
	public ArrayList<UpFile> getFileNum(UpFile f); //파일sno
	public void deleteFile(String sno);
	public void fileUpdate(UpFile f);

	
}
