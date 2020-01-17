<c:if test="${session_level != 'manager' }">
	<script>
		alret("관리자 화면 입니다 관리자 로그인하세요");
		ㅣlocation.href ="/Index";
	</script>
</c:if>