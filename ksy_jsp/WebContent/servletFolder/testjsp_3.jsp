<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	request.setCharacterEncoding("UTF-8");
 /*
 	String name = request.getParameter("t_name");
 	String tt_name = (String)request.getAttribute("tt_name");
 	Notice_DTO dto = (Notice_DTO)request.getAttribute("t_dto");
 	ArrayList<String> arr =(ArrayList<String>)request.getAttribute("t_arr");
 	Notice_DTO dto2 = (Notice_DTO)request.getAttribute("t_dto2");
 	*/
 	//파라미터를 받는 방법은 두가지인데 하나는 위에서 인포트해주고 변수 받아서 자바로 표현하고 두번째는 ${t_변수이름}으로 받는다.
 	
 %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>testjsp3</title>
</head>
<body>
name: ${tt_name}<br>
name: ${t_dto.getTitle()}<br>

	<%-- test3.jsp:name   = <%=name%><br>
	tt_name = <%=tt_name%> <br>
	<%=dto.getTitle()%>
	<%=dto.getReg_date()%>
	<%=arr.get(0)%>
	<%=arr.get(1)%><br><br>
	
	노티스번호	<%=dto2.getNotice_no()%><br>
	제목	<%=dto2.getTitle()%><br>
	내용 	<%=dto2.getContent()%><br>
	조회 	<%=dto2.getHit()%><br> --%>
		
	
</body>
</html>