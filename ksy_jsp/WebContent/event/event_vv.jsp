<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*,dao.Event_DAO,dto.EventM_DTO,dto.Event_DTO,common.CommonUtil"%>
<%@ include file="/header.jsp" %>
<%
	Event_DAO dao 	 = new Event_DAO();
	String event_no = request.getParameter("t_eventNo");
	int nHit 		 = dao.HitThatFalk(event_no);
	Event_DTO dto 	 = dao.getView(event_no);
	String today = CommonUtil.getToday();
	int todays = CommonUtil.StiWithout(today);
	String	lv = sessionLevel;
	ArrayList<EventM_DTO> dtos = dao.getEventMList(event_no);
	int hmp = dao.howManyP(event_no);
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
		<div class="cont-box">
			<h3><%=dto.getTitle()%><br>
				<span><%=dto.getReg_date()%> / <%=dto.getReg_id()%> / Event Apply Present Condition </span></h3>
			
			<div>
							<table class="table">
					<caption>공지사항 - 번호, 제목, 첨부, 작성일, 조회수</caption>
					<colgroup>
						<col width="5%">
						<col width="30%">
						<col width="*"> 
						<col width="10%">
						<col width="10%">
						<col width="20%">
					</colgroup>
					
					<thead>
						<tr>
							<th scope="col">Number</th>
							<th scope="col">Title</th>
							<th scope="col">ApplyStory</th>
							<th scope="col">Name</th>
							<th scope="col">ApplyID</th>
							<th scope="col">ApplyDate</th>
						</tr>
					</thead>
					<tbody>
			
			
		
		<%	
		if(dtos.size() != 0){
		%>
		<% 
		String cont ="";
		for(int k = 0 ; k < dtos.size() ; k++ )	{
			cont =dtos.get(k).getContent();
		if(cont.length()>20){
			cont =dtos.get(k).getContent().substring(0,20)+"...";
		}
		%>		
	<tr onClick="location.href='event_vvv.jsp?t_eventNo=<%=dtos.get(k).getEvent_m_no()%>&t_reg_id=<%=dtos.get(k).getReg_id()%>'" style="cursor:pointer;">
			<td><%=k+1%></td>
			<td><%=dtos.get(k).getTitle()%></td>
			<td><%=cont%></td>
			<td><%=dtos.get(k).getName()%></td>
			<td><%=dtos.get(k).getReg_id()%></td>
			<td><%=dtos.get(k).getReg_date()%></td>
			</tr>	
		<%}
		
		}else{
		%>	
			<tr>
			<td colspan ='6'>doesn't have existing</td>
			</tr>
		<%
		}
		%>
					</tbody>
				</table>
			</div>
			
			<p>Span Of Event</p><br>	
				<div>
					<td>
					<%if(CommonUtil.StiWithout(20+dto.getStart_date()) > todays){
					%>
								
						Start Date : 20<%=dto.getStart_date()%> ~   Closed date: 20<%=dto.getEnd_date()%>
					<%	
							}else{
					%>
							Start Date : 20<%=dto.getStart_date()%> ~   Closed date: 20<%=dto.getEnd_date()%>
					<%
							}
					%>
					</td>
					
				</div>
		
		</div>
			
		<!-- sub button start-->
		
		<div class="list">
			<a href="javascript:history.back();">Back</a>&nbsp;&nbsp;
		</div>
		</form>		
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
		</script>
	</body>	
</html>