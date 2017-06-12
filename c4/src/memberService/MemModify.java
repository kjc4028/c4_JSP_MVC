package memberService;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memberDao.MemberDao;

/**
 * Servlet implementation class MemModify
 */
@WebServlet("/MemModify.do")
public class MemModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemModify() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	try {
		process(request, response);
	} catch (NamingException | SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	@SuppressWarnings("null")
	public void process(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, NamingException, SQLException{
		
		
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		String id = request.getParameter("id");

		System.out.println(name + id);
		String viewapage = "";

		try {
			MemberDao dao = new MemberDao();
			dao.memberModify(name, id);
			
			viewapage = "index.jsp";
			 RequestDispatcher dispatcher = request.getRequestDispatcher(viewapage);
				
				dispatcher.forward(request, response);
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}
	}

}
