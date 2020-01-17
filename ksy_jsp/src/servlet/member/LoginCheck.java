package servlet.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Member_DAO;

/**
 * Servlet implementation class LoginCheck
 */
@WebServlet("/LoginCheck")
public class LoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.setCharacterEncoding("UTF-8");
	Member_DAO dao = new Member_DAO();
	String id = request.getParameter("t_id");
	String pw = request.getParameter("t_pw");
	String name = dao.checkLogin(id,pw);
	String msg = "";
	String url = "";
	RequestDispatcher rdq = null;
		if(name == null) {
			msg="로그인에 실패 하셨습니다.";
			request.setAttribute("t_msg", msg);
			url = "/LoginForm";
			request.setAttribute("t_url", url);
			rdq = request.getRequestDispatcher("/common/view_messageAlert.jsp");
		} else {
			HttpSession session = request.getSession(true);
			session.setAttribute("session_name",name);
			session.setAttribute("session_id",id);
			if(id.equals("manager")){
				session.setAttribute("session_level","manager");
			}
			session.setMaxInactiveInterval(60 * 60 *2);
			msg=name+"님환영합니다.";
			url = "/Index";
			request.setAttribute("t_msg", msg);
			request.setAttribute("t_url", url);
			rdq = request.getRequestDispatcher("/common/view_messageAlert.jsp");
		}
		rdq.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
