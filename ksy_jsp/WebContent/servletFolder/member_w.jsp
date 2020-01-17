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
	<td>아이디<input type="text" name="t_id"></td>
	</tr>
	
	<tr>
	<td>이름<input type="text" name="t_name"></td>
	</tr>
	
	<tr>
	<td>지역<input type="text" name="t_area"></td>
	</tr>
	
	<tr>
	<td>나이<input type="text" name="t_age"></td>
	</tr>
	
	<tr>
	<td><input type="button" name="click" onClick="goPage()"></td>
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