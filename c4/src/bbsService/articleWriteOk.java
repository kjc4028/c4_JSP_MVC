package bbsService;

import java.io.IOException;
import java.io.PrintStream;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/goWrite.do")
public class articleWriteOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	
	public void process(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{
		 HttpSession session = request.getSession();
		String a = (String) session.getAttribute("id2");
		 String viewpage = "";
		try {
			System.out.println(a);
			if(a != null){
			 viewpage = "bbsWrite.jsp";
			
			}else if( a == null){
				
				viewpage = "loginForm.jsp";
				 
			}
			 RequestDispatcher dispatcher = request.getRequestDispatcher(viewpage);
				dispatcher.forward(request, response);
		} catch (Exception e) {

		e.printStackTrace();
		}
		
	}
	
	
	
}
