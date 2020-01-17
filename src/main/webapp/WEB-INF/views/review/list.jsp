<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ include file="../include/header.jsp"%>
=======
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <!DOCTYPE html>
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
										<li><a class="active" href="index.html">��ȭ</a></li>
										<li><a href="#">���� <i class="ti-angle-down"></i></a>
											<ul class="submenu">
												<li><a href="#">��ȭ ����</a></li>
												<li><a href="#">�󿵽ð�ǥ</a></li>
											</ul>
										</li>
										<li><a href="#">����</a></li>
										<li><a href="#">����Ƽ��</a></li>
										<li><a href="#">���ǻ���</a></li>
										<li><a href="#">��������</a></li>
										<li><a href="#">���湰</a></li>
									</ul>
								</nav>
							</div>
						</div>

						<!--						<div class="col-xl-4 col-lg-4 d-none d-lg-block">-->
						<div class="col-xl-4 col-lg-4 d-lg-block">
							<div class="custom-margin">
								<button class="btn btn-primary pull-right">ȸ������</button>
							</div>
							<div class="custom-margin">
								<button class="btn btn-primary pull-right">�α���</button>
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
>>>>>>> master
<div class="side_margin">
	<div class="row">
		<div class="review_title">����</div>
		
	</div>
	<div class="title_under"></div>
<<<<<<< HEAD
<!-- 	검색 조건 및 키워드 입력 부분 -->
	
=======
	<!-- �˻� ���� �� Ű���� �Է� �κ� -->
	<div class="row">
		<div class="col-lg-12">
			<!--                 		<form id="searchForm" action="/board/list"> -->
			<select name='type' id="select_box">
				<%--                 				<c:set var="type" value="${pageMaker.cri.type}"/> --%>
				<option value="">����</option>
				<option value="">����</option>
				<option value="">���̵�</option>
<%-- 				<option value="T" <c:out value="${type == 'T'?'selected':''}"/>����</option> --%>
<%-- 				<option value="C" <c:out value="${type == 'C'?'selected':''}"/>����</option> --%>
<%-- 				<option value="W" <c:out value="${type == 'W'?'selected':''}"/>�ۼ���</option> --%>
			</select> 
			<input type="text" name="keyword" id="keyword"
				value="${pageMaker.cri.keyword}">
			 <button id="modalRegisterBtn" class="btn btn-primary">�˻�</button>
		</div>
		       </div>
>>>>>>> master
		       
		       
		<div class="table_position">
		<div class="tab-content text-center" id="nav-tabContent">
		  <table class="table custom-th-size">	   
                    <thead>
                        <tr>
                            <th>��ȭ��<!-- Rendering engine --></th>
                            <th>����<!-- Browser --></th>
                            <th>�ۼ���<!-- Platform(s) --></th>
                            <th>��ȸ��<!-- Engine version --></th>
                            <th>�����<!-- CSS grade --></th>
                        </tr>
                    </thead>
                    <tbody>
<<<<<<< HEAD
						<c:forEach items="${list }" var="rvo">
						<tr class="odd gradeX">
							<td><c:out value="${rvo.movieNo }"/></td>
							<td><a class="move" href='<c:out value="${rvo.reviewNo }"/>'>
							${rvo.reviewTitle }</a></td>
                            <td><c:out value="${rvo.memberId }"/></td>
							<td><c:out value="${rvo.reviewView }"/></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${rvo.reviewDate }"/></td>
						</tr>
					</c:forEach>
=======
                         <tr class="odd gradeX">  <td>��ȭ��</td> <td>��ȭ����</td> <td>ID</td> <td>10</td> <td>2020.1.12</td>  </tr>
                      	 <tr class="odd gradeX">  <td>��ȭ��</td> <td>��ȭ����</td> <td>ID</td> <td>10</td> <td>2020.1.12</td>  </tr>
                      	 <tr class="odd gradeX">  <td>��ȭ��</td> <td>��ȭ����</td> <td>ID</td> <td>10</td> <td>2020.1.12</td>  </tr>
                      	 <tr class="odd gradeX">  <td>��ȭ��</td> <td>��ȭ����</td> <td>ID</td> <td>10</td> <td>2020.1.12</td>  </tr>
                      	 <tr class="odd gradeX">  <td>��ȭ��</td> <td>��ȭ����</td> <td>ID</td> <td>10</td> <td>2020.1.12</td>  </tr>
                      	 <tr class="odd gradeX">  <td>��ȭ��</td> <td>��ȭ����</td> <td>ID</td> <td>10</td> <td>2020.1.12</td>  </tr>
                      	 <tr class="odd gradeX">  <td>��ȭ��</td> <td>��ȭ����</td> <td>ID</td> <td>10</td> <td>2020.1.12</td>  </tr>
                      	 <tr class="odd gradeX">  <td>��ȭ��</td> <td>��ȭ����</td> <td>ID</td> <td>10</td> <td>2020.1.12</td>  </tr>
                      	 <tr class="odd gradeX">  <td>��ȭ��</td> <td>��ȭ����</td> <td>ID</td> <td>10</td> <td>2020.1.12</td>  </tr>
                      	 <tr class="odd gradeX">  <td>��ȭ��</td> <td>��ȭ����</td> <td>ID</td> <td>10</td> <td>2020.1.12</td>  </tr>
>>>>>>> master
                    </tbody>
                </table><!-- END �Խù� ��� ���̺� -->
          </div>
          </div>
<!--           table_position -->
<<<<<<< HEAD
 <!-- 페이지 번호 출력 -->
                <div class="pull-right">
	              <ul class="pagination">
	                 <c:if test="${pageMaker.prev }">
	                    <li class="paginate_button previous">
	                       <a class="page-link" href="${pageMaker.startPage -1 }">Previous</a></li>
	                 </c:if>
	                 <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
	                    <li class='paginate_button ${pageMaker.cri.pageNum == num ? "active":"" }'>
	                       <a class="page-link" href="${num}">${num }</a></li>
	                 </c:forEach>
	                 <c:if test="${pageMaker.next }">
	                    <li class="paginate_button next">
	                       <a class="page-link" href="${pageMaker.endPage + 1 }">Next</a></li>
	                 </c:if>
	              </ul>
	           </div>
                <!-- END 페이지 번호 출력 -->
	 <!-- 페이지 번호 클릭 시 페이지 번호와 출력 데이터 갯수를 전달 -->
                <form id="actionForm" action="/review/list" method="get">
	           		<input type="hidden" id="pageNum" name="pageNum" value="${pageMaker.cri.pageNum }">
	           		<input type="hidden" id="amount" name="amount" value="${pageMaker.cri.amount }">
    			</form>
    </div>
		<!-- 전체마진 END -->
<%@ include file="../include/footer.jsp"%>
<script>
=======
<!-- ����¡ �κ� -->
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
	<!-- ����¡ end -->
    </div>
		<!-- ��ü���� END -->
>>>>>>> master

//페이지 번호 링크 처리
$(function(){
	 //페이지 번호 링트 처리
	  $(".paginate_button a").on("click", function(e) {
			 e.preventDefault(); //a태그라서 동작안되게 막아줌
			 $('#pageNum').val($(this).attr('href'));	//내가 누른 a태그의 href값을 $('#pageNum')에 넣어줌
			 $('#actionForm').submit();
	  });
	  
	  //게시물 조회 링크처리
	  $(".move").on("click", function(e) {
		 	 e.preventDefault();
		 	 $("#actionForm").append("<input type='hidden' name='reviewNo' value='"+ $(this).attr("href")+"'>");
		 	 $("#actionForm").attr("action","/review/get");
		 	 $("#actionForm").submit();
	  });
	  
});

</script>