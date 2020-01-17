<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/header.jsp" %>

		
		
		<!-- sub page start -->
		<div class="notice">
			<div class="sub-notice">
			<h2><span><i class="fas fa-edit"></i> NEWS-write</span></h2>	
			</div>
			
			<div class="notice-write">
			
			<form name="write" enctype="multipart/form-data">
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
								<th><label for="title">작성자</label></th>
								<td style="padding-top:10px; padding-bottom:10px"><%=sessionName%></td>
							</tr>
							
							<tr>
								<th><label for="title">제목</label></th>
								<td><input type="text" name="t_title" id="title" class="title" placeholder="제목을 입력해주세요"></td>
							</tr>
							
							<tr>
								<th><label for="cont">내용</label></th>
								<td><textarea type="cont" name="t_content" id="cont" class="cont" placeholder="내용을 입력해주세요"></textarea>
							</tr>
							
							<tr>
								<th><label for="file">파일 첨부</label></th>
								<td><input type="file" name="fileName_a" class="file" id="file"></label></td>
							</tr>
							
							<tr>
								<td colspan="2">
								<a href="javascript:newscheck()"><input type="button" value="전송" class="btn" ></a>
								<input type="button" onclick="javascript:gohub_r()" value="목록" class="btn">
								</td>
							</tr>
			<input type="hidden" name="t_work" value="insert">
			<input type="hidden" name="t_reg_id" value="<%=sessionId%>">
							</table>
					</fieldset>
				</form>
				
				<form name="list" enctype="multipart/form-data">
				<input type="hidden" name="t_work" value="gor">
				</form>
			</div>
			

		<!--  footer start  -->
<%@  include file="/footer2.jsp" %>
		</div>

	
		<script>
		function gohub_r(){
			var fm = document.list;
			fm.action ="/newshubServlet";
			fm.method ="post";
			fm.submit();
		}
			function newscheck() {
				if(write.t_title.value==""){
				alert("제목을 입력하세요");
				write.t_title.focus();
				return;
				}
				if(write.t_content.value==""){
				alert("내용을 입력하세요");
				write.t_content.focus();
				return;
				}
				// 첨부 용량 체크 
				var file = write.fileName_a; 
				if(file.value != ""){ //첨부했을때 사이즈 체크
					
					var fileName = file.value;
					var pathFileName = fileName.lastIndexOf(".")+1; //확장자 제외한 경로+파일명
					var extension = (fileName.substr(pathFileName)).toLowerCase(); //확장자명
					
					if(extension != "jpg" && extension != "gif" && extension != "png"){ //파일명.확장자
						alert(extension +" 형식 파일은 업로드 안됩니다. 이미지 파일만 가능!")
						return;
					}
					
					var position = file.value.lastIndexOf("\\")+1; 
					var fName    = file.value.substr(position);
					var len      = fName.length;
					
					if(len > 20){
						alert("첨부파일명 길이 20자리 이내");
						return;
					}
					// 사이즈체크
					var maxSize  = 8 * 1024 * 1024    //8MB
					var fileSize = 0;

					var browser=navigator.appName; // 브라우저 확인
					
					if(browser=="Microsoft Internet Explorer"){ // 익스플로러일 경우
						var oas = new ActiveXObject("Scripting.FileSystemObject");
						fileSize = oas.getFile(file.value).size;
					}else{	// 익스플로러가 아닐경우
						fileSize = file.files[0].size;
					}
					
					// alert("파일사이즈 : "+fileSize);
					if(fileSize > maxSize){
						alert("첨부파일 사이즈는 2MB 이내로 등록 가능합니다.    ");
						return;
					}
				}
				write.action = "/newsUpdateServlet";
				write.method = "post";
				write.submit();
			}
		</script>
	
	</body>
</html>