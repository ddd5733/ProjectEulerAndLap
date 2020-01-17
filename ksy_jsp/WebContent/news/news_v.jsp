<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="dao.News_DAO,dto.News_DTO"%>

<%
	String news_no   = (String)request.getAttribute("t_news_no");
	News_DTO dto   = (News_DTO)request.getAttribute("t_dto");
%>

<%@ include file="/header.jsp" %>
		
		
		<!-- sub page start -->
		<div class="notice">
			<div class="sub-notice">
			<h2><a href="/notice/notice_r.jsp"> NOTICE</a></h2>	
			<h2><a href="/event/event_r.jsp"> Event</a></h2>
			<h2><a href="/faq/faq_r.jsp"> FAQ</a></h2>	
			<h2 class="color"><a href="javascript:gohub_r()"><i class="fas fa-check"></i> NEWS</a></h2>	
			</div>
			
			<!-- sub-news start-->
			<form name="news" enctype="multipart/form-data">
			<input type="hidden" name="t_news_no"  value="<%=dto.getNews_no()%>">
			<input type="hidden" name="t_work"  value="del">
			<input type="hidden" name="t_fileName"  value="<%=dto.getFile_name_1()%>">
			<div class="cont">
				<h3><%=dto.getTitle()%><br>
				<span><%=dto.getReg_date()%> / <%=dto.getReg_id()%> / NEWS </span><br>
				<span> Hits : <%=dto.getHit()%></span>
				</h3>
				<%if(dto.getFile_name_1() != null){%>	
				<img src="/file_room/news/<%=dto.getFile_name_1()%>" alt="뉴스1" class="my_img">
				<%}else{%>
				<span class="my_img"><img src="/images/no_img.jpg"></span>
				<%}%>
				<p class="txt"><%=dto.getContent()%></p>
			</div>

			</form>
			
			<!-- sub button start-->
			<div class="list">
				<a href="javascript:history.back();">Back</a>&nbsp;&nbsp;
				<%if(sessionId.equals("manager")){%>
				<a href="javascript:gohub_u()">Modify</a>&nbsp;&nbsp;
				<a href="javascript:deleteNews()">Delete</a>
				<%}%>
			</div>
			<form name ="gor">
				<input type="hidden" name="t_work" value="gor">
			</form>
			</div>	
			<form name ="gou">
				<input type="hidden" name="t_work" value="gou">
				<input type="hidden" name="t_news_no" value="<%=dto.getNews_no()%>">
			</form>
		</div>	
		<!--  footer start  -->
<%@  include file="/footer2.jsp" %>
		</div>
		
		<script>
			function deleteNews(){
				var yn = confirm("정말 삭제 하겠습니까?");
				if(yn==true){
					var fm = document.news;
					fm.action = "/newsUpdateServlet";
					fm.method = "post";
					fm.submit();
				}
			}
				function gohub_r(){
						var fm = document.gor;
						fm.action = "/newshubServlet";
						fm.method = "post";
						fm.submit();
					}
				function gohub_u(){
					var fm = document.gou;
					fm.action = "/newsgetvServlet";
					fm.method = "post";
					fm.submit();
				}
			
		</script>
		
	</body>
</html>