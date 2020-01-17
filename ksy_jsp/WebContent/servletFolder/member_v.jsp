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
	<input type="hidden" name="t_work" value="del">
	<tr>
	<td>이름:${t_dto.getName()}</td>
	</tr>
	
	<tr>
	<td>지역:${t_dto.getArea()}</td>
	</tr>
	
	<tr>
	<td>나이:${t_dto.getAge()}</td>
	</tr>
	
	<tr>
	<td><input type="button" value="List" onClick="location.href='/memberList'"></td>
	<td><input type="button" value="Update" onClick="location.href='/memberUpdateForm?t_id=${t_dto.getId()}'"></td>
	<td><input type="button" value="Delete" onClick="location.href='/memberUpdate?t_id=${t_dto.getId()}&&t_work=del'"></td>
	</tr>
	
	</table>
	
	</form>
	
	<script>
	function goPage(){
		var form = document.good1;
		form.action = "/memberSave";
		form.method = "post";
		form.submit();
	}
	</script>
	
	</body>
</html>