package memberDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.NamingException;

import jdbc.DBCPConnection;
import jdbc.JdbcUtil;
import memberDto.MemberDto;

public class MemberDao {




	public MemberDao() {

	}

	public ArrayList<MemberDto> memberSelect() throws NamingException, SQLException{


		ArrayList<MemberDto> dtos = new ArrayList<MemberDto>();
		Connection conn = DBCPConnection.getConnection();
		Statement stmt = null;
		ResultSet rs = null;

		try{
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from member");

			while(rs.next()){
				String name = rs.getString("name");
				String id = rs.getString("id");
				String password = rs.getString("password");

				MemberDto dto = new MemberDto(name, id, password);
				dtos.add(dto);
			}

		}catch (Exception e){
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
			JdbcUtil.close(conn);

		}

		return dtos;
	}
	//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	public void join(String name, String id, String password) throws SQLException, NamingException{
		Connection conn = DBCPConnection.getConnection();
		PreparedStatement pstmt = null;


		try {
			pstmt=conn.prepareStatement("insert into member values(?,?,?)");
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			pstmt.setString(3, password);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);

		}




	}


	public String idCheck(String id) throws SQLException, NamingException{
		Connection conn = DBCPConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String result = null;

		try {
			pstmt=conn.prepareStatement("select id from member where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if(rs.next()){
				String id2 = rs.getString("id");
				System.out.println("중복!db에 있는 값"+id2);
				if(id.equals(id2)){
					result = "2";
				}

			}else if(id == null){
				result = "0";
			}else{

				System.out.println("중복 아이디 없음.");
				result = "1";

			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);

		}
		return result;

	}

	public String idSelect(String id) throws SQLException, NamingException{
		Connection conn = DBCPConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String result = null;

		try {
			pstmt=conn.prepareStatement("select id from member where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				result = rs.getString("id");
				System.out.println("로그인 할 아이디 :"+id);
			}else{
				System.out.println("아이디 없음");


			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);

		}
		return result;

	}

	public String passwordSelect(String id) throws SQLException, NamingException{
		Connection conn = DBCPConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String result = null;

		try {
			pstmt=conn.prepareStatement("select password from member where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				result = rs.getString("password");
				System.out.println("로그인 할 비밀번호:"+result);
			}else{
				System.out.println("비번 없음");

			}


		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);

		}
		return result;

	}

	public void memberDelete(String id) throws NamingException, SQLException{
		Connection conn = DBCPConnection.getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt=conn.prepareStatement("delete from member where id= ?");
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);

		}
	}
	//마지막 대괄호
}
