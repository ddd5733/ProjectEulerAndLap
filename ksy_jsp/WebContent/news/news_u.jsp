<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="dao.News_DAO,dto.News_DTO"%>
<%
	News_DTO dto  = (News_DTO)request.getAttribute("t_dto");
%>
<%@ include file="/header.jsp" %>
		
		
		<!-- sub page start -->
		<div class="notice">
			<div class="sub-notice">
			<h2><span><i class="fas fa-edit"></i>NEWS-modify</span></h2>	
			</div>
			
			<div class="notice-write">
			
			<form name="upde" enctype="multipart/form-data">
				<input type="hidden" name="t_news_no"  value="<%=dto.getNews_no()%>">
					<h2 class="readonly">제목, 첨부파일, 내용을 작성합니다</h2>
				<input type="hidden" name="t_work" value="up">
				<input type="hidden" name="t_reg_id" value="<%=sessionId%>">
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
								<td><input type="text" name="t_title" id="title" class="title" value="<%=dto.getTitle()%>" placeholder="must write Title"></td>
							</tr>
							
							<tr>
								<th><label for="cont">Content</label></th>
								<td><textarea type="cont" name="t_content" id="cont" class="cont" placeholder="must write Content"><%=dto.getContent()%></textarea>
							</tr>
							
							<tr>
								<th><label for="file">Attached file</label></th>
								<td>
								<%if(dto.getFile_name_1() != null){%>
									<a href="javascript:goFiledown()"><%=dto.getFile_name_1()%></a>
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
				<form name="filedown">
					<input type="hidden" name="t_work" value="gof">
					<input type="hidden" name="t_gubun" value="news">
					<input type="hidden" name="t_file" value="<%=dto.getFile_name_1()%>">
				</form>
			</div>
			

		<!--  footer start  -->
<%@  include file="/footer2.jsp" %>
		</div>
			
		<script>
			function save() {
				var fm = document.upde;
				if(fm.t_title.value==""){
				alert("제목을 입력하세요");
				fm.t_title.focus();
				return;
				}	
				if(fm.t_content.value==""){
				alert("내용을 입력하세요");
				fm.t_content.focus();
				return;
				}		
				fm.action = "/newsUpdateServlet";
				fm.method = "post";
				fm.submit();
			}
			function goFiledown() {
				var fm = document.filedown;		
				fm.action = "/newshubServlet";
				fm.method = "post";
				fm.submit();
			}
		</script>
	
	</body>
</html>