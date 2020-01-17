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
	<td>국어:${t_dto.getKor()}</td>
	</tr>
	
	<tr>
	<td>영어:${t_dto.getEng()}</td>
	</tr>
	<tr>
	<td>수학:${t_dto.getMat()}</td>
	</tr
	><tr>
	<td>총점:${t_dto.getTotal()}</td>
	</tr>
	<tr>
	<td>평균:${t_dto.getAva()}</td>
	</tr>
	
	<tr>
	<td><input type="button" value="List" onClick="location.href='/scoreServlet?t_work=allview'"></td>
	<td><input type="button" value="Update" onClick="location.href='/scoreServlet?t_id=${t_dto.getId()}&&t_work=gou'"></td>
	<td><input type="button" value="Delete" onClick="location.href='/scoreServlet?t_id=${t_dto.getId()}&&t_work=del'"></td>
	</tr>
	
	</table>
	</form>
	

	
	</body>
</html>