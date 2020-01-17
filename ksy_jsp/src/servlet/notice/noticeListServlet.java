package servlet.notice;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Notice_DAO;
import dto.Notice_DTO;

/**
 * Servlet implementation class noticeListServlet
 */
@WebServlet("/noticeListServlet")
public class noticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public noticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Notice_DAO dao = new Notice_DAO();
		String selValue = request.getParameter("t_sel");
		String txtValue = request.getParameter("t_search");
		if(selValue == null){
				selValue = "title";
				txtValue = "";
		}
		ArrayList<Notice_DTO> dtos = dtos = dao.getNoticeList(selValue,txtValue);
		request.setAttribute("t_dtos",dtos);
		request.setAttribute("t_selValue",selValue);
		request.setAttribute("t_txtValue",txtValue);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/notice/notice_r2.jsp");
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
