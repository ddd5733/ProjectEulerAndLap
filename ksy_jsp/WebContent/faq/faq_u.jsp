<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="dao.Faq_DAO,dto.Faq_DTO"%>
<%@ include file="/header.jsp"%>


<%
	Faq_DAO dao 	 = new Faq_DAO();
	String faq_no = request.getParameter("t_faqNo");
	Faq_DTO dto 	 = dao.getFaqView(faq_no);
%>








<html lang="ko">
		<!-- sub page start -->
		<div class="notice">
			<div class="sub-notice">
			<h2><span><i class="fas fa-edit"></i> FAQ-Modify</span></h2>	
			</div>
			
			<div class="notice-write">
			
			<form name="faq">
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
								<td><input type="text" name="t_title" id="title" class="title" value="<%=dto.getTitle()%>"></td>
								<input type="hidden" name="t_work"  value ="up">
								<input type="hidden" name="t_faqNo"  value ="<%=dto.getFaq_no()%>">
							</tr>
							
							<tr>
								<th><label for="cont">Content</label></th>
								<td><textarea type="cont" name="t_content" id="cont" class="cont" placeholder="must write Content"><%=dto.getContent()%></textarea>
							</tr>

							<tr>
								<td colspan="2">
								<input type="button" onclick="javascript:save();" value="Save" class="btn"  >
								<input type="button" onclick="location.href='/faq/faq_r.jsp'" value="List" class="btn">
								</td>
							</tr>

							</table>
					</fieldset>
				</form>
			</div>
			

		
		<!--  footer start  -->
		<%@ include file="/footer.jsp"%>
		</div>
	
	
		<script>
			function save(){
				var fm = document.faq;
				if(fm.t_title.value==""){
					alert("제목 입력!");
					fm.t_title.focus();
					return;
				}
				if(fm.t_content.value==""){
					alert("내용 입력!");
					fm.t_content.focus();
					return;
				}
		
				fm.action="faq_proc.jsp";
				fm.method="post";
				fm.submit();
			}
		
			
		</script>
	
	</body>
</html>









