<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="dao.News_DAO,dto.News_DTO"%>
<%
	News_DAO dao 	 = new News_DAO();
	String news_no   = request.getParameter("t_newsNo");
	News_DTO dto 	 = dao.getNewsView(news_no);
%>
<%@ include file="/header.jsp" %>
		
		
		<!-- sub page start -->
		<div class="notice">
			<div class="sub-notice">
			<h2><span><i class="fas fa-edit"></i> NEWS-modify</span></h2>	
			</div>
			
			<div class="notice-write">
			
			<form name="write" enctype="multipart/form-data">
				<input type="hidden" name="t_news_no"  value="<%=news_no%>">
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
								<th><label for="title">Writer</label></th>
								<td style="padding-top:10px; padding-bottom:10px";><%=sessionName%></td>
							</tr>
							
							<tr>
								<th><label for="title">Title</label></th>
								<td><input type="text" name="title" id="title" class="title" value="<%=dto.getTitle()%>" placeholder="must write Title"></td>
							</tr>
							
							<tr>
								<th><label for="cont">Content</label></th>
								<td><textarea type="cont" name="cont" id="cont" class="cont" placeholder="must write Content"><%=dto.getContent()%></textarea>
							</tr>
							
							<tr>
								<th><label for="file">Attached file</label></th>
								<td>
								<%if(dto.getFile_name_1() != null){%>
									<a href="/common/filedown.jsp?t_file=<%=dto.getFile_name_1()%>&t_gubun=news"><%=dto.getFile_name_1()%></a>
									&nbsp;&nbsp;Delete File
									<input type="checkbox" name="checkBox_del_fileName" value="<%=dto.getFile_name_1()%>">
									<br>
								<%}%>	
									<br>
									<input type="file" name="fileName_a">
									<input type="hidden" name="ori_fileName_a" value="<%=dto.getFile_name_1()%>">
								</td>
							</tr>
							
							<tr>
								<td colspan="2">
								<a href="javascript:save()"><input type="button" value="Save" class="btn" ></a>
								<a href="javascript:history.back();"><input type="button" value="Back" class="btn">
								</td>
							</tr>

							</table>
					</fieldset>
				</form>
			</div>
			

		<!--  footer start  -->
<%@  include file="/footer2.jsp" %>
		</div>
			
		<script>
			function save() {
				if(write.title.value==""){
				alert("제목을 입력하세요");
				write.title.focus();
				return;
				}
				if(write.cont.value==""){
				alert("내용을 입력하세요");
				write.cont.focus();
				return;
				}		
			
				write.action = "news_update.jsp";
				write.method = "post";
				write.submit();
			}
		</script>
	
	</body>
</html>