package bbsService;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bbsDao.ArticleDao;

@WebServlet("/articleWrite.do")
public class articleWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	
	public void process(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		ArticleDao dao = new ArticleDao();
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		 HttpSession session = request.getSession();
		String a = (String) session.getAttribute("id2");
		 String viewpage = "";
		try {
			
			 dao.bbsInsert(title, content, a);
			 System.out.println(a);
			 System.out.println(title);
			 System.out.println(content);

			 viewpage = "bbsList.jsp";
			 RequestDispatcher dispatcher = request.getRequestDispatcher(viewpage);

				dispatcher.forward(request, response);
		} catch (Exception e) {

		e.printStackTrace();
		}
		
	}
	
	
	
}
