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
import bbsDto.Article;

/**
 * Servlet implementation class ArticleReplyForm
 */
@WebServlet("/ArticleReplyForm.do")
public class ArticleReplyForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ArticleReplyForm() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			process(request, response);
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public void process(HttpServletRequest request, HttpServletResponse response) throws IOException, NamingException, SQLException, ServletException{
		String viewapage = "";
		ArticleDao dao = new ArticleDao();
		int bbsID = Integer.parseInt(request.getParameter("bbsID"));
		try {
			Article bbs = new ArticleDao().getBbs(bbsID,true);
			request.setAttribute("article", bbs);
			viewapage = "/bbsReply.jsp?bbsID="+bbsID;
			 RequestDispatcher dispatcher = request.getRequestDispatcher(viewapage);
				dispatcher.forward(request, response);
				
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
