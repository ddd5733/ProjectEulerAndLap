<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="good1">
	<table>
	
	<tr>
	<td>아이디:${t_dto.getId()}</td>
	</tr>
	<input type="hidden" name="t_id" value="${t_dto.getId()}">
	<input type="hidden" name="t_work" value="up">
	<tr>
	<td>이름<input type="text" name="t_name" value="${t_dto.getName()}"></td>
	</tr>
	
	<tr>
	<td>국어점수<input type="text" name="t_kor" value="${t_dto.getKor()}"></td>
	</tr>
	<tr>
	<td>영어점수<input type="text" name="t_eng" value="${t_dto.getEng()}"></td>
	</tr>
	<tr>
	<td>수학점수<input type="text" name="t_mat" value="${t_dto.getMat()}"></td>
	</tr>
	
	</table>
	
	
	
	</form>
	<input type="button" name="click" value ="Update" onClick="goPage()"></td>
	<input type="button" name="click" value ="List" onClick="location.href='scoreServlet?t_work=allview'"></td>
	
	<script>
	function goPage(){
		var form = document.good1;
		form.action = "/scoreServlet";
		form.method = "post";
		form.submit();
	}
	</script>
	
	</body>
</html>