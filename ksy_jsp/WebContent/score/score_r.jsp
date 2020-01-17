<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,dto.Score_DTO" %>
<%
	ArrayList<Score_DTO> dtos = (ArrayList<Score_DTO>)request.getAttribute("t_dtos");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name ="mem">
	<table>
		
		<tr>
			<td>아이디</td>
			<td>성명</td>
			<td>국어</td>
			<td>영어</td>
			<td>수학</td>
			<td>총점</td>
			<td>평균</td>
		</tr>
		
		<input type="hidden" name ="t_work" value="gow">
<%
	if(dtos.size() !=0){
%>	
<%
	for(int k=0; k < dtos.size(); k++){
%>	
	
		<tr>
			<td><a href="/scoreServlet?t_id=<%=dtos.get(k).getId()%>&&t_work=view"><%=dtos.get(k).getId()%></a></td>
			<td><%=dtos.get(k).getName()%></td>
			<td><%=dtos.get(k).getKor()%></td>
			<td><%=dtos.get(k).getEng()%></td>
			<td><%=dtos.get(k).getMat()%></td>
			<td><%=dtos.get(k).getTotal()%></td>
			<td><%=dtos.get(k).getAva()%></td>
		</tr>	

<%		
	}
%>	

<%		
	} else {
%>	
		<tr>
			<td colspan="7">등록된 자료 없음</td>
			
		</tr>	
	
<%		
	}
%>	
	
	
		
	</table>
	<input type ="button" value="등록" onClick="goWrite()" >
</form>
</body>
<script>
	function goWrite(){
		var form = document.mem;
		form.action = "/scoreServlet";
		form.method = "post";
		form.submit();
	}
	</script>
</html>