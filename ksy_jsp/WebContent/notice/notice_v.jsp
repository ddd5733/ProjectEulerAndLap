<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="dao.Exam_DAO,dto.Exam_DTO"%>
<%@ include file="/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
		
		<!-- sub page start -->
		<div class="notice">
			<div class="sub-notice">
			<h2 class="color"><a href="/notice/notice_r.jsp"><i class="fas fa-check"></i> NOTICE</a></h2>	
			<h2><a href="/event/event_r.jsp"> Event</a></h2>
			<h2><a href="/faq/faq_r.jsp"> FAQ</a></h2>	
			<h2><a href="/news/news_r.jsp"> NEWS</a></h2>	
			</div>
<style>
textarea{
	width:100%;
	height:300px;
	border:none;
	resize:none;
}
</style>			
		<!-- cont start-->
		<form name="notice" enctype="multipart/form-data">
		<input type="hidden" name="t_notice_no"  value="${t_dto.getNotice_no()}">
		<div class="cont-box">
			<h3>${t_dto.getTitle()}<br>
				<span>${t_dto.getReg_date()} / ${t_dto.getReg_id()} / Notice </span></h3>
			
			<div>
				<textarea readonly>${t_dto.getContent()}</textarea>
			</div>
			
			<p>[attached file ]</p><br>
		<c:if test="${t_dto.getFile_name_1() != null}">
				<div>
					<td><a href="/common/filedown.jsp?t_file=${t_dto.getFile_name_1()}&t_gubun=notice">${t_dto.getFile_name_1()}</a>
					</td>
				</div>
		</c:if>
		</div>
			
		<!-- sub button start-->
		
		<div class="list">
			<a href="">Support</a>&nbsp;&nbsp;
			<a href="/noticeServletPaging">List</a>&nbsp;&nbsp;
			<a href="/noticeServlet2?t_notice_no=${t_dto.getNotice_no()}&&t_work=gou">Modify</a>&nbsp;&nbsp;
			<a href="javascript:deleteNotice()">Delete</a>
		</div>
		</form>		
		<!--  footer start  -->
<%@  include file="/footer.jsp" %>
		</div>
		
		<script>
			function deleteNotice(){
				var yn = confirm("정말 삭제 하겠습니까?");
				if(yn==true){
					var fm = document.notice;
					fm.action = "/noticeServlet_d";
					fm.method = "post";
					fm.submit();
				}
			}
		</script>
	</body>	
</html>