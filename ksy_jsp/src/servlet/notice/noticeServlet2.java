package servlet.notice;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonUtil;
import dao.Notice_DAO;
import dto.Notice_DTO;
import  com.oreilly.servlet.*;

/**
 * Servlet implementation class noticeServlet
 */
@WebServlet("/noticeServlet2")
public class noticeServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public noticeServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		Notice_DAO dao = new Notice_DAO();
		RequestDispatcher dispatcher = null;
		String work = request.getParameter("t_work");
		String notice_no ="";
		Notice_DTO dto = null;
		if(work.equals("gow")) {
			dispatcher = request.getRequestDispatcher("/notice/notice_w.jsp");
			dispatcher.forward(request,response);
	
		} else if(work.equals("gov")) {
			notice_no = request.getParameter("t_notice_no");
			dto =dao.getNoticeView(notice_no);
			request.setAttribute("t_dto",dto);
			dispatcher = request.getRequestDispatcher("/notice/notice_v.jsp");
			dispatcher.forward(request,response);
		} else if(work.equals("gou")) {
			notice_no = request.getParameter("t_notice_no");
			dto =dao.getNoticeView(notice_no);
			request.setAttribute("t_dto",dto);
			dispatcher = request.getRequestDispatcher("/notice/notice_u.jsp");
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
