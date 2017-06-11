package memberService;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memberDao.MemberDao;

@WebServlet("/memberDelete.do")
public class memberDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	public void process(HttpServletRequest request, HttpServletResponse response){

		String[] idcheck = request.getParameterValues("rowcheck");
		MemberDao dao = new MemberDao();
		String viewpage = "";

		try {
			for(int i =0; i<idcheck.length; i++){
				System.out.println(idcheck[i]+"È¸¿ø Å»Åð...");
				dao.memberDelete(idcheck[i]);
			}
			viewpage = "allSelectRs.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewpage);

			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}


	}
}
