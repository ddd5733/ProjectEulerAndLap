<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>
<%@ page import="java.util.*,dao.Exam_DAO,dto.Exam_DTO,common.CommonUtil"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%
request.setCharacterEncoding("UTF-8");
%>		
<style>


.seachbox{
		text-align:right;
		margin-right:60px;
}
.seachbox .seachtext .seachbox .seachsel{
				
}


</style>


<form name="notice" > 		
		<!-- sub page start -->
		<div class="notice">
			<div class="sub-notice">
			<h2 class="color"><a href="/notice/notice_r.jsp"><i class="fas fa-check"></i> NOTICE</a></h2>	
			<h2><a href="/event/event_r.jsp"> Event</a></h2>
			<h2><a href="/faq/faq_r.jsp"> FAQ</a></h2>	
			<h2><a href="/news/news_r.jsp"> NEWS</a></h2>	
		</div>
		<p class="seachbox">
			<select class = "seachsel" name="t_sel" style="vertical-align:middle;  height:23px;">
				<option value="title" <c:if test="${t_selValue == 'title'}"><%out.print("selected");%> </c:if>>title</option>
<option value="content" <c:if test="${t_selValue eq 'content'}"><%out.print("selected");%></c:if>>content</option>
			</select>
			<input class ="seachtext" type="text" value="${t_txtValue}" name="t_search" size="20" maxlength="20" style="vertical-align:middle;  height:23px;"/>
			<input type="button"  class ="seachbutton"  style= "vertical-align:middle;  height:23px;" onClick="formSearch()" value="Search"
		</p>	
		<input type="hidden" name = "t_work" value="mainView">
</form>			
			<!-- table start-->
			<div class="table-box">
				<table class="table">
					<caption>공지사항 - 번호, 제목, 첨부, 작성일, 조회수</caption>
					<colgroup>
						<col width="5%">
						<col width="*">
						<col width="7%">
						<col width="15%">
						<col width="10%">
					</colgroup>
					
					<thead>
						<tr>
							<th scope="col">Number</th>
							<th scope="col">Title</th>
							<th scope="col">Attache</th>
							<th scope="col">Regdate</th>
							<th scope="col">Hits</th>
						</tr>
					</thead>
					<tbody>
<c:set var="aaa" value="0"></c:set>
<c:forEach items="${t_dtos}" var="dtos" >
	<c:set var="aaa" value="${aaa+1}"></c:set>			
					 <tr>
						<td><a href="/noticeServlet2?t_work=gov">${aaa}</a></td>
						<td class="txt"><a href="/noticeServlet2?t_work=gov&&t_notice_no=${dtos.getNotice_no()}">${dtos.getTitle()}</a></td>
					 	<td>
				${dtos.getFile_name_1() != null ? '<i class="far fa-save"></i>' : '-'}
						</td>
						<td>${dtos.getReg_date()}</td>
						<td>${dtos.getHit()}</td>
					 </tr>
</c:forEach>						
				
			
			<a href="/noticeServlet2?t_work=gow" class="btn-write">Write</a>
		</div>
	</div>

<script>
	function formSearch(){
		var fm = document.notice;
		fm.action ="/noticeListServlet";
		fm.method ="post";
		fm.submit();
	}
</script>			
		
		
		<!--  footer start 
<%@  include file="/footer.jsp" %>
		</div>
	-->	
	
	
	</body>
</html>









