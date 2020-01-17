<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.Faq_DAO,common.CommonUtil,dto.Faq_DTO"%> 
<%@ page import = "com.oreilly.servlet.*,java.io.*"%> 
<%@ include file="/common/common_session_info.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	Faq_DAO dao = new Faq_DAO();
	String title = request.getParameter("t_title");
	String content = request.getParameter("t_content");
	String work = request.getParameter("t_work");
	String faq_no = "";
	faq_no = request.getParameter("t_faqNo");
	String	reg_id = sessionId;
	String reg_date = CommonUtil.getToday();
	String msg = "";
	String query ="";
	int result =0;
	
	
	if(work.equals("insert")){
		faq_no = dao.getFaqNo();
		query =	" insert into a06_track2_home_faq(faq_no,title,content,reg_id,reg_date) "+
				" values('"+faq_no+"','"+title+"','"+content+"','"+reg_id+"','"+reg_date+"') ";
		result = dao.update(query);
		msg ="등록";
	} else if(work.equals("del")){
		faq_no = request.getParameter("t_faqNo");
		query = " delete from A06_TRACK2_HOME_FAQ where faq_no = '"+faq_no+"' ";	
		result=dao.update(query);
		msg ="삭제";
	} else if(work.equals("up")){
		faq_no = request.getParameter("t_faqNo");
		query = " update A06_TRACK2_HOME_FAQ set title ='"+title+"', content ='"+content+"', "+
				" reg_id='"+reg_id+"' "+
			    " where faq_no = '"+faq_no+"' ";
		result=dao.update(query);
		msg ="수정";
	}
	

	out.print(query);
%>

<html>
	<head>
		<script>
	<% if(result > 0){%>
		alert("<%=msg%> 되었습니다");
	<% } else {%>
		alert("<%=msg%> 처리 되지 못했ㅅㅂ니다");
	<% } %>
		//location.href = "/faq/faq_r.jsp";
		</script>
	</head>
</html>