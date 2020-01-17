<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.Notice_DAO,common.CommonUtil,dto.Notice_DTO"%> 
<%@ page import = "com.oreilly.servlet.*,java.io.*"%> 
<%@ include file="/common/common_session_info.jsp" %>
<%
	
	request.setCharacterEncoding("UTF-8");
	Notice_DAO dao = new Notice_DAO();
	String notice_no = dao.getNoticeNo();
	int sizeLimit 		= 1024*1024*5;
	String file_dir     = CommonUtil.file_dir_notice;
	MultipartRequest mpr = new MultipartRequest(request, file_dir, sizeLimit, "UTF-8");
	String fileName 	= mpr.getFilesystemName("fileName_a");
	// out.print("fileName : "+fileName);
	String saveFileName = ""; 
	
	String	title  = mpr.getParameter("t_title");
	if(title != null) title  = title.replaceAll("\'","\''");
	String content = mpr.getParameter("t_content");
	if(content != null) content = content.replaceAll("\'","\''");
	String	reg_id = sessionId;
	String reg_date = CommonUtil.getToday();
	String msg ="";
	String work_gubun = mpr.getParameter("t_work_gubun");
	String query="";
	int result = 0;
	
	String delFile = CommonUtil.checkNull(mpr.getParameter("checkBox_del_fileName"));  //삭제시킬 파일명	
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
	
	if(work_gubun.equals("insert")){
		notice_no = dao.getNoticeNo();
		if(saveFileName != null){
			query =	" insert into a06_track2_home_notice(notice_no,title,content,reg_id,reg_date,file_name_1) "+
					" values('"+notice_no+"','"+title+"','"+content+"','"+reg_id+"','"+reg_date+"','"+saveFileName+"') ";
		} else {	
			query =	" insert into a06_track2_home_notice(notice_no,title,content,reg_id,reg_date,file_name_1) "+
					" values('"+notice_no+"','"+title+"','"+content+"','"+reg_id+"','"+reg_date+"',"+saveFileName+" ) ";
		}
			
		result=dao.updateNotice(query);
		msg	="글 등록이";
	} else if(work_gubun.equals("del")){
		notice_no = mpr.getParameter("t_notice_no");	
		query = " delete from A06_TRACK2_HOME_NOTICE where notice_no = '"+notice_no+"' ";	
		result=dao.updateNotice(query);
		msg ="삭제";
	} else if(work_gubun.equals("su")){
		notice_no = mpr.getParameter("t_notice_no");	
		if(!saveFileName.equals("null")){
			query = " update A06_TRACK2_HOME_NOTICE set title ='"+title+"', content ='"+content+"', "+
				    " reg_id='"+reg_id+"', reg_date = '"+reg_date+"', file_name_1 = '"+saveFileName+"' "+
				    " where notice_no = '"+notice_no+"' ";
		}else {
			query = " update A06_TRACK2_HOME_NOTICE set title ='"+title+"', content ='"+content+"', "+
				    " reg_id='"+reg_id+"', reg_date = '"+reg_date+"', file_name_1 = "+saveFileName+" "+
				    " where notice_no = '"+notice_no+"' ";
		}
			
			result=dao.updateNotice(query);
			msg ="수정";
	}
%>

<html>
	<head>
		<script>
	<% if(result > 0){%>
		alert("<%=msg%> 되었습니다");
	<% } else {%>
		alert("<%=msg%> 처리 되지 못했ㅅㅂ니다");
	<% } %>
	location.href = "notice_r.jsp";
		</script>
	</head>
</html>