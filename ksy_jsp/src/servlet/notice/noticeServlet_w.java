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
 * Servlet implementation class noticeServlet_w
 */
@WebServlet("/noticeServlet_w")
public class noticeServlet_w extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public noticeServlet_w() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(true);
		String session_level = (String)session.getAttribute("session_level");
		Notice_DAO dao = new Notice_DAO();
		String notice_no = dao.getNoticeNo();
		int sizeLimit 		= 1024*1024*5;
		String file_dir     = CommonUtil.file_dir_notice;
		MultipartRequest mpr = new MultipartRequest(request, file_dir, sizeLimit, "UTF-8");
		String fileName 	= mpr.getFilesystemName("fileName_a");
		RequestDispatcher rdq = null;
		// out.print("fileName : "+fileName);
		String saveFileName = "";
		 String msg ="";
		 String url	="";
		String	title  = mpr.getParameter("t_title");
		if(title != null) title  = title.replaceAll("\'","\''");
		String content = mpr.getParameter("t_content");
		if(content != null) content = content.replaceAll("\'","\''");
		String reg_date = CommonUtil.getToday();
		String query="";
		int result =0;
		String reg_id = "manager";
		String delFile = CommonUtil.checkNull(mpr.getParameter("checkBox_del_fileName"));  //삭제시킬 파일명	
		if(session_level == null) {
			url ="/Index";
			msg ="로그인 정보가 만료되었습니다";
			request.setAttribute("t_msg", msg);
			request.setAttribute("t_url", url);
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
		if(saveFileName != null){
			query =	" insert into a06_track2_home_notice(notice_no,title,content,reg_id,reg_date,file_name_1) "+
					" values('"+notice_no+"','"+title+"','"+content+"','"+reg_id+"','"+reg_date+"','"+saveFileName+"') ";
		} else {	
			query =	" insert into a06_track2_home_notice(notice_no,title,content,reg_id,reg_date,file_name_1) "+
					" values('"+notice_no+"','"+title+"','"+content+"','"+reg_id+"','"+reg_date+"',"+saveFileName+" ) ";
		}
		
			result = dao.updateNotice(query);
			 if(result > 0) {
				 url ="/Index";
				 msg ="노티스 등록성공";
			 }else {
				 url ="/noticeListServlet";
				 msg ="노티스등록실패";
			 }
		}
		 	request.setAttribute("t_msg", msg);
			request.setAttribute("t_url", url);
			rdq = request.getRequestDispatcher("/common/view_messageAlert.jsp");
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
