<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*,dao.Event_DAO,dto.Event_DTO,dto.EventM_DTO,common.CommonUtil"%>
<%@ include file="/header.jsp" %>
<%
	Event_DAO dao 	 = new Event_DAO();
	String event_no = request.getParameter("t_eventNo");
	String reg_id = request.getParameter("t_reg_id");
	EventM_DTO dto 	 = dao.getViewMM(event_no,reg_id);
	String	lv = sessionLevel;
	String userId = sessionId;
	int result = dao.Kakunin(userId,event_no);
	
%>
		
	
		
		<!-- sub page start -->
		<div class="notice">
			<div class="sub-notice">
			<h2><a href="/notice/notice_r.jsp"> NOTICE</a></h2>	
			<h2 class="color"><a href="/event/event_r.jsp"><i class="fas fa-check"></i> Event</a></h2>
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
		<form name="evnt">
		<input type="hidden" name="t_event_no"  value="<%=event_no%>">
		<input type="hidden" name="t_reg_id"  value="<%=dto.getReg_id()%>">
		<input type="hidden" name="t_work_gubun" value ="con">
		</form>	
		
		<form name="evnto2">
			<input type="hidden" name="t_work_gubun" value="evencan">
			<input type="hidden" name="t_event_no"  value="<%=event_no%>">
			</form>
		<div class="cont-box">
			<h3><%=dto.getTitle()%></h3>
				<span><%=dto.getReg_date()%> / <%=dto.getReg_id()%> / ApplyView </span></h3>
			
			<div>
				<textarea readonly><%=dto.getContent()%></textarea>
			</div>
			<p><%="Name\t\t\t"+   dto.getName()%></p><br>	
			<p><%="ApplyDate\t\t\t20"+   dto.getReg_date()%></p><br>	
	
		
		</div>
		<!-- sub button start-->
		
		<div class="list">
			<a href="javascript:history.back();">Back</a>&nbsp;&nbsp;
		
			<%
				if(lv.equals("manager")){
			%>
			<a href="javascript:con()">SelectWinner</a>
			<a href="javascript:deleteevent()">Delete</a>
			<%
				}
			%>
			
		</div>
			
		<!--  footer start  -->
<%@  include file="/footer.jsp" %>
		</div>
		
		<script>
		function con(){
			var yn = confirm("당첨자를 선정 하시겠습니까?");
			if(yn==true){
				var fm = document.evnt;
				fm.action = "event_proc.jsp";
				fm.method = "post";
				fm.submit();
			}
		}
			function deleteevent(){
				var yn = confirm("정말 삭제 하시겠습니까?");
				if(yn==true){
					var fm = document.evnto2;
					fm.action = "event_proc.jsp";
					fm.method = "post";
					fm.submit();
				}
			}
		</script>
	</body>	
</html>