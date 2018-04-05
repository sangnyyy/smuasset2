<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<link rel="icon" href="resources/logo.ico">

<title>SMU ASSET</title>

<!-- 부트스트랩 -->
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<style>
.navbar-brand {
	font-size: 25px;
	color: blue;
}

.btn.btn-primary.btn-lg {
	background-color: black;
	border-color: black;
}

#upperContainer {
	height: 300px;
}

#upperContainer>h1, #upperContainer>p {
	text-align: center;
}

.navbar-collapse.collapse {
	width: 1200px;
}
</style>
</head>
<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/">SMU ASSET</a>
			</div>

			<c:choose>
				<c:when test="${sessionScope.nickname ne null }">
				<div id="navbar" class="navbar-collapse collapse">
					<form class="navbar-form navbar-right" style="height:30px;" action="/logout">
						<span class="navbar-brand" style="padding-top:7px;">${sessionScope.nickname }님 환영합니다.</span>
							<button type="submit" class="btn btn-success">로그아웃</button>
					</form>					
				</div>
				</c:when>
				<c:otherwise>
					<div id="navbar" class="navbar-collapse collapse">
						<form class="navbar-form navbar-right" action="/login"
							method="POST">
							<div class="form-group">
								<input type="text" placeholder="Email" class="form-control"
									name="email" autocomplete="off">
							</div>
							<div class="form-group">
								<input type="password" placeholder="Password"
									class="form-control" name="password">
							</div>
							<button type="submit" class="btn btn-success">로그인</button>
							<input type="button" value="회원가입" class="btn btn-success"
								onclick="location.href='/signup' ">
							</button>
						</form>
					</div>
				</c:otherwise>
			</c:choose>
			<!--/.navbar-collapse -->
		</div>

	</nav>
	<!--#32BEBE-->
	<!-- Main jumbotron for a primary marketing message or call to action -->
	<div class="jumbotron">
		<div class="container" id="upperContainer">
			<br /> <br />
			<h1>
				<b>Welcome!</b>
			</h1>
			<br />
			<p>
				저희 <b>SMU ASSET</b>은 소규모 자본을 모아 대규모 자본을 만들어 투자영역에 대한 확장성을 제공합니다.<br />
				또한 여러분의 투자성향을 파악하여 자본투자에 대한 성공적인 방향성 제시를 해주는 플랫폼입니다.
			</p>
			<br />
			<!--<p><a class="btn btn-primary btn-lg" href="#" role="button">자세히 보기 &raquo;</a></p>-->
		</div>
	</div>

	<div class="container">
		<!-- Example row of columns -->
		<div class="row">
			<div class="col-md-4">
				<h2>그룹 컨설팅</h2>
				<p>빅데이터 분석을 이용하여 고객님의 투자 성향을 파악하여 그에 맞게 세그먼트화 되어진 그룹을 배정하고 그룹에
					맞는 최고수준의 투자자를 배치하여 투자대비 최적의 실적을 낼 수 있도록 컨설팅을 진행합니다.</p>
				<p>
					<a class="btn btn-default" href="/gconsult" role="button">자세히
						보기 &raquo;</a>
				</p>
			</div>
			<div class="col-md-4">
				<h2>개인 컨설팅</h2>
				<p>빅데이터 분석을 이용하여 고객님의 투자 성향을 파악하여 개인적으로 컨설팅을 제공 받을 수 있도록 최고수준의
					투자자를 매칭 시킵니다.</p>
				<p>
					<a class="btn btn-default" href="/pconsult" role="button">자세히
						보기 &raquo;</a>
				</p>
			</div>
			<div class="col-md-4">
				<h2>금융뉴스</h2>
				<p>최신 금융뉴스를 제공하고 이에 대한 전문가들의 견해를 제공합니다.</p>
				<p>
					<a class="btn btn-default" href="/news" role="button">자세히
						보기 &raquo;</a>
				</p>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4">
				<h2>정책 모아보기</h2>
				<p>각종 언론사 및 뉴스의 정보에 입각하여 최신 정책과 관심이 뜨거운 이슈에 대하여 제시하고 이에 대한 전문가들의
					견해를 함께 제시합니다.</p>
				<p>
					<a class="btn btn-default" href="/policy" role="button">자세히
						보기 &raquo;</a>
				</p>
			</div>
			<div class="col-md-4">
				<h2>커뮤니티</h2>
				<p>커뮤니티를 제공합니다.</p>
				<p>
					<a class="btn btn-default" href="/community" role="button">자세히
						보기 &raquo;</a>
				</p>
			</div>

		</div>
		<hr>

		<footer>
			<p>&copy; SMU ASSET All Rights Reserved.</p>
		</footer>
	</div>
	<!-- /container -->
	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
