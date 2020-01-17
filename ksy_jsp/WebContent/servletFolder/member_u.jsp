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
	<td>지역<input type="text" name="t_area" value="${t_dto.getArea()}"></td>
	</tr>
	
	<tr>
	<td>나이<input type="text" name="t_age" value="${t_dto.getAge()}"></td>
	</tr>
	
	</table>
	
	
	
	</form>
	<input type="button" name="click" value ="Update" onClick="goPage()"></td>
	<input type="button" name="click" value ="List" onClick="location.href='memberList'"></td>
	
	<script>
	function goPage(){
		var form = document.good1;
		form.action = "/memberUpdate";
		form.method = "post";
		form.submit();
	}
	</script>
	
	</body>
</html>