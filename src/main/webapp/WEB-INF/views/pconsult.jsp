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

<title>개인 컨설팅</title>
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
			<c:when test="${sessionScope.name ne null }">
				<div id="navbar" class="navbar-collapse collapse">
					<form class="navbar-form navbar-right" style="height: 30px;"
						action="/logout">
						<span class="navbar-brand" style="padding-top: 7px;">${sessionScope.name }님
							환영합니다.</span>
						<button type="submit" class="btn btn-success">로그아웃</button>
					</form>
				</div>
			</c:when>
			<c:otherwise>
				<div id="navbar" class="navbar-collapse collapse">
					<form class="navbar-form navbar-right" action="/smu/login"
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
				<b>개인 컨설팅</b>
			</h1>
			<br /> <br />
			<!--<p><a class="btn btn-primary btn-lg" href="#" role="button">자세히 보기 &raquo;</a></p>-->
		</div>
	</div>
	<c:choose>
		<c:when test="${sessionScope.name ne null }">
		<div class="container">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>안녕</td>
					<td>sml</td>
					<td>18.02.01</td>
					<td>1</td>
				</tr>
				<tr>
					<td>2</td>
					<td>반갑습니다!</td>
					<td>sdh2012</td>
					<td>18.02.02</td>
					<td>5</td>
				</tr>
				<tr>
					<td>3</td>
					<td>가입 인사 드려욥!</td>
					<td>ljh_RockandRoll</td>
					<td>18.02.02</td>
					<td>3</td>
				</tr>
				<tr>
					<td>4</td>
					<td>이 사이트 너무 조은듯 ㅎㅎㅎ</td>
					<td>kimkim2012</td>
					<td>18.02.02</td>
					<td>46</td>
				</tr>
				<tr>
					<td>5</td>
					<td>투자 관련 질문드립니다. 고수님들!</td>
					<td>sml</td>
					<td>18.02.03</td>
					<td>39</td>
				</tr>
				<tr>
					<td>6</td>
					<td>지금 투자를 하고 싶은데 ..</td>
					<td>kingkendrick</td>
					<td>18.02.03</td>
					<td>67</td>
				</tr>
				<tr>
					<td>7</td>
					<td>가입 인사 드려요!</td>
					<td>cr7</td>
					<td>18.02.03</td>
					<td>80</td>
				</tr>

			</tbody>
		</table>
		<hr />
		<a class="btn btn-default" href="#">글쓰기</a>
		<div class="text-center">
			<ul class="pagination">
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>

			</ul>
		</div>
	</div>
		</c:when>
		<c:otherwise>
			<div class="container below_jumbo">
				<h2 style="font-size: 50px">
					<br> <br>죄송합니다. 고객님!<br />개인 컨설팅을 이용하시려면 로그인을 하셔야 합니다.<br />
				</h2>
			</div>
		</c:otherwise>
	</c:choose>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>