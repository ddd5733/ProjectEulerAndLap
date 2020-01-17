package servlet.score;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Score_DAO;
import dao.Smember_DAO;
import dto.Score_DTO;
import dto.Smember_DTO;


/**
 * Servlet implementation class memberSave
 */
@WebServlet("/scoreServlet")
public class scoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public scoreServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String work =request.getParameter("t_work");
		Score_DAO dao = new Score_DAO();
		String id = "";
		String name = "";
		int kor = 0;
		int eng = 0;
		int mat = 0;
		int result = 0;
		String query = "";
		int total = 0;
		double ava = 0;
		RequestDispatcher dispatcher = null;
		Score_DTO dto = null;
		
		if(work.equals("insert")) {
			 name =request.getParameter("t_name");
			 kor = Integer.parseInt(request.getParameter("t_kor"));
			 eng = Integer.parseInt(request.getParameter("t_eng"));
			 mat = Integer.parseInt(request.getParameter("t_mat"));
			 total = kor+eng+mat;
			ava = Math.round((total/3 * 10) / 10.0);
			id =dao.getId();
			query =	" insert into A06_TRACK2_SERVLET_SCORE(id,name,kor,eng,mat,total,ava) "+
					" values('"+id+"', '"+name+"', '"+kor+"', '"+eng+"', '"+mat+"', '"+total+"' , '"+ava+"' ) ";
			result = dao.update(query);
			if(result != 0) {
				System.out.println("성적입력성공");
			} else {
				System.out.println("성적입력실패");
			}
			dispatcher = request.getRequestDispatcher("scoreServlet?t_work=allview");
		 	 dispatcher.forward(request,response);
		} else if(work.equals("allview")) {
			ArrayList<Score_DTO> dtos = dao.getScoreList();
			request.setAttribute("t_dtos",dtos);
			dispatcher = request.getRequestDispatcher("/score/score_r.jsp");
		 	 dispatcher.forward(request,response);
		
		} else if(work.equals("gow")) {
			 dispatcher = request.getRequestDispatcher("/score/score_w.jsp");
			 dispatcher.forward(request, response);
		} else if(work.equals("view")) {
			id =request.getParameter("t_id");
			 dto = dao.getView(id);
			 request.setAttribute("t_dto",dto);
			 dispatcher = request.getRequestDispatcher("/score/score_v.jsp");
			 dispatcher.forward(request, response);
		}  else if(work.equals("del")) {
			id =request.getParameter("t_id");
			query =	" delete from  A06_TRACK2_SERVLET_SCORE "+
					" where id = '"+id+"' ";
			result = dao.update(query);
			if(result != 0) {
				System.out.println("삭제성공");
			} else {
				System.out.println("삭제실패");
			}
			dispatcher = request.getRequestDispatcher("scoreServlet?t_work=allview");
			dispatcher.forward(request, response);
		} else if(work.equals("gou")) {
			id = request.getParameter("t_id");
			dto = dao.getView(id);
			request.setAttribute("t_dto", dto);
			dispatcher =request.getRequestDispatcher("/score/score_u.jsp");
			dispatcher.forward(request, response);
		} else if(work.equals("up")) {
			 kor = Integer.parseInt(request.getParameter("t_kor"));
			 eng = Integer.parseInt(request.getParameter("t_eng"));
			 mat = Integer.parseInt(request.getParameter("t_mat"));
			 id =request.getParameter("t_id");
			 name =request.getParameter("t_name");
			 total = kor+eng+mat;
			 ava = Math.round((total/3 * 10) / 10.0);
			 query =	" update A06_TRACK2_SERVLET_SCORE "+
					 	" set  name ='"+name+"', kor = '"+kor+"', eng = '"+eng+"' "+
					 	" , mat ='"+mat+"', total = '"+total+"', ava = '"+ava+"' "+
					 	" where id ='"+id+"' ";
			result = dao.update(query);
			if(result != 0) {
				System.out.println("수정성공");
			} else {
				System.out.println("수정실패");
			}
			dispatcher = request.getRequestDispatcher("scoreServlet?t_work=allview");
			dispatcher.forward(request, response);
		}
		
		
	
		
		//RequestDispatcher rdp = request.getRequestDispatcher("/servletFolder/member_r.jsp");
	 	//rdp.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
