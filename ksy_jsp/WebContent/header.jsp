<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
	<title>project1</title>
		<meta charset="utf-8">
		<link href="/css/common.css" rel="stylesheet">
		<link href="/css/join.css" rel="stylesheet">
		<link href="/css/login.css" rel="stylesheet">
		<link href="/css/notice-cont.css?ver=2" rel="stylesheet">
		<link href="/css/noticewrite.css" rel="stylesheet">
		<link href="/css/sub1.css" rel="stylesheet">
		<link href="/css/sub2.css" rel="stylesheet">
		<link href="/css/sub3.css" rel="stylesheet">
		<link href="/css/sub4.css" rel="stylesheet">
		<link href="/css/sub-artist.css" rel="stylesheet">
		<link href="/css/sub-contact.css" rel="stylesheet">
		<link href="/css/sub-cp.css" rel="stylesheet">
		<link href="/css/sub-faq.css" rel="stylesheet">
		<link href="/css/sub-mpp.css" rel="stylesheet">
		<link href="/css/sub-mtp.css" rel="stylesheet">
		<link href="/css/sub-news.css" rel="stylesheet">
		<link href="/css/sub-news-1.css?ver=3" rel="stylesheet">
		<link href="/css/sub-qna.css" rel="stylesheet">
		<link href="/css/sub-notice.css" rel="stylesheet">
		<link href="/css/el.css" rel="stylesheet">
		<link href="/css/header.css" rel="stylesheet">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">
		<script src="/js/jquery-3.3.1.min.js"></script>
		<script src="/js/common.js"></script>
		
	<body>
		<!-- skip navigation -->
		<dl id="access">
			<dt>바로가기 및 건너띄기 링크</dt>
			<dd><a href="#contents">본문바로가기</a></dd>
			<dd><a href="#navigation">주메뉴 바로가기</a></dd>
		</dl>
		<hr>
		
		<div id="big-box">
			<header>
			<div id="header">
				<div class="nav">
						<ul class="nav-menu">
							<li><a href="sub1.jsp">ABOUT EL WIDE</a></li>
							<li><a href="sub2.jsp">MUSIC</a></li>
							<li><a href="sub3.jsp">MEDIA</a></li>
							<li><a href="sub4.jsp">CULTURE</a></li>
							<li><a href="/noticeListServlet">NOTICE</a></li>
						</ul>
				<div class="logo">
					<h1 class="el-logo"><a href="/index.jsp"><img src="/images/elwide-logo.svg" width="88" height="88"></a></h1>
				</div>
				<div class="side-bar">
					<div class="side-menu">
						<ul>
							<li><a href="http://www.facebook.com/elmusickorea" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
							<li><a href="https://blog.naver.com/elmusicstudio" target="_blank"><i class="fab fa-blogger-b"> </i></a></li>
							<li><a href="https://www.youtube.com/channel/UCkoJ_TsGn-WqDVWEzGnhfcA"target="_blank"
							<li><i class="fab fa-youtube"> </i></a></li>
							
							<c:if test="${session_id != null}">
							<li><a href="/LoginOutForm"><i class="fas fa-sign-out-alt"></i></a></li>
							</c:if>
							<c:if test="${session_id == null}">
							<li><a href="/LoginForm"><i class="fas fa-user"></i></a></li>	
							</c:if>						
					</div>
					<div class="side-text">
						 <ul>
						 	<c:if test="${session_id != null}">
						 	<li>[${session_name}] Out--></li>
							</c:if>
							<c:if test="${session_id == null}">
							<li>Login</li>
							</c:if>
						 </ul>
					</div>
				</div>
				</div>
			</div>
			</header>
		</div>