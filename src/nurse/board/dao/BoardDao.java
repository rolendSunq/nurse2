package nurse.board.dao;

import java.util.ArrayList;

import nurse.board.vo.Board;

public interface BoardDao {
	public int nurseIdcheck(Board b);
	public ArrayList<Board> getBoardList(Board b);
	public ArrayList<Board> getEmpList(Board b);
	public ArrayList<Board> getEmpMenuauthList(Board b);
	public void insertArticle(Board b);
	public void empInsertArticle(Board b);
	public void insertEmpArticle(Board b);
	public void empInsetauth(Board b);
	public void insertArticlePlus(Board b); //��湲��낅젰
	public Board getBoardArticle(String num);
	public Board getEmpArticle(String num);
	public int getBoardCount();
	public int getEmpCount();
	public int getEmpMaxNum();
	public void deleteEmpArticle(Board b);
	public void deleteAuth(Board b);
	public void plusArticleCount(String num); //議고쉶 ��利앷�
	public void deleteBoardArticle(Board b);
	public void updateBoardArticle(Board b);
	public void updateEmpArticle(Board b);
	public void updateSameGroupSrtno(Board b); //��湲��낅젰 ���뺣젹踰덊샇 �섏젙
	
}
