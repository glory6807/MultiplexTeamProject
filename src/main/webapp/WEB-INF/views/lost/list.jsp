<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ include file="../include/header.jsp"%>
<div class="container">
			<!--<div class="row">-->
			<div class="row no-mean">
				<div class="col-md-12">
					<div class="custom-board-title">
						<h3 class="custom-font-bold">습득물</h3>
					</div>
					 <form id="searchForm" action="/lost	/list" method="get">
                         <select name='type' id="select_box">
                               <option value="" <c:out value="${pageMaker.cri.type ==null?'selected':'' }"/>> 검색 조건 </option>
                               <option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
                               <option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
                    
                         </select>
                         <input type='text' name='keyword' id="keyword" value='<c:out value="${pageMaker.cri.keyword }"/>'>
                         <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'>
                         <input type='hidden' name='amount' value='${pageMaker.cri.amount }'>
                         <button class="btn btn-primary">검색</button>
                      </form>
                <!-- END 검색 조건 및 키워드 입력부분 -->
	<form action="/lost/register" method="get" class="formRegister"></form>
	<div class="buttln_style">
	 <span class="button_position">
	 <sec:authentication property="principal" var="pinfo" />
			<sec:authorize access="hasRole('ROLE_ADMIN')">		
				<!-- 로그인을 한건가 -->
					<!-- 내가 작성한건가 -->
				 <button id="reviewModify" class="btn btn-primary">등록</button>
			</sec:authorize>
	</span>
	 </div>
<!-- 	END 버튼위치 style -->
		<div class="tab-content text-center" id="nav-tabContent">
		  <table class="table custom-th-size">	   	   
                    <thead>
                        <tr>
                            <th>제목<!-- Rendering engine --></th>
                            <th style="width: 90px;">조회수<!-- Platform(s) --></th>
                            <th style="width: 150px;">작성일<!-- Platform(s) --></th>
                        </tr>
                    </thead>
                    <tbody>
                       <c:forEach items="${list }" var="lvo">
						<tr class="odd gradeX">

							<td class="tdLost_lostTitle"><a class="move" href="${lvo.lostNo}">
                            		${lvo.lostTitle }</a></td>
							<td><c:out value="${lvo.lostView }"/></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${lvo.lostDate }"/></td>
						</tr>
					</c:forEach>
                      	
                    </tbody>
                </table><!-- END 게시물 출력 테이블 -->
          </div>
<!--           table_position -->
<!-- 페이지 번호 출력 -->
	 	<div class="pagination justify-content-center">
						<ul class="pagination">
								<c:if test="${pageMaker.prev}">
									<li class="page-item previous">
										<a class="page-link"href="${pageMaker.startPage-1}" aria-label="Previous"> 
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
								</c:if>										
								<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
									<li class="page-item + ${pageMaker.cri.pageNum == num ? 'active' : ''}">
										<a class="page-link" href="${num}">${num}</a>
									</li>
								</c:forEach>
								<c:if test="${pageMaker.next}">
									<li class="page-item next">
										<a class="page-link"href="${pageMaker.endPage+1}" aria-label="Next"> 
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
								</c:if>
							</ul>
						</div>
	 <!-- 페이지 번호 클릭 시 페이지 번호와 출력 데이터 갯수를 전달 -->
                <form id="actionForm" action="/lost/list" method="get">
	           		<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cri.pageNum}">
                	<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                	<!-- 검색 조건과 키워드 파라미터 추가 -->
                	<input type="hidden" name="type" value="${pageMaker.cri.type}">
                	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
    			</form>
    			</div>
    			</div>
    			</div>
		<!-- 전체마진 END -->
<%@ include file="../include/footer.jsp"%>
<script>
//페이지 번호 링트 처리
$(function(){ 
	  //검색 버튼 이벤트 처리
  	//검색 조건을 지정하지 않은경우
  		//'검색 종류를 선택하세요' 메시지 출력
  	//검색어를 입력하지 않은경우
  		//'키워드를 입력하세요' 출력
  var searchForm = $("#searchForm");
  
  $("#searchForm button").on("click", function(e) {
	 if(!searchForm.find("option:selected").val()){	//검색 조건을 지정안했을때
		 alert('검색종류를 선택하세요');
		 return false;
	 }else if(!($("#keyword").val())){
			alert('내용을 입력해주세요.'); 
			 return false;
	 }
	 //검색 결과 페이지 번호가 1이 되도록 처리
	 searchForm.find("input[name='pageNum']").val("1");
	 e.preventDefault();
	 
	 searchForm.submit();
  });//END 컴색처리
  
$(".page-item a").on("click", function(e) {
			 e.preventDefault(); //a태그라서 동작안되게 막아줌
			 $('#pageNum').val($(this).attr('href'));	//내가 누른 a태그의 href값을 $('#pageNum')에 넣어줌
			 $('#actionForm').submit();
	  });

//게시물 조회 링크처리
$(".move").on("click", function(e) {
	 	 e.preventDefault();
	 	 $("#actionForm").append("<input type='hidden' name='lostNo' value='"+ $(this).attr("href")+"'>");
	 	 $("#actionForm").attr("action", "/lost/get");
	 	 $("#actionForm").submit();
	 	 

});
$("#reviewModify").on("click", function(e) {
	 e.preventDefault();
	$(".formRegister").submit();
});
});
</script>