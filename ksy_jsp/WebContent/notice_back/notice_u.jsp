<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="dao.Notice_DAO,dto.Notice_DTO"%>
<%@ include file="/header.jsp" %>

<%
	Notice_DAO dao 	 = new Notice_DAO();
	String notice_no = request.getParameter("t_noticeNo");
	Notice_DTO dto 	 = dao.getNoticeView(notice_no);
%>

		
		
		<!-- sub page start -->
		<div class="notice">
			<div class="sub-notice">
			<h2><span><i class="fas fa-edit"></i> NOTICE-modify</span></h2>	
			</div>
			
			<div class="notice-write">
			
			<form name="write" enctype="multipart/form-data">
				<input type="hidden" name="t_notice_no"  value="<%=notice_no%>">
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
								<td><input type="text" name="t_title" id="title" class="title" value="<%=dto.getTitle()%>" placeholder="must witre title"></td>
							</tr>
							
							<tr>
								<th><label for="cont">Content</label></th>
								<td><textarea type="cont" name="t_content" id="cont" class="cont" placeholder="must witre content"><%=dto.getContent()%></textarea>
							</tr>
							
							<tr>
								<th><label for="file">Attached file</label></th>
								<td>
								<%if(dto.getFile_name_1() != null){%>
									<a href="/common/filedown.jsp?t_file=<%=dto.getFile_name_1()%>&t_gubun=notice"><%=dto.getFile_name_1()%></a>
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
								<a href="notice_r.jsp"><input type="button" value="List" class="btn">
								</td>
							</tr>

							</table>
					</fieldset>
					<input type="hidden" name="t_work_gubun" value ="su">
		
				</form>
			</div>
			

		<!--  footer start  -->
<%@  include file="/footer.jsp" %>
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
			
				write.action = "notice_proc.jsp";
				write.method = "post";
				write.submit();
			}
		</script>
	
	</body>
</html>