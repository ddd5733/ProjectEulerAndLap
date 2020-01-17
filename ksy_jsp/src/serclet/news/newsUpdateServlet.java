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
 * Servlet implementation class newsUpdateServlet
 */
@WebServlet("/newsUpdateServlet")
public class newsUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public newsUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		RequestDispatcher dispatcher = null;
		String news_no ="";
		News_DAO dao = new News_DAO();
		int result 		 = 0;
		int sizeLimit 		 = 1024*1024*5;
		String saveFileName = "";
		String fileName = "";
		String reg_id = "";
		String title = "";
		String content = "";
		String reg_date = "";
		String file_dir 	 = CommonUtil.file_dir_news;
		String fileDelete ="";
		MultipartRequest mpr = new MultipartRequest(request, file_dir, sizeLimit, "UTF-8");
		String query ="";
		String delFile ="";
		String delFile_1 ="";
		String work = mpr.getParameter("t_work");
		 if(work.equals("insert")) { //등록
				title = mpr.getParameter("t_title");
				content = mpr.getParameter("t_content");
				news_no = dao.getNewsNo();
				reg_id = mpr.getParameter("t_reg_id");
				reg_date = CommonUtil.getToday();
				fileName 	= mpr.getFilesystemName("fileName_a");
				if(fileName != null){
					File oldFile = new File(file_dir, fileName);
					File newFile = new File(file_dir, news_no+"-"+fileName);
					oldFile.renameTo(newFile);
					saveFileName = newFile.getName();
				}
				query = " insert into A06_TRACK2_HOME_NEWS "+
						" (news_no, title, content, file_name_1, reg_id, reg_date) "+ 
						" values ('"+news_no+"' ,'"+title+"' , '"+content+"' ,  '"+saveFileName+"' ,  '"+reg_id+"' , '"+reg_date+"' ) ";
				result = dao.update(query);
				if(result>0) {
					System.out.println("뉴스등록성공");
				}else {
					System.out.println("등록실패");
				}
				dispatcher = request.getRequestDispatcher("/newsListServlet");
				dispatcher.forward(request,response);		
		 } else if(work.equals("del")) { //삭제
				news_no = request.getParameter("t_news_no");
				query = " delete from A06_TRACK2_HOME_NEWS where news_no = '"+news_no+"' ";	
				result = dao.update(query);
					if(result>0) {
						fileDelete = request.getParameter("t_fileName");
						if(fileDelete != null){
								File dFa = new File(file_dir,fileDelete);
								boolean tf = dFa.delete();
								if(tf) {
									System.out.println("파일삭제성공");
								} else {
									System.out.println("파일삭제실패");
								}
								
						System.out.println("뉴스삭제성공");
					}
					} else {
						System.out.println("삭제실패");
					}
					dispatcher = request.getRequestDispatcher("/newsListServlet");
					dispatcher.forward(request,response);
		 } else if(work.equals("up")) { //수정저장
				news_no = mpr.getParameter("t_news_no");
				reg_id = mpr.getParameter("t_reg_id");
				title = mpr.getParameter("t_title");
				content = mpr.getParameter("t_content");
				reg_date = CommonUtil.getToday();
				fileName = mpr.getFilesystemName("fileName_a"); 
				 delFile = CommonUtil.checkNull(mpr.getParameter("checkBox_del_fileName"));  //삭제시킬 파일명	
				if(!delFile.equals("")){ //checkbox에 삭제할 파일이 있다
					File dFa = new File(file_dir, delFile);
					dFa.delete();
				} else {
					saveFileName   = mpr.getParameter("ori_fileName_a");
				}
				
				if(fileName != null){
					delFile_1 = mpr.getParameter("ori_fileName_a");
					if(delFile_1 != null){
						File dFa = new File(file_dir, delFile_1);
						boolean yn = dFa.delete();
						if(yn) {
							System.out.println("파일삭제성공");
						} else {
							System.out.println("파일삭제실패");
						}
						
					}
					File oldFile = new File(file_dir, fileName);
					File newFile = new File(file_dir, news_no+"-"+fileName);
					oldFile.renameTo(newFile);
					saveFileName = newFile.getName();
				}
				if(saveFileName == null) {
					query = " update A06_TRACK2_HOME_NEWS set title ='"+title+"', content ='"+content+"', "+
							" reg_id='"+reg_id+"', reg_date = '"+reg_date+"', file_name_1 = null "+
							" where news_no = '"+news_no+"' ";
				}else {
					query = " update A06_TRACK2_HOME_NEWS set title ='"+title+"', content ='"+content+"', "+
						    " reg_id='"+reg_id+"', reg_date = '"+reg_date+"', file_name_1 = '"+saveFileName+"' "+
						    " where news_no = '"+news_no+"' ";
				}
				result =dao.update(query);
					if(result>0) {
						System.out.println("수정성공");
					} else {
						System.out.println("수정실패");
					}
					dispatcher = request.getRequestDispatcher("/newsListServlet");
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
