<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ include file="../include/header.jsp"%>
<div class="container">
       <div class="mycomment-left">
<!--           <h3 class="mb-20">마이페이지</h3> -->
<!--          <div class=""> -->
<!--             <ul class="unordered-list"> -->
<!--                <li class="yeong-myfont">내 정보 조회</li> -->
<!--                <li class="yeong-myfont">예매 내역</li> -->
<!--                <li class="yeong-myfont">내 리뷰</li> -->
<!--                <li class="custom-active yeong-myfont">내 한줄평</li> -->
<!--                <li class="yeong-myfont">내 기프티콘</li> -->
<!--                <li class="yeong-myfont">내 건의사항</li> -->
<!--             </ul> -->
<!--          </div> -->

     <%@ include file="../include/myPageMenu.jsp"%>
      </div>
      <div class="mycomment-left-right">
         <table class="table table-hover">
            <thead>
			<tbody>
			<c:forEach items="${list }" var="rvo">
				<tr class="odd gradeX">
					<td><c:out value="${rvo.movieTitle }"/></td>
					<td><a class="move" href="${rvo.reviewNo}">
                            		${rvo.reviewTitle }</a></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${rvo.reviewDate }"/></td>
				</tr>
				<input type="hidden" value="${rvo.memberId }">
			</c:forEach>
			</tbody>
		</table>
		
					</div>
					</div>
					</div> 
					
<!-- 		페이징 시작하는 부분 -->
	</div>
		 <div class="pagination justify-content-center clear">
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
                <!-- END 페이지 번호 출력 -->
	 <!-- 페이지 번호 클릭 시 페이지 번호와 출력 데이터 갯수를 전달 --
                <form id="actionForm" action="/review/list" method="get">
	           		<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cri.pageNum}">
                	<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                	<!-- 검색 조건과 키워드 파라미터 추가 -->
                	<input type="hidden" name="type" value="${pageMaker.cri.type}">
                	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
    			</form>
					</div>
                <!-- END 페이지 번호 출력 -->
	 <!-- 페이지 번호 클릭 시 페이지 번호와 출력 데이터 갯수를 전달 -->
                <form id="actionForm" action="/myReview/list" method="get">
	           		<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cri.pageNum}">
                	<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                	<input type="hidden" name="memberId" value='<sec:authentication property="principal.username" />'>
                	<!-- 검색 조건과 키워드 파라미터 추가 -->
    			</form>	
    		
	<!-- End Align Area -->
	  
<%@ include file="../include/footer.jsp"%>
	<script>
	$(function(){
		 //페이지 번호 링트 처리
		   $(".page-item a").on("click", function(e) {
					 e.preventDefault(); //a태그라서 동작안되게 막아줌
					 $('#pageNum').val($(this).attr('href'));	//내가 누른 a태그의 href값을 $('#pageNum')에 넣어줌
					 $('#actionForm').submit();
			  });
		  
		  //게시물 조회 링크처리
		   $(".move").on("click", function(e) {
			 	 e.preventDefault();
			 	 $("#actionForm").append("<input type='hidden' name='reviewNo' value='"+ $(this).attr("href")+"'>");
			 	 $("#actionForm").attr("action", "/review/get");
			 	 $("#actionForm").submit();
		  });
	});

	</script>




