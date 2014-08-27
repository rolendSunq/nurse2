package nurse.board.service;

import java.util.ArrayList;

import nurse.board.vo.Board;

public interface BoardService {
	public int nurseIdcheck(Board b);
	public ArrayList<Board> getBoardList(Board b);
	public ArrayList<Board> getEmpMenuauthList(Board b);
	public Boolean insertArticle(Board b);
	public void insertEmpArticle(Board b);
	public Boolean insertArticlePlus(Board b);
	public Board getBoardArticle(String num);
	public Board getEmpArticle(String num);
	public int getBoardCount();
	public int getEmpCount();
	public void plusArticleCount(String num);
	public void deleteBoardArticle(Board b);
	public void updateBoardArticle(Board b);
	public void updateSameGroupSrtno(Board b);
	public void updateEmpArticle(Board b);
	public ArrayList<Board> getEmpList(Board b);
	public void empInsertArticle(Board b);
	public void empInsetauth(Board b);
	public int getEmpMaxNum();
	public void deleteEmpArticle(Board b);
	public void deleteAuth(Board b);
	
}
