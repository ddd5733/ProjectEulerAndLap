<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="good">
	<table>
	
	<tr>
	<td>성명<input type="text" name="t_name"></td>
	</tr>
	
	<tr>
	<td>국어점수<input type="text" name="t_kor"></td>
	</tr>
	
	<tr>
	<td>영어점수<input type="text" name="t_eng"></td>
	</tr>
	
	<tr>
	<td>수학점수<input type="text" name="t_mat"></td>
	</tr>
	
	<tr>
	<td><input type="button" name="click" onClick="goPage()"></td>
	</tr>
	<input type="hidden" name ="t_work" value="insert">
	</table>
	
	</form>
	
	<script>
	function goPage(){
		var form = document.good;
		form.action = "/scoreServlet";
		form.method = "post";
		form.submit();
	}
	</script>
	
	</body>
</html>