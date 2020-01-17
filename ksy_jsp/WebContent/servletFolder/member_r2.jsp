<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name ="mem">

<c:set var="t_value" value ="aa"/>
1:${t_value}<br>
<c:if test ="${t_value == 'aa'}">
	<c:set var="t_value" value="bb"/>
</c:if>
2:${t_value}<br>
${t_value == 'bb' ? '맞아' : '안맞아'}
<!-- else 문입 -->


	<table>
		<tr>
			<td>아이디</td>
			<td>성명</td>
			<td>지역</td>
			<td>나이</td>
		</tr>
		<c:if test="${t_dtos.size() eq 0}">
		<tr>
			<td colspan="4">dtossize 쌉가능</td>
		</tr>
		</c:if>
		<c:if test="${empty t_dtos}">
		<tr>
			<td colspan="4">데이터 없음</td>
		</tr>
		</c:if>
		
<%-- 	<c:if test="${t_dtos ne null}">
		<tr>
			<td colspan="4">ne 도 쌉가능</td>
		</tr>
		</c:if> 
--%>

<c:forEach items="${t_dtos}" var="arr">			
		<tr>
			<td><a href="/MemberView?t_id=${arr.getId()}">${arr.getId()}</a></td>
			<td>${arr.getName()}</td>
			<td>${arr.getArea()}</td>
			<td>${arr.getAge()}</td>
		</tr>	
</c:forEach>
		
	</table>
	${t_name}
	
<%-- 
	<c:if test="${t_namettt eq null}">
			==if true==
	</c:if>
	<c:if test="${t_name eq null}">
			==if true==
	</c:if>
--%>

	<input type ="button" value="등록" onClick="goWrite()" >
</form>
</body>
<script>
	function goWrite(){
		var form = document.mem;
		form.action = "/MemberWriteForm";
		form.method = "post";
		form.submit();
	}
	</script>
</html>