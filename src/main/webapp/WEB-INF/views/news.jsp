<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<title>금융 뉴스</title>
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
					<form class="navbar-form navbar-right" style="height:30px;" action="/logout">
						<span class="navbar-brand" style="padding-top:7px;">${sessionScope.name }님 환영합니다.</span>
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
				<b>금융 뉴스</b>
			</h1>
			<br /> <br />
			<!--<p><a class="btn btn-primary btn-lg" href="#" role="button">자세히 보기 &raquo;</a></p>-->
		</div>
	</div>
	<div class="container">
		<!-- Example row of columns -->
		<div class="row">
			<div class="col-md-4">
				<h2>사상 최고치 경신한 코스피…어디까지 갈까</h2>
				<p>28일 한국거래소에 따르면 외국인은 올해 들어 26일 기준 2조4200억원의 순매수(누적)를 기록했다. 최근
					정부가 외국인 대주주의 양도소득세 정책을 강화하기로 하면서 외국인 자금이 이탈할 것이란 우려가 나왔지만 최근의 매수세는
					이 같은 우려를 불식시키고 있다.</p>
				<img
					src="resources/images/kospi.jpg"
					style="width: 360px; height: 180px;"> <br />
				<p>
					<a class="btn btn-default" href="http://v.media.daum.net/v/20180128081839148" role="button">자세히 보기
						&raquo;</a>
				</p>
			</div>
			<div class="col-md-4">
				<h2>달러, 트럼프 발언에 상승</h2>
				<p>1월 13일 달러/원 환율은 11.6원 하락한 1,058.6원 마감. 달러/원 환율은 전일 미국 재무장관의
					달러 약세 선호 발언에 따라 하락 마감. 달러지수가 90을 하회하면서 약세폭을 확대하자 달러/원 환율도 1,060원을
					하회. 1,050원 선에서 외환당국의 속도조절 추정 매물로 하락이 제한되기도 했지만, 외국인의 주식 순매수와 함께 결국
					연중 최저 수준으로 마감.</p>
				<img
					src="resources/images/trump.jpg"
					style="width: 360px; height: 180px;"> <br />
				<p>
					<a class="btn btn-default" href="http://news.mt.co.kr/mtview.php?no=2018012606103440768" role="button">자세히 보기
						&raquo;</a>
				</p>
			</div>
			<div class="col-md-4">
				<h2>금감원, 지난해 재무상담 1만5975건…빚 상담이 절반</h2>
				<p>금융감독원은 지난해 금융 소비자를 대상으로 한 무료 재무상담인 '금융자문서비스'를 총 1만5975건, 일 평균
					54건꼴로 실시했다고 28일 밝혔다.</p>
				<br /> <img
					src="resources/images/dept.jpg"
					style="width: 360px; height: 180px;">

				<p>
					<a class="btn btn-default" href="http://www.asiae.co.kr/news/view.htm?idxno=2018012821332124815" role="button">자세히 보기
						&raquo;</a>
				</p>
			</div>
		</div>
	</div>
	
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>