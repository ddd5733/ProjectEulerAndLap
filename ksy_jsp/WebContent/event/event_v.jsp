<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*,dao.Event_DAO,dto.Event_DTO,dto.EventM_DTO,common.CommonUtil"%>
<%@ include file="/header.jsp" %>
<%
	Event_DAO dao 	 = new Event_DAO();
	String event_no = request.getParameter("t_eventNo");
	int nHit 		 = dao.HitThatFalk(event_no);
	Event_DTO dto 	 = dao.getView(event_no);
	String today = CommonUtil.getToday();
	int todays = CommonUtil.StiWithout(today);
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
		<input type="hidden" name="t_work_gubun" value ="del">
		</form>	
		
		<form name="evnto2">
			<input type="hidden" name="t_work_gubun" value="evencan">
			<input type="hidden" name="t_event_no"  value="<%=event_no%>">
			</form>
		<div class="cont-box">
			<h3><%=dto.getTitle()%></h3>
				<span><%=20+dto.getReg_date()%> / <%=dto.getReg_id()%> / Event </span></h3>
			
			<div>
				<textarea readonly><%=dto.getContent()%></textarea>
			</div>
			
			<p>Span Of Event</p><br>	
				<div>
					<td>
					<%if(CommonUtil.StiWithout(dto.getStart_date()) > todays){
					%>
								
						Start Date : 20<%=dto.getStart_date()%> ~  Closed date: 20<%=dto.getEnd_date()%>
					<%	
							}else{
					%>
							Start Date : 20<%=dto.getStart_date()%> ~  Closed date: 20<%=dto.getEnd_date()%>
					<%
							}
					%>
					</td>
				</div>
		
		</div>
		<!-- sub button start-->
		
		<div class="list">
			<a href="javascript:history.back();">Back</a>&nbsp;&nbsp;
		
		<%if(CommonUtil.StiWithout(20+dto.getEnd_date()) < CommonUtil.StiWithout(today)){
		%>			
		
		<%
		}else {
		%>
			<%
				if(result>0){
			%>
			<a href="javascript:deleteevent()">ApplyCancle</a>
			<a href="event_uu.jsp?t_eventNo=<%=event_no%>">ApplyModify</a>&nbsp;&nbsp;
			<%
				if(lv.equals("manager")){
			%>
			<a href="event_u.jsp?t_eventNo=<%=event_no%>">Modify</a>&nbsp;&nbsp;
			<a href="javascript:delete123()">Delete</a>
			<%
				}
			%>
			<%
				}else{
			%>
				<a href="event_ww.jsp?t_eventNo=<%=event_no%>">Apply</a>&nbsp;&nbsp;
			<%
				}
			%>
			
			
		
			
		
		<%
			}
		%>
		</div>
			
		<!--  footer start  -->
<%@  include file="/footer.jsp" %>
		</div>
		
		<script>
			function delete123(){
				var yn = confirm("정말 삭제 하시겠습니까?");
				if(yn==true){
					var fm = document.evnt;
					fm.action = "event_proc.jsp";
					fm.method = "post";
					fm.submit();
				}
			}
			function deleteevent(){
				var yn = confirm("정말 취소 하시겠습니까?");
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