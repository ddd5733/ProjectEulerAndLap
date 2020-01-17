<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>
		
		
		<!-- sub page start -->
		<div class="notice">
			<div class="sub-notice">
			<h2><span><i class="fas fa-sign-in-alt"></i> SIGN UP</span></h2>	
				<p>- 회원가입을 위해, 작성해주세요 -</p>
			</div>
			
		<!--join start-->
			<div class="join-box">
			
			<form class="join" method="post" name="all" enctype="multifart form-data" action="logincheck.html">
				<fieldset>
					<legend>회원가입 작성</legend>
					<h2 class="readonly">회원가입</h2>
					
						<ul class="id_pw">
							<li>
								<div class="idbox">
								<div class ="idicon"><i class="fas fa-id-card-alt fa-2x"></i></div>
									<input class= "idd" type = "text" name="t_id" maxlength="20" autofocus ="autofocus" placeholder="아이디"/>
									<input class= "idcheck" type = "button" onClick="check_id()" value = "중복검사"/>
									<input type ="hidden" name ="id_check_value">							
								</div>
							<li>	
								<i class="fas fa-unlock-alt fa-2x" ></i>
								<label for="pw"><input type="password" name="t_pw" placeholder="비밀번호"></label>
							</li>	
							<li>	
								<i class="fas fa-lock fa-2x"></i>
								<label for="re_pw"><input type="password" name="t_re_pw" placeholder="비밀번호 재확인"></label>
							</li>
						</ul>
						
						<ul class="name_phone">
							<li>						
								<label for="name"><input type="text" name="t_name" placeholder="이름"></label>
							</li>
							<li>
								<label for="phone"><input type="number" name="t_phone" placeholder="연락처 ex)01034232534(숫자만 입력)" class="phone"></label>
								<label for="certifi"></label>
								<label for="certifi"></label>
								<input type ="hidden" name ="t_gubun" value="insert">	
							</li>
							<li>
								<input type="text" name="t_email1" class="email">&#64;
								<input type="text" name="t_email2" class="email" id ="email2">
								<select id = "emailtype" name="t_emailtype" class="email" onchange="passme();">
									<option>직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="daum.net">daum.net</option>
									<option value="gmail.com">gmail.com</option>
								</select>
							</li>
						</ul>
							
						<ul class="check">
							<p>문자, 이메일을 통한 상품 및 이벤트 정보 수신에 동의 합니다</p>
							<li>
								<label for="agree"><input type="radio" value="1" name="t_agree" id="agree" checked> 1년 정보유지</label>
								<label for="agree2"><input type="radio" value="0" name="t_agree" id="agree2"> 탈퇴시까지 정보유지</label>
							</li>
							<li>
							<label for="yak1"><input type="checkbox" name="t_yak1" id="yak1">이용약관</label>
								<a href="">전문보기</a>
								
							<label for="yak2"><input type="checkbox" name="t_yak2" id="yak2">개인정보이용동의</label>
								<a href="">전문보기</a>
							</li>
						</ul>
						
						<ul class="signup">
						<input type="button" value="✔ SIGN UP" onClick="check123();">
						</ul>
				</fieldset>
			</form>
			
				<div class="login_img">
					<li class="photo1"> </li>
					<li class="photo2"> </li>
					<li class="photo3"> </li>
					<li class="photo4"> </li>
				</div>
			</div>
		
		
		
		
		<!--  footer start  -->
<%@  include file="/footer.jsp" %>
		</div>
	

		<script type="text/javascript">
		
		function passme(){
		var target = document.all.t_emailtype.value;
	      // 옵션 value 값
	   	var e2 =  document.getElementById("email2");
	     e2.value =  target;
	     //인풋상자로 자바스크립트 값 넘기기
	     // document.getElementById("email2"); >>>id값
	     // var target = document.all.t_emailtype.value; >>>>>name값
		}
		function check_id(){
			var id = document.all.t_id.value;
				if(id ==""){
					alert("입력된 아이디가 없습니다");
					id.focus();
				} else {
					window.open("check_id.jsp?t_id="+id,"아이디 중복검사","width=360, height=200");
					//첫번째""연결할페이지,두번째 창이름,3번째 사이즈
				}
			}
			function check123() {
				var form = document.all;
				if(!checkEmpty(form.t_id,"아이디를 입력해주세요")) return;
				if(form.id_check_value.value==""){
					alert("아이디 중복체크 해주세요");
					return;
				}
				if(form.t_id.value != form.id_check_value.value){
					alert("아이디 변경후 중복검사를 실시해주세요");
					form.t_id.focus();
					return;
				}
				if(form.t_id.value.length > 15){
					alert("아이디를 15자 이내로 입력해주세요");
					return;
				}
				
				if(form.t_pw.value=="") {
					alert("비밀번호를 입력해주세요");
					form.t_pw.focus();
					return;
					}
				if(form.t_re_pw.value=="") {
					alert("비밀번호를 재입력해주세요");
					form.t_re_pw.focus();
					return;
					}
				if(form.t_pw.value != form.t_re_pw.value){
					alert("비밀번호가 같지않습니다");
					form.t_pw.focus();
					return;
				}
				if(form.t_pw.value.length >15){
					alert("비밀번호는 15자 이내로 입력해주세요");
					return;
				}
				
				if(form.t_name.value=="") {
					alert("이름을 입력해주세요");
					form.t_name.focus();
					return;
					}
				if(form.t_name.value.length > 20){
					alert("이름은 20자 이내로 입력해주세요");
					return;
				}
				
				if(form.t_phone.value=="") {
					alert("번호를 입력해주세요");
					form.t_phone.focus();
					return;
				}
				if(form.t_phone.value.length > 11){
					alert("연락처는 11자리이내로 입력해주세요");
					return;
				}
				
				
			if(form.t_email1.value=="") {
				alert("이메일을 입력해주세요");
				form.t_email1.focus();
				return;
				}
			if(form.t_email1.value.length > 15){
				alert("이메일 아이디는 15자 이내로 입력해주세요");
				return;
			}
			
			if(form.t_emailtype.value != ""){
				document.all.t_email2.value = form.t_emailtype.value;
			} else{
				if(form.t_email2.value=="") {
					alert("이메일을 입력해주세요");
					form.t_email2.focus();
					return;
				}
			}
			if(form.t_email2.value.length > 15){
				alert("이메일 은 15자 이내로 입력해주세요");
				return;
			}
			
				if(!(all.yak1.checked)) {
					alert("이용약관 동의를 체크해주세요");
					form.t_yak1.focus();
					return;
				}					
				
				if(!(all.yak2.checked)) {
					alert("개인정보 동의를 체크해주세요");
					form.t_yak2.focus();
					return;
				}					
				
				form.action ="member_proc.jsp";
				form.method ="post";
				form.submit();
			}
		</script>		
			
	
	</body>
</html>









