<!doctype html>
<html class="no-js" lang="zxx">

<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>S_CINEMA</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- <link rel="manifest" href="site.webmanifest"> -->
	<link rel="shortcut icon" type="image/x-icon" href="img/favicon2.png">
	<!-- Place favicon.ico in the root directory -->

	<!-- CSS here -->
	<link rel="stylesheet" href="../css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/owl.carousel.min.css">
	<link rel="stylesheet" href="../css/magnific-popup.css">
	<link rel="stylesheet" href="../css/font-awesome.min.css">
	<link rel="stylesheet" href="../css/themify-icons.css">
	<link rel="stylesheet" href="../css/nice-select.css">
	<link rel="stylesheet" href="../css/flaticon.css">
	<link rel="stylesheet" href="../css/gijgo.css">
	<link rel="stylesheet" href="../css/animate.css">
	<link rel="stylesheet" href="../css/slicknav.css">
	<link rel="stylesheet" href="../css/style.css">
	<link rel="stylesheet" href="../css/custom-choi.css">
	<link rel="stylesheet" href="../css/custom-hong.css">
	<!-- <link rel="stylesheet" href="../css/responsive.css"> -->
</head>

<body>
	<!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

	<!-- header-start -->
	<header>
		<div class="header-area">
			<div id="sticky-header" class="main-header-area">
				<div class="container-fluid p-0">
					<div class="row align-items-center no-gutters">
						<div class="col-xl-2 col-lg-2">
							<div class="logo-img">
								<a href="index.html">
									<img src="../img/sCineLogo3.png" alt="">
								</a>
							</div>
						</div>
						<div class="col-xl-6 col-lg-6">
							<div class="main-menu d-none d-lg-block">
								<nav>
									<ul id="navigation">
										<li><a class="active" href="index.html">영화</a></li>
										<li><a href="#">예매 <i class="ti-angle-down"></i></a>
											<ul class="submenu">
												<li><a href="#">영화 예매</a></li>
												<li><a href="#">상영시간표</a></li>
											</ul>
										</li>
										<li><a href="#">리뷰</a></li>
										<li><a href="#">기프티콘</a></li>
										<li><a href="#">건의사항</a></li>
										<li><a href="#">공지사항</a></li>
										<li><a href="#">습득물</a></li>
									</ul>
								</nav>
							</div>
						</div>

						<!--						<div class="col-xl-4 col-lg-4 d-none d-lg-block">-->
						<div class="col-xl-4 col-lg-4 d-lg-block">
							<div class="custom-margin">
								<button class="btn btn-primary pull-right">회원가입</button>
							</div>
							<div class="custom-margin">
								<button class="btn btn-primary pull-right">로그인</button>
							</div>
						</div>
						<div class="col-12">
							<div class="mobile_menu d-block d-lg-none">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- header-end -->



<div class="side_margin">
	<div class="row">
		<div class="review_title">습득물</div>
		
	</div>
	<div class="title_under"></div>
	<!-- 검색 조건 및 키워드 입력 부분 -->
	<div class="row">
		<div class="col-lg-12">
			<!--                 		<form id="searchForm" action="/board/list"> -->
			<select name='type' id="select_box">
				<%--                 				<c:set var="type" value="${pageMaker.cri.type}"/> --%>
				<option value="">제목</option>
				<option value="">내용</option>
				<option value="">아이디</option>
<%-- 				<option value="T" <c:out value="${type == 'T'?'selected':''}"/>제목</option> --%>
<%-- 				<option value="C" <c:out value="${type == 'C'?'selected':''}"/>내용</option> --%>
<%-- 				<option value="W" <c:out value="${type == 'W'?'selected':''}"/>작성자</option> --%>
			</select> 
			<input type="text" name="keyword" id="keyword"
				value="${pageMaker.cri.keyword}">
			 <button id="modalRegisterBtn" class="btn btn-primary">검색</button>
		</div>
		       </div>
		       
		       <!-- 	버튼위치 style -->
	<div class="buttln_style">
	 <span class="button_position">
	 <button id="reviewModify" class="btn btn-primary">등록</button>
	</span>
	 </div>
<!-- 	END 버튼위치 style -->
		<div class="table_position">
		  <table class="table table-striped table-bordered table-hover">	   
                    <thead>
                        <tr>
                            <th>글번호<!-- Rendering engine --></th>
                            <th>제목<!-- Browser --></th>
                            <th>등록일<!-- Platform(s) --></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="odd gradeX">  <td>1</td> <td>분실물을 찾아가세요</td> <td>2020.1.12</td>  </tr>
                      	<tr class="odd gradeX">  <td>1</td> <td>분실물을 찾아가세요</td> <td>2020.1.12</td>  </tr>
                      	<tr class="odd gradeX">  <td>1</td> <td>분실물을 찾아가세요</td> <td>2020.1.12</td>  </tr>
                      	<tr class="odd gradeX">  <td>1</td> <td>분실물을 찾아가세요</td> <td>2020.1.12</td>  </tr>
                      	<tr class="odd gradeX">  <td>1</td> <td>분실물을 찾아가세요</td> <td>2020.1.12</td>  </tr>
                        <tr class="odd gradeX">  <td>1</td> <td>분실물을 찾아가세요</td> <td>2020.1.12</td>  </tr>
                        <tr class="odd gradeX">  <td>1</td> <td>분실물을 찾아가세요</td> <td>2020.1.12</td>  </tr>
                        <tr class="odd gradeX">  <td>1</td> <td>분실물을 찾아가세요</td> <td>2020.1.12</td>  </tr>
                        <tr class="odd gradeX">  <td>1</td> <td>분실물을 찾아가세요</td> <td>2020.1.12</td>  </tr>
                        <tr class="odd gradeX">  <td>1</td> <td>분실물을 찾아가세요</td> <td>2020.1.12</td>  </tr>
                    </tbody>
                </table><!-- END 게시물 출력 테이블 -->
          </div>
<!--           table_position -->
<!-- 페이징 부분 -->
	<ul class="pagination">
		<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
		<li class="page-item"><a class="page-link" href="#">1</a></li>
		<li class="page-item"><a class="page-link" href="#">2</a></li>
		<li class="page-item active"><a class="page-link" href="#">3</a></li>
		<li class="page-item"><a class="page-link" href="#">4</a></li>
		<li class="page-item"><a class="page-link" href="#">5</a></li>
		<li class="page-item"><a class="page-link" href="#">6</a></li>
		<li class="page-item"><a class="page-link" href="#">7</a></li>
		<li class="page-item"><a class="page-link" href="#">8</a></li>
		<li class="page-item"><a class="page-link" href="#">9</a></li>
		<li class="page-item"><a class="page-link" href="#">10</a></li>
		<li class="page-item"><a class="page-link" href="#">Next</a></li>
	</ul>
	<!-- 페이징 end -->
    </div>
		<!-- 전체마진 END -->

		
	<!-- footer -->
	<footer class="footer">
		<div class="footer_top">
			<div class="container">
			
			</div>
		</div>
		<div class="copy-right_text">
			<div class="container">
				<div class="footer_border"></div>
				<div class="row">
					<div class="col-xl-8 col-md-7 col-lg-9">
						<p class="copy_right">
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;<script>
								document.write(new Date().getFullYear());

							</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</div>
					<div class="col-xl-4 col-md-5 col-lg-3">
						<div class="socail_links">
							<ul>
								<li>
									<a href="#">
										<i class="fa fa-facebook-square"></i>
									</a>
								</li>
								<li>
									<a href="#">
										<i class="fa fa-twitter"></i>
									</a>
								</li>
								<li>
									<a href="#">
										<i class="fa fa-instagram"></i>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
<body>

</body>		