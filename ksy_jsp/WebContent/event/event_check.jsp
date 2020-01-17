<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/header.jsp" %>
	<%@ page import="java.util.*,dao.Event_DAO,dto.EventM_DTO,dto.Event_DTO,common.CommonUtil"%>	
<%
request.setCharacterEncoding("UTF-8");		

String	lv = sessionLevel;
Event_DAO dao = new Event_DAO();
String selValue = request.getParameter("t_sel");
String txtValue = request.getParameter("t_search");
if(selValue == null){
		selValue = "title";
		txtValue = "";
}
ArrayList<Event_DTO> dtos = dao.getEventList2(selValue,txtValue);
String today = CommonUtil.getToday();


//******** page 시작 *******/
		String tdCount ="5";				

	String r_page = CommonUtil.checkNull(request.getParameter("r_page"));		
	int			current_page;					// 현재페이지 번호
	int			total_page;						// 총페이지 수
	int			total_count;					// 총레코드 수
	int			for_count;						
	int			list_setup_count = 10;			// 한번에 출력될 List 수
	int			p_no;
	int			v_count;
	int			a_count;
	String		url				= null;	

	// 조회된 건수 구하기  total_count : 설정
	if(dtos == null) total_count =0;
	else total_count = dtos.size(); 


	// 페이지번호가 없으면 1페이지로 간주
	if(r_page.equals("")) current_page = 1;
	else current_page = Integer.parseInt(r_page);
		
	for_count		= list_setup_count;
	p_no			= list_setup_count;				// 페이지수가 10
	total_page = total_count / list_setup_count;		// 전체페이지수 계산 (if 23개 게시물이면 2)

	if(current_page == 1) {
		v_count		= 0;
		a_count		= list_setup_count;
		for_count	= 0;
	} else{
		v_count		= 0;
		a_count		= p_no * current_page;
		for_count	= a_count - list_setup_count;
	}
	if(total_page * list_setup_count != total_count)   total_page = total_page +1;
	//******** page 끝 *******/

%>
<style>
.seachbox{
		text-align:right;
		margin-right:60px;
}
.seachbox .seachtext .seachbox .seachsel{
				
}	
</style>				
		
		<!-- sub page start -->
		<div class="notice">
			<div class="sub-notice">
			<h2><a href="/notice/notice_r.jsp">NOTICE</a></h2>	
			<h2 class="color"><a href="/event/event_r.jsp"><i class="fas fa-check"></i> Event</a></h2>
			<h2><a href="/faq/faq_r.jsp"> FAQ</a></h2>	
			<h2><a href="/news/news_r.jsp"> NEWS</a></h2>	
			</div>
		
		<form name="news">
		<p class="seachbox">
			<select class = "seachsel" name="t_sel" style="vertical-align:middle;  height:23px;">
				<option value="title" <%if(selValue.equals("title")) out.print("selected"); %>>Title</option>
				<option value="content" <%if(selValue.equals("content")) out.print("selected"); %>>Content</option>
			</select>
			<input class ="seachtext" type="text" value="<%=txtValue%>" name="t_search" size="20" maxlength="20" style="vertical-align:middle;  height:23px;"/>
			<input type="button"  class ="seachbutton"  style= "vertical-align:middle;  height:23px;" onClick="formSearch()" value="Search"
		</p>				
		</form>
			<!-- table start-->
			<div class="table-box">
				<table class="table">
					<caption>공지사항 - 번호, 제목, 첨부, 작성일, 조회수</caption>
					<colgroup>
						<col width="5%">
						<col width="*"> 
						<col width="12%">
						<col width="30%">
						<col width="12%">
						<col width="10%">
					</colgroup>
					
					<thead>
						<tr>
							<th scope="col">Number</th>
							<th scope="col">Title</th>
							<th scope="col">EventCondition</th>
							<th scope="col">Enddate</th>
							<th scope="col">TNOA</th>
							<th scope="col">Hits</th>
						</tr>
					</thead>
					<tbody>
<%	
	int hmp = 0;
	if ( total_count > 0 ){
		for(int k = 0 ; k < total_count ; k++ )	{
			if(v_count == for_count){ 
				hmp = dao.howManyP(dtos.get(k).getEvent_no());
%>				<a href="event_v.jsp">
					 <tr onClick="location.href='event_vv.jsp?t_eventNo=<%=dtos.get(k).getEvent_no()%>'" style="cursor:pointer;">
						<td><%=k+1%></td>
						<td class="txt"><a href="event_vv.jsp"><%=dtos.get(k).getTitle()%></a></td>
						<td class="gray"><span>
						<%if(CommonUtil.StiWithout(20+dtos.get(k).getEnd_date()) < CommonUtil.StiWithout(today)){
						%>
							Closed
						<%	
							}else{
						%>
							OnGoing
						<%
							}
						%>	
						</span></td>
						<td>
							<%=dtos.get(k).getEnd_date()%>
						</td>
						<td><%=hmp%></td>
						<td><%=dtos.get(k).getHit()%></td>
					 </tr>
				</a>
<%
				v_count = v_count + 1;
				for_count = for_count + 1;
			}else { 
				v_count = v_count + 1;
			}

			if(v_count == a_count)break; 

		}
	}else{	
%>					 
	
   <TR align="center" bgcolor="white" >
       <TD colspan="<%=tdCount%>">doesn't have existing</TD>
   </TR>
<%	} %> 					 
					 
					</tbody>
				</table>
			<div class="page-number">
			<a><i class="fas fa-arrow-circle-left fa-lg"></i></a>
<%
		url = "event_r.jsp?t_sel="+selValue+"&t_search="+txtValue;		
		out.println(CommonUtil.pageList(current_page, total_page, url));
%>							
				
	<a href="javascript:history.back();" class="btn-write">Back</a>
		</div>
	</div>
		
		
		
<%@  include file="/footer.jsp" %>
		</div>
<script>
	function formSearch(){ //제목 검색
		var fm = document.news; 		
		fm.action = "event_check.jsp";
		fm.method = "post";
		fm.submit();
	}
</script>
	
	
	</body>
</html>









