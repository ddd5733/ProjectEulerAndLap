package servlet_practice;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Smember_DAO;

/**
 * Servlet implementation class memberUpdate
 */
@WebServlet("/memberUpdate")
public class memberUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		Smember_DAO dao = new Smember_DAO();
		String id =request.getParameter("t_id");
		String name =request.getParameter("t_name");
		String area =request.getParameter("t_area");
		String age =request.getParameter("t_age");
		String work =request.getParameter("t_work");
		String query ="";
		int result = 0;
	
		if(work.equals("del")) {
			query =	" delete "+
					" from A06_TRACK2_SERVLET "+
					" where id ='"+id+"' ";
			result = dao.update(query);
		} else if(work.equals("up")) {
			query =	" update A06_TRACK2_SERVLET "+
					" set  name ='"+name+"', area = '"+area+"', age ='"+age+"' "+
					" where id ='"+id+"' ";
				result = dao.update(query);
		}
		
		
		if(result != 0) {
			System.out.println("성공");
		} else {
			System.out.println("실패");
		}
		//RequestDispatcher rdp = request.getRequestDispatcher("/servletFolder/member_r.jsp");
	 	//rdp.forward(request, response);
		//보내주는 값이 있을때
		response.sendRedirect("/memberList");
		//보내주는값이 없을때
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
