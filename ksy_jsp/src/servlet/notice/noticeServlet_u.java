package servlet.notice;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import common.CommonUtil;
import dao.Notice_DAO;

/**
 * Servlet implementation class noticeServlet_u
 */
@WebServlet("/noticeServlet_u")
public class noticeServlet_u extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public noticeServlet_u() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

		
		Notice_DAO dao = new Notice_DAO();
		int sizeLimit 		= 1024*1024*5;
		String file_dir     = CommonUtil.file_dir_notice;
		MultipartRequest mpr = new MultipartRequest(request, file_dir, sizeLimit, "UTF-8");
		String fileName 	= mpr.getFilesystemName("fileName_a");
		// out.print("fileName : "+fileName);
		String saveFileName = ""; 
		HttpSession session = request.getSession(true);
		String session_level = (String)session.getAttribute("session_level");
		String	title  = mpr.getParameter("t_title");
		if(title != null) title  = title.replaceAll("\'","\''");
		String content = mpr.getParameter("t_content");
		if(content != null) content = content.replaceAll("\'","\''");
		String	reg_id = mpr.getParameter("t_see");
		String reg_date = CommonUtil.getToday();
		String query="";
		int result = 0;
		String notice_no = mpr.getParameter("t_notice_no");
		String delFile = CommonUtil.checkNull(mpr.getParameter("checkBox_del_fileName"));  //삭제시킬 파일명	
		if(session_level == null) {
			String url ="/Index";
			String msg ="로그인 정보가 만료되었습니다";
			request.setAttribute("t_msg", msg);
			request.setAttribute("t_url", url);
			RequestDispatcher rdq = request.getRequestDispatcher("/common/view_messageAlert.jsp");
		}else {
		if(!delFile.equals("")){ //checkbox에 삭제할 파일이 있다
			File dFa = new File(file_dir, delFile);
			dFa.delete();
		} else {
			saveFileName   = mpr.getParameter("ori_fileName_a");
		}
		
		if(fileName != null){
			String delFile_1 = mpr.getParameter("ori_fileName_a");
			if(delFile_1 != null){
				File dFa = new File(file_dir, delFile_1);
				dFa.delete();
			}
			File oldFile = new File(file_dir, fileName);
			File newFile = new File(file_dir, notice_no+"-"+fileName);
			oldFile.renameTo(newFile);
			saveFileName = newFile.getName();
		}
		
		String fileDelete = mpr.getParameter("t_fileName");
		
		if(fileDelete != null){
				File dFa = new File(file_dir,fileDelete);
				dFa.delete();
		}
		if(!saveFileName.equals("null")){
			query = " update A06_TRACK2_HOME_NOTICE set title ='"+title+"', content ='"+content+"', "+
				    " reg_id='"+reg_id+"', reg_date = '"+reg_date+"', file_name_1 = '"+saveFileName+"' "+
				    " where notice_no = '"+notice_no+"' ";
		}else {
			query = " update A06_TRACK2_HOME_NOTICE set title ='"+title+"', content ='"+content+"', "+
				    " reg_id='"+reg_id+"', reg_date = '"+reg_date+"', file_name_1 = "+saveFileName+" "+
				    " where notice_no = '"+notice_no+"' ";
		}
			result = dao.updateNotice(query);
			if(result > 0) {
				 System.out.println("등록성공");
			 }else {
				 System.out.println("등록실패");
			 }
			 response.sendRedirect("/noticeServletPaging");
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
