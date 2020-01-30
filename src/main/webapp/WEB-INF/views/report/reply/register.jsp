<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ include file="../../include/header.jsp"%>
<section id="tabs" class="project-tab">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="custom-board-title">
                    <h3 class="custom-font-bold">신고 하기</h3>
                </div>           
	<form action="/report/reply/register" method="post" class="reportForm">
		<div class="high_margin"></div>
		<div class="movie_title_style">
			<div class="movie_get_title">${revo.replyContent }</div>
		</div>
		<div class="high_margin"></div>
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		<input type="text" id="content_register" name="replyReportContent">
		<input type="hidden" name="memberId"  value="<sec:authentication property="principal.username" />">
		<input type="hidden" name="replyNo" value="${revo.replyNo }">
		</form>
			<div class="title_under2"></div>
	<!-- 	버튼위치 style -->
	<div class="buttln_style">
		<button id="reviewReport" class="btn btn-danger" type="submit">신고</button>
		<button type="button" id="censle" class="btn btn-primary">취소</button>
	</div>

	<!-- 	END 버튼위치 style -->


<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@전체 모달창@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<div class="modal" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        	신고하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="okBtn">확인</button> 
        <button type="button" id="noBtn" class="btn btn-secondary">취소</button>
	 </div>
    </div>
  </div>
</div>
</div>
<
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@END전체 모달창@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<sec:authorize access="isAuthenticated()">
	<c:set value="<sec:authentication property='principal.username'/>" var="userId"></c:set>
</sec:authorize>
/div>
</div>
</section>
<!-- 전체마진 END -->
<%@ include file="../../include/footer.jsp"%>
<script>
$(function(){
	var reportModal = $("#reportModal");
	var reportForm = $(".reportForm");
	var contentModal = $("#contentModal");
	$("#censle").on("click",function(e){
		location.href="/review/list";
	});
	$("#reviewReport").on("click",function(e){
		e.preventDefault();
		if(!($("#content_register").val())){
			alert('내용을 입력해주세요');
		}else{
			$("#reportModal").modal('show');
		}
	});
	$("#noBtn").on("click",function(e){
		e.preventDefault();
		$("#reportModal").modal('hide');
	})
	$("#okBtn").on("click",function(e){
		e.preventDefault();
		reportForm.submit();
	})
});
</script>