package serclet.news;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.News_DAO;
import dto.News_DTO;

/**
 * Servlet implementation class newsgetvServlet
 */
@WebServlet("/newsgetvServlet")
public class newsgetvServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public newsgetvServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
			News_DAO dao = new News_DAO();
			RequestDispatcher dispatcher =null;
			String work = request.getParameter("t_work");
			String news_no   = request.getParameter("t_news_no1");
			News_DTO dto = dao.getNewsView(news_no);
			if(work.equals("gov")) {
				System.out.println("work==vvv==="+work);
				System.out.println("dto==vvv==="+dto.getNews_no());
				
			int nHit  = dao.newsHit(news_no);
			request.setAttribute("t_dto",dto);
			dispatcher = request.getRequestDispatcher("/news/news_v.jsp");
			dispatcher.forward(request,response);
			} else if(work.equals("gou")) { //수정페이지로보내기
				System.out.println("work==uuu==="+work);
				System.out.println("dto==uuu==="+dto.getNews_no());
				news_no = request.getParameter("t_news_no");
				request.setAttribute("t_dto",dto);
				dispatcher = request.getRequestDispatcher("/news/news_u.jsp");
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
