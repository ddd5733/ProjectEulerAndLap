package servlet_practice;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Smember_DAO;
import dto.Smember_DTO;

/**
 * Servlet implementation class memberList
 */
@WebServlet("/memberList")
public class memberList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Smember_DAO dao = new Smember_DAO();
		 ArrayList<Smember_DTO> dtos = dao.getMemberList();
		 request.setAttribute("t_dtos",dtos);
		 request.setAttribute("t_name","홍길동");
		 RequestDispatcher dispatcher = request.getRequestDispatcher("/servletFolder/member_r2.jsp");
	 	 dispatcher.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
