package bbsService;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bbsDao.ArticleDao;
import bbsDto.Article;

@WebServlet("/contentView.do")
public class contentView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

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
	
	public void process(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, NamingException, SQLException{
		request.setCharacterEncoding("utf-8");
		int bbsID = Integer.parseInt(request.getParameter("bbsID"));
		String viewapage = "";
		ArticleDao dao = new ArticleDao();
		dao.increaseReadCount(bbsID);
		try {
			Article bbs = new ArticleDao().getBbs(bbsID,true);
			request.setAttribute("article", bbs);
			viewapage = "/contentView.jsp?bbsID="+bbsID;
			 RequestDispatcher dispatcher = request.getRequestDispatcher(viewapage);
				dispatcher.forward(request, response);
				
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		
	}

}
