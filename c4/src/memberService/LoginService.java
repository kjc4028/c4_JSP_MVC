package memberService;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import loginDao.LoginDao;


@WebServlet("/loginAction.do")
public class LoginService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginService() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	try {
		process(request, response);
	} catch (SQLException e) {
		e.printStackTrace();
	}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	public void process(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException{

		String viewpage = null;
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
	
		LoginDao logdao = new LoginDao();
		try {
			System.out.println("받은 아이디값"+id);
			System.out.println("받은비번값"+password);
			String a = logdao.login(id, password);
			System.out.println("a:"+a);
			if(a.equals("1")){
				viewpage = "loginSuccess.jsp";
				
			}else if(a.equals("0")){
				viewpage = "loginFail.jsp";

			}
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewpage);

			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}


	}






	//막대
}
