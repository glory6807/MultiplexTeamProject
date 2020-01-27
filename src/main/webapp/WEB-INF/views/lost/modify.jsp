<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ include file="../include/header.jsp"%>
<div class="side_margin">
	<div class="row">
		<div class="review_title">습득물 수정화면</div>
	</div>
	<div class="title_under"></div>
<!-- 	계시판명 END -->
	<form action="/lost/modify" method="post" id="formModify">
	<input type="hidden" name="lostNo" value="${lvo.lostNo }">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
	<input type="text" id="lost_register" value="${lvo.lostTitle }" 제목" name="lostTitle"><br>
	
	<input type="text" id="content_register" name="lostContent" value="${lvo.lostContent }">
	
	<!-- 	페이지 번호를 위한 hidden 태그 -->
	<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
	<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>'>
<!-- 	페이지 번호를 위한 hidden 태그  END-->
	</form>
	<div class="title_under2"></div>
<!-- 	버튼위치 style -->
	<div class="buttln_style">
	 <button id="reviewList" class="btn btn-primary">수정</button>
	 <button id="censle" class="btn btn-primary">취소</button>
	 </div>
<!-- 	END 버튼위치 style -->

<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@전체 모달창@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<div class="modal" id="modifyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        	수정하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="okBtn">확인</button> 
        <button type="button" id="noBtn" class="btn btn-secondary">취소</button>
	 </div>
    </div>
  </div>
</div>

<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@END전체 모달창@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->


</div>
<!-- 전체마진 END -->
<%@ include file="../include/footer.jsp"%>
<script>
$(function(){
	var modifyModal = $("#modifyModal");
	$("#reviewList").on("click",function(e){
		e.preventDefault();
		modifyModal.modal('show');
	});
	$("#okBtn").on("click",function(e){
		$("#formModify").submit();
	});
	$("#noBtn").on("click",function(e){
		modifyModal.modal('hide');
	});
})
</script>