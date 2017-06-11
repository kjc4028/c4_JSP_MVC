package memberService;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memberDao.MemberDao;

@WebServlet("/joinAction.do")
public class JoinService extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void process(HttpServletRequest request, HttpServletResponse response){
		String url =request.getRequestURL().toString();
		String viewpage = null;
		try {
			request.setCharacterEncoding("utf-8");
			
			if(url.indexOf("joinAction.do") != -1){
				String name = request.getParameter("name");
				String id = request.getParameter("id");
				String password = request.getParameter("password");
				
				MemberDao dao = new MemberDao();
				
				String a = dao.idCheck(id);
				System.out.println(a);
				System.out.println(id);

				if(a.equals("1")){
					dao.join(name, id, password);
				viewpage = "/joinSuccess.jsp";
				}
				else if(a.equals("2")){
					viewpage = "/joinFail.jsp";
				}else{
					viewpage = "/index.jsp";

				}
			}
			 RequestDispatcher dispatcher = request.getRequestDispatcher(viewpage);
			   
			  dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	

	
//¸·´ë
}
