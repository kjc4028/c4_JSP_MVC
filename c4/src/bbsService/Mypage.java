package bbsService;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memberDao.MemberDao;
import memberDto.MemberDto;

@WebServlet("/Mypage.do")
public class Mypage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Mypage() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	try {
		process(request, response);
	} catch (NamingException | SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	public void process(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, NamingException, SQLException{
	
		request.setCharacterEncoding("utf-8");
		String viewapage = "";
		String mid = request.getParameter("id");
		System.out.println(mid);
		MemberDao dao = new MemberDao();
		try {
			MemberDto dto =  dao.memberInfo(mid);
			
			request.setAttribute("memInfo", dto);
			
			
			viewapage = "/mypage.jsp";
			 RequestDispatcher dispatcher = request.getRequestDispatcher(viewapage);
				dispatcher.forward(request, response);
				
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
