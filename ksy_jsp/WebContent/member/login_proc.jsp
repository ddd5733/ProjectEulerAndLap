<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.Member_DAO"%>  
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	Member_DAO dao = new Member_DAO();
	
	String gg		 = request.getParameter("t_gubun");
	String id		 = request.getParameter("t_id");
	String pw 		= request.getParameter("t_pw");
	String name = dao.checkLogin(id,pw);
	
	if(name !=null){
		session.setAttribute("session_name",name);
		session.setAttribute("session_id",id);
		if(id.equals("manager")){
			session.setAttribute("session_level","manager");
		}
		session.setMaxInactiveInterval(60 * 60 *2);
	}
	

	
%>

<html>
	<head>
		<script>
		<%
			if(name != null){
		%>
			alert("<%=name%> 님환영합니다");
			location.href="/index.jsp";
		<%
			} else {
		%>
			alert("아이디 비밀번호가 정확하지않습니다");
			location.href="login.jsp";
		<%
			}
		%>
		</script>
	</head>
</html>