package bbsDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.NamingException;


import bbsDto.Article;
import bbsService.articleDelete;
import jdbc.DBCPConnection;
import jdbc.JdbcUtil;


public class ArticleDao {

	public ArticleDao() {

	}

	public int totalBbs() throws NamingException, SQLException{
		Connection conn = DBCPConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement("select count(*) from article");
			rs = pstmt.executeQuery();
			result = rs.getInt(1);
		} catch (Exception e) {
e.printStackTrace();	
}
		return result;
		
	}
	
	public void bbsInsert(String title, String content, String userID) throws NamingException, SQLException{
		Connection conn = DBCPConnection.getConnection();
		PreparedStatement pstmt = null;

		try {
			pstmt=conn.prepareStatement("insert into article values(?,?,?,?,?,?)");
			pstmt.setInt(1, getNext());
			pstmt.setString(2, userID);
			pstmt.setString(3, title);
			pstmt.setTimestamp(4, date());
			pstmt.setInt(5, 1);
			pstmt.setString(6, content);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);

		}


	}

	public ArrayList<Article> search(String title) throws NamingException, SQLException{
		Connection conn = DBCPConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Article> list = new ArrayList<Article>();
		String SQL = "select * from article where title like ?; ";
		try {
			System.out.println("검색 dao 수행");
			pstmt = conn.prepareStatement(SQL);
			 pstmt.setString(1, '%'+title+'%');
			 rs = pstmt.executeQuery();
			 System.out.println(pstmt);
		if(rs.next()){
			Article dto = new Article();
			dto.setBbsID(rs.getInt(1));
			dto.setUserID(rs.getString(2));
			dto.setTitle(rs.getString(3));
			dto.setRegdate(rs.getTimestamp(4));
			dto.setReadcnt(rs.getInt(5));
			dto.setContent(rs.getString(6));
			list.add(dto);
		}
			
		} catch (Exception e) {
e.printStackTrace();
}finally {
	JdbcUtil.close(rs);
	JdbcUtil.close(pstmt);
	JdbcUtil.close(conn);

}
		return list;
		
	}
	

	public int getNext() throws NamingException, SQLException{
		Connection conn = DBCPConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int bNum = 1;
		try {
			pstmt = conn.prepareStatement("select bbsID from article order by bbsID desc");
			rs = pstmt.executeQuery();
			if(rs.next()){
				bNum= rs.getInt(1)+1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);

		}
		return bNum;

	}

	public Timestamp date() throws NamingException, SQLException{
		Connection conn = DBCPConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select now()");
			rs = pstmt.executeQuery();
			if(rs.next()){
				return rs.getTimestamp(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);

		}
		return null;
		
	}

	public ArrayList<Article> getList(int pageNumber) throws NamingException, SQLException{
		String SQL = "select * from article where bbsID < ? order by bbsID desc limit 10";
		Connection conn = DBCPConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Article> list = new ArrayList<Article>();
		try{	
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()-(pageNumber-1)*10);
			rs = pstmt.executeQuery();

			while(rs.next()){
				Article dto = new Article();
				dto.setBbsID(rs.getInt(1));
				dto.setUserID(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setRegdate(rs.getTimestamp(4));
				dto.setReadcnt(rs.getInt(5));
				dto.setContent(rs.getString(6));
				list.add(dto);

			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);

		}
		return list;
	}

	public boolean nextPage(int pageNumber) throws NamingException, SQLException{
		String SQL = "select * from article where bbsID < ? ";
		Connection conn = DBCPConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{	
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()-(pageNumber-1)*10);
			rs = pstmt.executeQuery();

			while(rs.next()){
				return true;

			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);

		}
		return false;
	}

	public Article getBbs(int bbsID, boolean aa) throws NamingException, SQLException{
		Connection conn = DBCPConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		Article dto = new Article();
		try{
			pstmt = conn.prepareStatement("select * from article where bbsID =?");
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
		

			if(rs.next()){
				dto.setBbsID(rs.getInt(1));
				dto.setUserID(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setRegdate(rs.getTimestamp(4));
				dto.setReadcnt(rs.getInt(5));
				dto.setContent(rs.getString(6));
				return dto;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);

		}
		return dto;
	}

	public void increaseReadCount(int no) throws NamingException, SQLException{
		Connection conn = DBCPConnection.getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("update article set read_cnt = read_cnt + 1 where bbsID = ?");
			pstmt.setInt(1, no);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);

		}
	}

	public void bbsDelete(String scheck) throws NamingException, SQLException{
		Connection conn = DBCPConnection.getConnection();
		PreparedStatement pstmt = null;

		try {
			for(int i = 0; i < 10; i++){
				pstmt = conn.prepareStatement("delete from article where bbsID = ?");
				pstmt.setString(1, scheck);
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);

		}

	}

	//막대
}
