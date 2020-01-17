<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ page import="dao.Event_DAO"%>
<%
	request.setCharacterEncoding("UTF-8");
 
	String[] name = request.getParameterValues("t_name");
	
	for(int k=0; k<name.length; k++){
		out.println("        "+name[k]);
	}
	
%>
<html>
	<head>
		<script>

//			location.href = "";
		</script>
	</head>
</html>






























