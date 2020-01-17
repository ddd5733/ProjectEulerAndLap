<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*, dao.News_DAO, dto.News_DTO,common.CommonUtil"%>
<%@ include file="/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	

		
<style>
.select_Box{
	text-align:right;
	margin-right:30px;
	vertical-align : middle;
	margin-bottom:50px;
}
.select_Box select{
	vertical-align : middle;
	height : 25px;
}
.select_Box input[type="text"]{
	height : 25px;
	vertical-align : middle;
}
.button{
	vertical-align : middle;
	width:50px;
	height:25px;
	background:#76b7c0;
	border:none;
	color:white;
}
</style>
		<!-- sub page start -->
			<div class="notice">
				<div class="sub-notice">
				<h2><a href="/notice/notice_r.jsp">NOTICE</a></h2>	
				<h2><a href="/event/event_r.jsp"> Event</a></h2>
				<h2><a href="/faq/faq_r.jsp"> FAQ</a></h2>	
				<h2 class="color"><a href="javascript:formSearch()"><i class="fas fa-check"></i> NEWS</a></h2>	
			</div>
			
		<!-- sub-news start-->
		<div class="news-box">
			<form name="news">
				<p class="select_Box">
					<select name="t_sel">
						<option value="title" <c:if test="${t_selValue == 'title'}"><%out.print("selected");%> </c:if>>title</option>
						<option value="content" <c:if test="${t_selValue eq 'content'}"><%out.print("selected");%></c:if>>content</option>
					</select>
					<input type="text" value="${t_txtValue}" name="t_search" size="30" maxlength="30"/>
					<input class="button" type="button" onClick="javascript:formSearch()" value="search">
				</p>

	<c:set var="forYN" value="true"/>
	<c:set var="num" value="0"/>
<c:if test="${t_dtos.size() >0}">
		<c:forEach items="${t_dtos}" var="dto">	
			<c:if test="${forYN}">
				<c:if test="${v_count == for_count}">
				<ul class="news">
					<li>
						<a href="javascript:gohub_v()">
							<c:if test="${dto.getFile_name_1() != null}">
							<span class="img"><img src="/file_room/news/${dto.getFile_name_1()}" alt="뉴스1"></span>
							</c:if>
							<c:if test="${dto.getFile_name_1() == null}">
							<span class="img"><img src="/images/no_img.jpg"></span>
							</c:if>
							<p>${dto.getTitle()}<br></p>
							<span class="size-up"></span>
						<input type="hidden" name="r_page">	
						<input type="hidden" name="t_work" value="gov">	
						<input type="hidden" name="t_news_no1" value="${dto.getNews_no()}">
						<input type="text" name="t_news_no12" value="${dto.getNews_no()}">
						</a>
					</li>
				</ul>
			</form>	
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
			</div>	
					
			<div class="page-number">
			
<%
//String selValue = (String)request.getAttribute("t_selValue");
//String txtValue = (String)request.getAttribute("t_txtValue");
//String url = "/noticeServletPaging?t_sel="+selValue+"&t_search="+txtValue;	

Integer cp = (Integer)request.getAttribute("current_page");
int current_page = cp.intValue();
Integer tp = (Integer)request.getAttribute("total_page");
int total_page = tp.intValue();

		out.println(CommonUtil.pageList(current_page, total_page));
%>							
			
			<%if(sessionId.equals("manager")){%>
					<a href="javascript:gohub_w()" class="btn-write">Write</a>
				<%}%>
<form name="work">
	<input type="hidden" name="t_work" value="gow">
</form>
		</div>
	</div>
		<!--  footer start  -->
<%@  include file="/footer2.jsp" %>
		</div>
<script>
	function formSearch(){
		var fm = document.news;
		fm.action ="/newsListServlet";
		fm.method ="post";
		fm.submit();
	}
	function gopage(pageNum){
		var fm = document.news;
		fm.r_page.value = pageNum;
		fm.action ="/newsListServlet";
		fm.method ="post";
		fm.submit();
	}
	function gohub_v(){
		var fm = document.news;
		fm.action ="/newsgetvServlet";
		fm.method ="post";
		fm.submit();
	}
	function gohub_w(){
		var fm = document.work;
		fm.action ="/newshubServlet";
		fm.method ="post";
		fm.submit();
	}
</script>		
	</body>
</html>









