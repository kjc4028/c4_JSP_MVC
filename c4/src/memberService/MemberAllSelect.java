package memberService;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/allSelect.do")
public class MemberAllSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	@SuppressWarnings("unused")
	private void process(HttpServletRequest request, HttpServletResponse response){
		String url =request.getRequestURL().toString();
		String viewpage = null;
		try {
			
			if(url.indexOf("allSelect.do") != -1){
				viewpage = "/allSelectRs.jsp";
				
			}
			 RequestDispatcher dispatcher = request.getRequestDispatcher(viewpage);
			   
			  dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	
	
	
	
	
	
	
	
	
//¸·´ë
}
