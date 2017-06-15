package bbsService;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bbsDao.ArticleDao;
import util.JCInterface;

/**
 * Servlet implementation class ArticleSelfDelete
 */
@WebServlet("/ArticleSelfDelete.do")
public class ArticleSelfDelete extends HttpServlet implements JCInterface {
	private static final long serialVersionUID = 1L;
       
    public ArticleSelfDelete() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	
	  public void process(HttpServletRequest request, HttpServletResponse response)  { 
	 
		  try {
			  String viewpage = "";
			  String bbsID = request.getParameter("bbsID");
			  ArticleDao dao = new ArticleDao();
			  dao.bbsDelete(bbsID);
			  viewpage = "bbsList.jsp";
				 RequestDispatcher dispatcher = request.getRequestDispatcher(viewpage);
				   
				  dispatcher.forward(request, response);
		
	} catch (Exception e) {
		e.printStackTrace();
	} 
	  
	  }

}
