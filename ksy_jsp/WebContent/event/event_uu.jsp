<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,dao.Event_DAO,dto.Event_DTO,dto.EventM_DTO,common.CommonUtil"%>
<%@ include file="/header.jsp" %>
<%
		Event_DAO dao 	 = new Event_DAO();
		String today = CommonUtil.getToday();
		String event_no = request.getParameter("t_eventNo");
		EventM_DTO dto 	 = dao.getViewM(event_no);
		
%>

		
		
		<!-- sub page start -->
		<div class="notice">
			<div class="sub-notice">
				<h2><span><i class="fas fa-edit"></i> EVENT-Apply-Modify</span></h2>	
			</div>
			
			<div class="notice-write">
			
			<form name ="insert"> 
					<h2 class="readonly">제목, 첨부파일, 내용을 작성합니다</h2>
				
					<fieldset>
						<legend>공지사항 글쓰기</legend>
						<table class="table">
							<caption>공지사항 글쓰기</caption>
							<colgroup>
								<col width="20%">
								<col width="*">
							</colgroup>
							
							<tr>
								<th><label for="title">Title</label></th>
								<td colspan="3"><input type="text" name="t_title" id="title" class="title" value="<%=dto.getTitle()%>"></td>
							</tr>
							
							<tr>
								<th><label for="cont">Content</label></th>
								<td colspan ="3"><textarea type="cont" name="t_content" id="cont" class="cont" ><%=dto.getContent()%></textarea>
							</tr>
	
							
							<tr>
								<td colspan="4">
								<input type="button" value="Save" class="btn" onClick="save();" >
								<input type="button" onClick= "javascript:history.back();"  value="Back" class="btn">
								</td>
							</tr>
								<input type="hidden" name="t_work_gubun" value ="up2">
								<input type="hidden" name="t_event_no" value ="<%=event_no%>">
							</table>
					</fieldset>
				</form>
			</div>
			

		
		<!--  footer start  -->
<%@  include file="/footer.jsp" %>
		</div>
	
	
		<script>
			function save(){
				var fm = document.insert;
				if(fm.t_title.value == ""){
					alert("제목을 입력입력해주세요");
					fm.t_title.focus();
					return;
				}
				if(fm.t_content.value == ""){
					alert("내용을 입력입력해주세요");
					fm.t_title.focus();
					return;
				}
				if(fm.t_startDate.value == ""){
					alert("시작날짜를 입력입력해주세요");
					fm.t_startDate.focus();
					return;
				}						
				
				fm.action ="event_proc.jsp";
				fm.method ="post";
				fm.submit();
			}			
			
			
		</script>
	
	</body>
</html>









