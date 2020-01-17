<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ page import="dao.Member_DAO,common.CommonUtil,dto.Faq_DTO"%>
<%
	request.setCharacterEncoding("UTF-8");
	Member_DAO dao = new Member_DAO();
	
	String id		 = request.getParameter("t_id");
	String pw 		= request.getParameter("t_pw");
	String name 	= request.getParameter("t_name");
	String phone 	= request.getParameter("t_phone");
	String email_1 	= request.getParameter("t_email1");
	String email_2	 = request.getParameter("t_email2");
	String infomaintain	 = request.getParameter("t_agree");
	String gubun	 = request.getParameter("t_gubun");
	String reg_date = CommonUtil.getToday();
	String update_date = CommonUtil.getToday();
	String query ="";
	String work ="";
	int result = 0;
	if(gubun.equals("insert")){
		query = " insert into A06_TRACK2_HOME_MEMBER(ID,PW,NAME,PHONE,EMAIL_1,EMAIL_2,infomaintain, "+
				" REG_DATE) "+
				" values('"+id+"','"+pw+"','"+name+"','"+phone+"','"+email_1+"','"+email_2+"', "+
				" '"+infomaintain+"','"+reg_date+"') ";				
		work="회원가입";
		result = dao.memberInsertUpdateDelete(query);
	}
	
	

		

	
%>

<html>
	<head>
		<script>	
			<% if(result != 0){%>
				alert("<%=work%> 되었습니다.");
			<% } else {%>
				alert("<%=work%> 에 실패 했습니다.");
			<% }  %>
			location.href = "/index.jsp";
		</script>
	</head>
</html>