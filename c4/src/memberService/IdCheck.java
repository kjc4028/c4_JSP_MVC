package memberService;

import java.io.IOException;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memberDao.MemberDao;

@WebServlet("/idCheck.do")
public class IdCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	try {
		process(request, response);
	} catch (SQLException e) {
		e.printStackTrace();
	} catch (NamingException e) {
		e.printStackTrace();
	}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	public void process(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException, NamingException{
		
		request.setCharacterEncoding("UTF-8"); 

		String id = request.getParameter("id");
		MemberDao dao = new MemberDao();
		String a = dao.idCheck(id);
		System.out.println(id);
		System.out.println(a);
		String viewpage = null;
		try {
			if(a.equals("1")){
				viewpage = "canuseid.jsp";
				System.out.println("id사용가능");
			}else if(a.equals("2")){
				viewpage = "cantuseid.jsp";
				System.out.println("id 사용불가");

			}
			 RequestDispatcher dispatcher = request.getRequestDispatcher(viewpage);
			   
			  dispatcher.forward(request, response);
		} catch (Exception e) {
e.printStackTrace();
		}
		
	}
	
	
}
