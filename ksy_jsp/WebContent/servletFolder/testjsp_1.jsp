<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name ="mem">
	<input type="text" name="t_name" >
	<input type="button" name="click" onClick="goPage()">
	<input type="text" name="t_noticeNo" >
	<input type="button" name="click" onClick="goPage2()">
</form>

<script>
	function goPage(){
		var form =document.mem;
		//form.action="testjsp_2.jsp";
		form.action="/test_1";
		form.method="post";
		form.submit();
	}
	function goPage2(){
		var form =document.mem;
		//form.action="testjsp_2.jsp";
		form.action="/test_1";
		form.method="post";
		form.submit();
	}
</script>
</body>
</html>