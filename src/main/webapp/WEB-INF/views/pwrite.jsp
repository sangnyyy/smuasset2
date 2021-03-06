<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<link rel="icon" href="resources/logo.ico">

<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<style>
.header-signup {
	background-color: #32BEBE;
	height: 150px;
	margin-top: 50px;
}

<!--
상단 영역 -->.navbar-collapse.collapse {
	width: 1200px;
}

.navbar-brand {
	font-size: 25px;
	color: blue;
}

.form-group {
	font-size: 20px;
	font-weight: normal;
}
</style>

<title>글쓰기</title>
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
					<form class="navbar-form navbar-right" style="height: 30px;"
						action="/logout">
						<span class="navbar-brand" style="padding-top: 7px;">${sessionScope.nickname }님
							환영합니다.</span>
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
								name="email">
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
	<div id="navbar" class="navbar-collapse collapse">
		<form class="navbar-form navbar-right">
			<div class="form-group">
				<input type="text" placeholder="Email" class="form-control">
			</div>
			<div class="form-group">
				<input type="password" placeholder="Password" class="form-control">
			</div>
			<button type="submit" class="btn btn-success">로그인</button>
			<input type="button" value="회원가입" class="btn btn-success"
				onclick="location.href='/signup' ">
			</button>
		</form>
	</div>
	<!--/.navbar-collapse -->
	</div>
	</nav>
	<div class="jumbotron">
		<div class="container" id="upperContainer"
			style="text-align: center; padding-top: 5px;">
			<br /> <br />
			<h1>
				<b>글쓰기</b>
			</h1>
			<br /> <br />
			<!--<p><a class="btn btn-primary btn-lg" href="#" role="button">자세히 보기 &raquo;</a></p>-->
		</div>
	</div>
	<div class="container">
		<form method=POST>
			<div class="form-group">
				<label for="subject">제목</label> <input type="text"
					class="form-control" name="subject" id="subject"
					placeholder="제목 입력">
			</div>
		
			<div class="form-group">
				<label for="content">내용</label>
				<textarea class="form-control" rows="10" name="content" id="content" placeholder="내용 입력"></textarea>

			</div>
			<button type="submit" class="btn btn-default">등록하기</button>
		</form>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>