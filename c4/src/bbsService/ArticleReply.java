package bbsService;

import java.io.IOException;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bbsDao.ArticleDao;

/**
 * Servlet implementation class ArticleReply
 */
@WebServlet("/ArticleReply.do")
public class ArticleReply extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ArticleReply() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			process(request, response);
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	public void process(HttpServletRequest request, HttpServletResponse response) throws IOException, NamingException, SQLException, ServletException{
		request.setCharacterEncoding("utf-8");

		System.out.println("´äº¯ ¼­ºí¸´");
		ArticleDao dao = new ArticleDao();
	String name = request.getParameter("writer_name");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String bGroup = request.getParameter("bGroup");
	String bStep = request.getParameter("bStep");
	String bIndent = request.getParameter("bIndent");
	 String viewpage = "";

	 
	dao.reply(name, title, content, bGroup, bStep, bIndent);
	 
	viewpage = "bbsList.jsp";
	 RequestDispatcher dispatcher = request.getRequestDispatcher(viewpage);

		dispatcher.forward(request, response);

	
	}
}
