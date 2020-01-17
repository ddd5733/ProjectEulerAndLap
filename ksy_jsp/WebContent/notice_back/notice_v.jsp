<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="dao.Exam_DAO,dto.Exam_DTO"%>
<%@ include file="/header.jsp" %>
<%
	Exam_DAO dao 	 = new Exam_DAO();
	String notice_no = request.getParameter("t_noticeNo");
	int nHit 		 = dao.noticeHit(notice_no);
	Exam_DTO dto 	 = dao.getNoticeView(notice_no);
%>

		
		<!--  header end -->
		
		
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
		<input type="hidden" name="t_notice_no"  value="<%=notice_no%>">
		<input type="hidden" name="t_work_gubun" value ="del">
		<div class="cont-box">
			<h3><%=dto.getTitle()%><br>
				<span><%=dto.getReg_date()%> / <%=dto.getReg_id()%> / Notice </span></h3>
			
			<div>
				<textarea readonly><%=dto.getContent()%></textarea>
			</div>
			
			<p>[attached file ]</p><br>
			<%if(dto.getFile_name_1() != null){%>		
				<div>
					<td><a href="/common/filedown.jsp?t_file=<%=dto.getFile_name_1()%>&t_gubun=notice"><%=dto.getFile_name_1().substring(8)%></a>
					</td>
				</div>
			<%}%>
		</div>
			
		<!-- sub button start-->
		
		<div class="list">
			<a href="">Support</a>&nbsp;&nbsp;
			<a href="javascript:history.back();">List</a>&nbsp;&nbsp;
			<%if(sessionId.equals("manager")){%>
			<a href="notice_u.jsp?t_noticeNo=<%=dto.getNotice_no()%>">Modify</a>&nbsp;&nbsp;
			<a href="javascript:deleteNotice()">Delete</a>
			<%}%>
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
					fm.action = "notice_proc.jsp";
					fm.method = "post";
					fm.submit();
				}
			}
		</script>
	</body>	
</html>