<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	

		
<style>
.seachbox{
		text-align:right;
		margin-right:60px;
}
.seachbox .seachtext .seachbox .seachsel{
				
}
</style>


<form name="notice">		
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
				<option value="title" <c:if test="${t_selValue == 'title'}">out.print("selected"); </c:if>>title</option>
				<option value="content" <c:if test="${t_selValue eq 'content'}">out.print("selected");</c:if>>content</option>
			</select>
			<input class ="seachtext" type="text" value="${t_txtValue}" name="t_search" size="20" maxlength="20" style="vertical-align:middle;  height:23px;"/>
			<input type="button"  class ="seachbutton"  style= "vertical-align:middle;  height:23px;" onClick="formSearch()" value="Search">
		</p>
		<input type="hidden" name="r_page">	
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
	<c:set var="forYN" value="true"/>
	<c:set var="num" value="0"/>
<c:if test="${t_dtos.size() >0}">
		<c:forEach items="${t_dtos}" var="dto">	
			<c:if test="${forYN}">
				<c:if test="${v_count == for_count}">
		<c:set var="num" value="${num+1}"/>

					 <tr>
						<td>${num}</td>
						<td class="txt"><a href="/noticeServlet2?t_notice_no=${dto.getNotice_no()}&t_work=gov">${dto.getTitle()}</a></td>
					 	<td>
					 	${dto.getFile_name_1() != null ? '<i class="far fa-save"></i>' : '-'}
						</td>
						
					<td>${dto.getReg_date()}</td>
						<td>${dto.getHit()}</td>
					 </tr>
					<c:set var="v_count" value="${v_count+1}"/>
					<c:set var="for_count" value="${for_count+1}"/>
				</c:if>	
				
					<c:if test="${v_count != for_count}">
						<c:set var="v_count" value="${v_count+1}"/>
					</c:if>
					
						<c:if test="${v_count == a_count}">
							<c:set var="forYN" value="false"/> 
						</c:if>
			</c:if>
		</c:forEach>
	</c:if>
		<c:if test="${t_dtos.size() == 0}">
		   <TR align="center" bgcolor="white" >
		       <TD colspan="${tdCount}">doesn't have existing</TD>
		   </TR>
		</c:if> 	
					</tbody>
				</table>
			<div class="page-number">
			<a><i class="fas fa-arrow-circle-left fa-lg"></i></a>
<%
//String selValue = (String)request.getAttribute("t_selValue");
//String txtValue = (String)request.getAttribute("t_txtValue");
//String url = "/noticeServletPaging?t_sel="+selValue+"&t_search="+txtValue;	

Integer cp = (Integer)request.getAttribute("current_page");
int current_page = cp.intValue();
Integer tp = (Integer)request.getAttribute("total_page");
int total_page = tp.intValue();

		out.println(common.CommonUtil.pageList(current_page, total_page));
%>							
	
			<c:if test="${session_level eq 'manager'}">
			<a href="/noticeServlet2?t_work=gow" class="btn-write">Write</a>
			</c:if>
		</div>
	</div>

<script>
	function formSearch(){
		var fm = document.notice;
		fm.action ="/noticeServletPaging";
		fm.method ="post";
		fm.submit();
	}
	function gopage(pageNum){
		var fm = document.notice;
		fm.r_page.value = pageNum;
		fm.action ="/noticeServletPaging";
		fm.method ="post";
		fm.submit();
	}
</script>			
		
		
		<!--  footer start  -->
<%@  include file="/footer.jsp" %>
		</div>
	
	
	
	</body>
</html>









