package loginDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.NamingException;

import jdbc.DBCPConnection;
import jdbc.JdbcUtil;
import loginDto.LoginDto;
import memberDao.MemberDao;

public class LoginDao {

public LoginDao() {
	
}
	
	@SuppressWarnings("unused")
	public String login(String id, String password) throws SQLException, NamingException {
		
		Connection conn = DBCPConnection.getConnection();
		PreparedStatement pstmt = null;

		
		LoginDto dto = new LoginDto(id,password);
		MemberDao medao = new MemberDao();
		String dbid = null;
		String dbpw = null;
		String id1 = dto.getId();
		String pw = dto.getPassword();
		String result = null;
		try {
			dbid = medao.idSelect(id1);
			dbpw = medao.passwordSelect(dbid);
			if(pw.equals(dbpw)){
				result = "1";
			}else if(!pw.equals(dbpw)){
				result = "0";

			}
		} catch (Exception e) {

		e.printStackTrace();
		
		}finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);

					}
		System.out.println("id1:"+id1);
		System.out.println("pw:"+pw);
		System.out.println("dbid:"+dbid);
		System.out.println("dbpw:"+dbpw);

		System.out.println("로그인할때 비밀번호 일치 확인:"+result);
		return result;
		
	}
	
	
	
}
