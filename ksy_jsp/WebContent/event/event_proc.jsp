<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ page import="dao.Event_DAO,common.CommonUtil,dto.Event_DTO"%>
<%@ include file="/common/common_session_info.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	Event_DAO dao = new Event_DAO();
	
	String event_no		= "";
	String	reg_id = sessionId;
	String title		= request.getParameter("t_title");
	String content		= request.getParameter("t_content");
	String reg_date = CommonUtil.getToday();
	String start_date	= request.getParameter("t_startDate");
	String end_date		= request.getParameter("t_colseDate");
	int		 hit		= 0;
	String work			= request.getParameter("t_work_gubun");
	int result =0;
	String query = "";
	String babo ="";
	if(work.equals("insert")){
		event_no = dao.getEventNo();
		query = " insert into A06_TRACK2_HOME_EVENT(event_no,title,content,reg_id,reg_date,start_date,end_date) "+
				" values('"+event_no+"','"+title+"','"+content+"','"+reg_id+"','"+reg_date+"','"+start_date+"','"+end_date+"') ";				
		babo="이벤트 등록";
		result = dao.update(query);
	} else 	if(work.equals("del")){
		event_no = request.getParameter("t_event_no");
		 query = " delete from A06_TRACK2_HOME_EVENT where event_no = '"+event_no+"' ";
		babo="삭제";
		result = dao.update(query);
	} else if(work.equals("up")){
		event_no = request.getParameter("t_event_no");	
			query = " update A06_TRACK2_HOME_EVENT set title ='"+title+"', content ='"+content+"', "+
				    " reg_id='"+reg_id+"', start_date = '"+start_date+"', end_date = '"+end_date+"' "+
				    " where event_no = '"+event_no+"' ";
			babo="수정";
			result = dao.update(query);
	} else if (work.equals("ap")){
		event_no = request.getParameter("t_event_no");	
		query = " insert into A06_TRACK2_HOME_EVENT_M(event_m_no,title,content,reg_id,reg_date) "+
				" values('"+event_no+"','"+title+"','"+content+"','"+reg_id+"','"+reg_date+"' ) ";
		babo="이벤트 신청";
		result = dao.update(query);
	} else if (work.equals("evencan")){
	event_no = request.getParameter("t_event_no");	
	query =  " delete from A06_TRACK2_HOME_EVENT_M where event_m_no = '"+event_no+"' ";
		babo="이벤트 취소";
		result = dao.update(query);
	} else if (work.equals("con")){
		event_no = request.getParameter("t_event_no");	
		reg_id = request.getParameter("t_reg_id");	
		query = " update A06_TRACK2_HOME_EVENT_M set  "+
				" status = 'f' " +	
			    " where event_m_no = '"+event_no+"' ";
		result = dao.update(query);
			if(result != 0){
				query = " update A06_TRACK2_HOME_EVENT_M set  "+
						" status = 'w' " +	
					    " where event_m_no = '"+event_no+"' "+
					    " and reg_id = '"+reg_id+"' ";
					result = dao.update(query);
					babo= "이벤트 당첨자 선정";
			}
	} 
	


%>

<html>
	<head>
		<script>	
			<% if(result != 0){%>
				alert("<%=babo%> 완료.");
			<% } else {%>
				alert("<%=babo%> 실패.");
			<% }  %>
			location.href = "/index.jsp";
		</script>
	</head>
</html>