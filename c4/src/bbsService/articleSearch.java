package bbsService;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bbsDao.ArticleDao;
import bbsDto.Article;

/**
 * Servlet implementation class articleSearch
 */
@WebServlet("/articleSearch.do")
public class articleSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public articleSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	public void process(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{
	
		String viewpage = "";
		ArticleDao dao = new ArticleDao();
		try {
			ArrayList<Article> list =  dao.search(request.getParameter("search"));
			System.out.println("request°ª :  "+request.getParameter("search"));
			request.setAttribute("searchRS", list);
			viewpage = "searchResult.jsp";
			 RequestDispatcher dispatcher = request.getRequestDispatcher(viewpage);
			   
			  dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
}
