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
 * Servlet implementation class ArticleModifyAction
 */
@WebServlet("/ArticleModifyAction.do")
public class ArticleModifyAction extends HttpServlet implements JCInterface {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArticleModifyAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
     * @see JCInterface#process(HttpServletRequest, HttpServletResponse)
     */
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
process(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public void process(HttpServletRequest request, HttpServletResponse response)  { 
        // TODO Auto-generated method stub
		
		try {
			request.setCharacterEncoding("UTF-8");
			String bbsID = request.getParameter("bbsID");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String viewpage = "";
			ArticleDao dao = new ArticleDao();
			dao.bbsModify(bbsID, title, content);
			 
			viewpage = "bbsList.jsp";
			 RequestDispatcher dispatcher = request.getRequestDispatcher(viewpage);

				dispatcher.forward(request, response);
			
		} catch (Exception e) {
e.printStackTrace();
			}
   }


}
