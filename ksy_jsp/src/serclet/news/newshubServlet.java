package serclet.news;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import common.CommonUtil;
import dao.News_DAO;
import dto.News_DTO;

/**
 * Servlet implementation class newshubServlet
 */
@WebServlet("/newshubServlet")
public class newshubServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public newshubServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		RequestDispatcher dispatcher = null;
		String work = request.getParameter("t_work");
		if(work.equals("gow")) {
			dispatcher = request.getRequestDispatcher("/news/news_w.jsp");
			dispatcher.forward(request,response);
		}  else if(work.equals("gor")) { //리스토로
			dispatcher = request.getRequestDispatcher("/newsListServlet");
			dispatcher.forward(request,response);	
		} else if(work.equals("gof")) { //파일다운jsp로보내기
			String fileName = request.getParameter("t_file");
		 	String gubun = request.getParameter("t_gubun");
		 	request.setAttribute("t_fileName",fileName);
		 	request.setAttribute("t_gubun",gubun);
			dispatcher = request.getRequestDispatcher("/common/filedown.jsp");
			dispatcher.forward(request,response);
		} 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
