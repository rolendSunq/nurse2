package nurse.board.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nurse.board.dao.BoardDao;
import nurse.board.service.BoardService;
import nurse.board.vo.Board;

@Service("boardSerivce")
public class BoardServiceImpl implements BoardService{

	@Autowired(required=false)
	private BoardDao boardDao;
	
	@Override
	public ArrayList<Board> getBoardList(Board b) {
		
		return boardDao.getBoardList(b);
	}

	@Override
	public Boolean insertArticle(Board b) {
//		1. select max(sno)+1 maxno from notice
//		2. insert into notice values(
//		maxno,'한효주','안녕하세요!',0,maxno,1,0,sysdate,'좋은 하루 보내세요~!<br><br>끝.','0',4);
//		3. insert into upfile values(maxno,1,'간호사업무매뉴얼');
		
		//1.
		//maxno
		
		//2.
		b.setContent(b.getContent().replace("\r\n","<br>"));
		boardDao.insertArticle(b);
		
		//3.
		
		return true;
	}
	
	@Override
	public Boolean insertArticlePlus(Board b) {
		//以�諛붽퓞
		b.setContent(b.getContent().replace("\r\n","<br>"));
		boardDao.insertArticlePlus(b);
		return true;
	}

	@Override
	public Board getBoardArticle(String num) {
		//寃뚯떆湲�쓣 媛�졇�ㅻ㈃��議고쉶移댁슫��1利앷�
		plusArticleCount(num);
		return boardDao.getBoardArticle(num);
	}

	@Override
	public int getBoardCount() {
		return boardDao.getBoardCount();
	}

	@Override
	public void plusArticleCount(String num) {
		boardDao.plusArticleCount(num);
	}

	@Override
	public void deleteBoardArticle(Board b) {
		boardDao.deleteBoardArticle(b);
	}

	@Override
	public void updateBoardArticle(Board b) {
		b.setContent(b.getContent().replace("\r\n","<br>"));
		boardDao.updateBoardArticle(b);
	}

	@Override
	public void updateSameGroupSrtno(Board b) {
		boardDao.updateSameGroupSrtno(b);
	}

	@Override
	public ArrayList<Board> getEmpList(Board b) {
		// TODO Auto-generated method stub
		return boardDao.getEmpList(b);
	}

	@Override
	public void insertEmpArticle(Board b) {
		// TODO Auto-generated method stub
		boardDao.insertArticle(b);
		
	}

	@Override
	public Board getEmpArticle(String num) {
		// TODO Auto-generated method stub
		return boardDao.getEmpArticle(num);
	}
 
	@Override
	public void empInsertArticle(Board b) {
		// TODO Auto-generated method stub
		boardDao.empInsertArticle(b);
	}

	@Override
	public int getEmpMaxNum() {
		// TODO Auto-generated method stub
		return boardDao.getEmpMaxNum();
	}

	@Override
	public void deleteEmpArticle(Board b) {
		// TODO Auto-generated method stub
		boardDao.deleteEmpArticle(b);
	}

	@Override
	public void updateEmpArticle(Board b) {
		// TODO Auto-generated method stub
		boardDao.updateEmpArticle(b);
		
	}

	@Override
	public int getEmpCount() {
		// TODO Auto-generated method stub
		return boardDao.getEmpCount();
	}

	@Override
	public void empInsetauth(Board b) {
		// TODO Auto-generated method stub
		 boardDao.empInsetauth(b);
	}

	@Override
	public ArrayList<Board> getEmpMenuauthList(Board b) {
		// TODO Auto-generated method stub
		return boardDao.getEmpMenuauthList(b);
	}

	@Override
	public int nurseIdcheck(Board b) {
		// TODO Auto-generated method stub
		return boardDao.nurseIdcheck(b);
	}

	@Override
	public void deleteAuth(Board b) {
		// TODO Auto-generated method stub
		boardDao.deleteAuth(b);
	}
	

}
