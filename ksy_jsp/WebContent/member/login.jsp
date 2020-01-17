<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>
		
		
		<!-- sub page start -->
		<div class="notice">
			<div class="sub-notice">
			<h2><span><i class="fas fa-sign-in-alt"></i> LOGIN </span></h2>	
				<p>- 로그인 -</p>
			</div>
			
		<!--login start-->
			<div class="login-box">
			<form name="loginform" >
				<fieldset>
					<legend>로그인</legend>
					<div class="left-box">
						<p><label for="id" class="readonly">아이디</label>ID &nbsp;&nbsp;&nbsp;<input type="text" name="t_id" class="txt" id="t_id" onkeypress="if(event.keyCode==13){go_password()}" placeholder="&nbsp;&nbsp;아이디를 입력하세요"></p>
						<p><label for="password" class="readonly">비밀번호</label>PW &nbsp;<input type="password" name="t_pw" class="txt" id="t_pw" onkeypress="if(event.keyCode==13){logincheck()}" placeholder="&nbsp;&nbsp;비밀번호를 입력하세요"></p>
					</div>
					
					<div class="right-box">
						<input type="button" value="LOGIN" class="log" onClick="logincheck();">
					</div>
					
					<div class="checksave">
						<input type="checkbox" value="1" id="idsave" name="idsave"><label for="idsave">&nbsp;&nbsp;&nbsp;아이디 저장</label>
				
						<input type="checkbox" value="1" id="pwsave" name="pwsave" class="margin"><label for="pwsave">&nbsp;&nbsp;&nbsp;비밀번호 저장</label>
					</div>
						<p class="btn">
						<a href="#">ID/PW찾기</a>
						<a href="join.jsp">회원가입</a>
						</p>
						
				</fieldset>
			</form>
			</div>
		</div>
		
		
		
<%@  include file="/footer2.jsp" %>
		</div>
	
	
		<script>
		
			function logincheck() {
				var ttt = document.loginform;
				if(ttt.t_id.value=="") {
				alert("아이디를 입력하세요");
				ttt.t_id.focus();
					return;
				}
				if(ttt.t_pw.value=="") {
				alert("비밀번호를 입력하세요");
				ttt.t_pw.focus();
					return;
				}
				ttt.action ="/LoginCheck";
				ttt.method ="post";
				ttt.submit();
			}
			function go_password(){
				document.loginform.t_pw.focus();
			}
		</script>
		
	</body>
</html>


















