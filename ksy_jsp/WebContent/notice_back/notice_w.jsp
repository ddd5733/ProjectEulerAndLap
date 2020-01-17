<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>
		
		
		<!-- sub page start -->
		<div class="notice">
			<div class="sub-notice">
			<h2><span><i class="fas fa-edit"></i> NOTICE-write</span></h2>	
			</div>
			
			<div class="notice-write">
			
			<form name ="insert" enctype="multipart/form-data"> 
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
								<td><input type="text" name="t_title" id="title" class="title" placeholder="must witre title"></td>
							</tr>
							
							<tr>
								<th><label for="cont">Content</label></th>
								<td><textarea type="cont" name="t_content" id="cont" class="cont" placeholder="must witre content"></textarea>
							</tr>
							
							<tr>
								<th><label for="file">Attached file</label></th>
								<td><input type="file" name="fileName_a" class="file" id="file" ></label></td>
							</tr>
							
							<tr>
								<td colspan="2">
								<input type="button" value="save" class="btn" onClick="save();" >
								<input type="button" onClick="location.href='/notice/notice_r.jsp'"  value="list" class="btn">
								</td>
							</tr>
					<input type="hidden" name="t_work_gubun" value ="insert">
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
				// 첨부 용량 체크 
				var file = fm.fileName_a; 
				if(file.value != ""){ //첨부했을때 사이즈 체크

					var position = file.value.lastIndexOf("\\")+1;
					var fName = file.value.substr(position);
					var len = fName.length;
					
					if(len > 20){
						alert("첨부파일명 길이 20자리 이내");
						return;
					}
					
					// 사이즈체크
					var maxSize  = 2 * 1024 * 1024    //2MB
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
				fm.action ="notice_proc.jsp";
				fm.method ="post";
				fm.submit();
			}			
			
			
		</script>
	
	</body>
</html>









