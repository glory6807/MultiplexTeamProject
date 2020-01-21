<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<div class="side_margin">
	<div class="row">
		<div class="review_title">리뷰 작성 화면</div>
	</div>
	<div class="title_under"></div>
<!-- 	계시판명 END -->
	<form action="/review/register" method="post">
	<input type="text" id="title_register" value="영화명 : ${movieTitle }" readOnly="readOnly" style="cursor : Default;"><br>
   <input type="hidden" value="${movieNo }" name="movieNo">
	
	<input type="text" id="movie_register" value="리뷰제목"  name="reviewTitle"><br>
	
	<input type="text" id="content_register" name="reviewContent">
	<div class="form-group">
	<input type="hidden" value="로옹로옹" name="memberId">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
	</div>
	<div class="title_under2"></div>
<!-- 	버튼위치 style -->
	<div class="buttln_style">
	 <button id="reviewList" class="btn btn-primary" type="submit">작성완료</button>
	 <button id="censle" class="btn btn-primary">취소</button>
	 </div>
<!-- 	END 버튼위치 style -->
</form>



</div>
<!-- 전체마진 END -->
<%@ include file="../include/footer.jsp"%>