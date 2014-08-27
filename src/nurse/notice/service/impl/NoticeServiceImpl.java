package nurse.notice.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Service;

import nurse.notice.dao.NoticeDao;
import nurse.notice.service.NoticeService;
import nurse.notice.vo.Notice;
import nurse.notice.vo.UpFile;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{
	@Autowired(required=false)
	private NoticeDao noticeDao;
	@Override
	public ArrayList<Notice> getNoticeList(Notice n) {
		// TODO Auto-generated method stub
		return noticeDao.getNoticeList(n);
	}
	@Override
	public ArrayList<Notice> getNoticeList2(Notice n) {
		// TODO Auto-generated method stub
		return noticeDao.getNoticeList2(n);
	}	
	public ArrayList<Notice> getNoticeList3(Notice n) {
		// TODO Auto-generated method stub
		return noticeDao.getNoticeList3(n);
	}
	@Override
	public int getNoticeCount() {
		// TODO Auto-generated method stub
		return noticeDao.getNoticeCount();
	}
	@Override
	public int getNoticeCount2() {
		// TODO Auto-generated method stub
		return noticeDao.getNoticeCount2();
	}
	@Override
	public Notice getNoticeArticle(String sno) {
		// TODO Auto-generated method stub 
		return noticeDao.getNoticeArticle(sno);
	}

	@Override
	public void plusArticleCount(String sno) {
		// TODO Auto-generated method stub
		 noticeDao.plusArticleCount(sno);
	}

	@Override
	public Boolean insertArticle(Notice n) {
		// TODO Auto-generated method stub
		n.setContent(n.getContent().replace("\r\n","<br>"));
		noticeDao.insertArticle(n);
		return true;
	}

	@Override
	public void deleteNoticeArticle(Notice n) {
		// TODO Auto-generated method stub
		noticeDao.deleteNoticeArticle(n);
	}

	@Override
	public void updateNoticeArticle(Notice n) {
		// TODO Auto-generated method stub
		noticeDao.updateNoticeArticle(n);
	}

	@Override
	public Boolean insertArticlePlus(Notice n) {
		// TODO Auto-generated method stub
		n.setContent(n.getContent().replace("\r\n","<br>"));
		noticeDao.insertArticlePlus(n);
		return true;
	}

	@Override
	public void updateSameGroupSrtno(Notice n) {
		// TODO Auto-generated method stub
		noticeDao.updateSameGroupSrtno(n);
	}

	@Override
	public void insertfile(UpFile f) {
		// TODO Auto-generated method stub
		noticeDao.insertfile(f);
	}

	@Override
	public UpFile getFileList(String sno) {
		// TODO Auto-generated method stub
		return noticeDao.getFileList(sno);
	}

	@Override
	public int getMaxNum() {
		// TODO Auto-generated method stub
		return noticeDao.getMaxNum();
	}

	@Override
	public void deleteFile(String sno) {
		// TODO Auto-generated method stub
		noticeDao.deleteFile(sno);
	}

	@Override
	public void fileUpdate(UpFile f) {
		// TODO Auto-generated method stub
		noticeDao.fileUpdate(f);
	}
	@Override
	public ArrayList<UpFile> getFileNum(UpFile f) {
		// TODO Auto-generated method stub
		return noticeDao.getFileNum(f);
	}
	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return noticeDao.getTotalCount();
	}

}
