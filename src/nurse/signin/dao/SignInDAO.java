package nurse.signin.dao;

import nurse.signin.model.SignInVO;

public interface SignInDAO {
	public int idCheck(String id);
	public int ssnCheck(String pwd);
	public int emailCheck(String email);
	public void insertMember(SignInVO signInVO);
	public int newestJobno();
}
