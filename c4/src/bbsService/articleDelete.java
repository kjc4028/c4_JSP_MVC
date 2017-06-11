package bbsService;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bbsDao.ArticleDao;

@WebServlet("/articleDelete.do")
public class articleDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	public void process(HttpServletRequest request, HttpServletResponse response) throws IOException{
		ArticleDao dao = new ArticleDao();
		String viewpage = "";
		String[] scheck = request.getParameterValues("rowcheck");
		try {
			for(int i=0; i<scheck.length; i++){
				System.out.println(scheck[i]+"번 게시물 삭제...");
				dao.bbsDelete(scheck[i]);
			}
			viewpage = "bbsList.jsp";
			 RequestDispatcher dispatcher = request.getRequestDispatcher(viewpage);
			   
			  dispatcher.forward(request, response);
		
		} catch (Exception e) {
		e.printStackTrace();
		}
		
	}
}
