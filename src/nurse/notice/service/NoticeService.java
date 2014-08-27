package nurse.notice.service;

import java.util.ArrayList;

import nurse.notice.vo.Notice;
import nurse.notice.vo.UpFile;

public interface NoticeService {
	public ArrayList<Notice> getNoticeList(Notice n);
	public ArrayList<Notice> getNoticeList2(Notice n);
	public ArrayList<Notice> getNoticeList3(Notice n);
	public int getNoticeCount();
	public int getNoticeCount2();
	public int getTotalCount();
	public Notice getNoticeArticle(String sno);
	public void plusArticleCount(String sno);
	public Boolean insertArticle(Notice n);
	public Boolean insertArticlePlus(Notice n);
	public void deleteNoticeArticle(Notice n);
	public void updateNoticeArticle(Notice n);
	public void updateSameGroupSrtno(Notice n);
	public int getMaxNum();
	// 파일
	public void insertfile(UpFile f);
	public UpFile getFileList(String sno);
	public ArrayList<UpFile> getFileNum(UpFile f);
	public void deleteFile(String sno);
	public void fileUpdate(UpFile f);
}
