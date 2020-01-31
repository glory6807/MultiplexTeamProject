<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../include/header.jsp"%>
<div class="container">
    	<div class="mycomment-left">
		    <h3 class="mb-20">관리자 페이지</h3>
			<div class="">
				<ul class="unordered-list">
					<li><a href="/member/client">회원 관리</a></li>
					<li><a href="/report/review/list">리뷰 신고 관리</a>
						<ul>
							<li><a href="/report/review/list">리뷰 신고 관리</a></li>
							<li><a href="/report/reply/list" class="custom-active">리뷰 댓글 신고 관리</a></li>
							<li><a href="/report/comment/list">한줄평 신고 관리</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	<div class="table_position1">
		<span class="button_position">
			<button id="reportRemove" class="btn btn-danger">삭제</button>
		</span>
		<table class="table table-striped table-bordered table-hover_aa">
			<thead>
				<tr>
					<th class="memberId_size" style="width: 150px;">신고자ID<!-- Rendering engine --></th>
					<th class="content_style">신고내용<!-- Browser --></th>
					<th class="content_style">댓글내용 <!-- Platform(s) --></th>
					<th class="	content_style" style="width: 90px;">삭제<!-- CSS grade --></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="rpvo">
					<tr class="odd gradeXF">
						<td class="td_center"><c:out value="${rpvo.memberId }" /></td>
						<td class="td_center"><a class="getGo" href="${rpvo.replyReportNo}">
                            		${rpvo.replyReportContent }</a></td>
						<td class="td_center"><c:out value="${rpvo.replyContent }" /></td>
						<td class="td_center">
						<form action="/report/reply/remove" method="post" id="removeForm">
							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
							<input type="checkbox" name="replyNoChk" value="${rpvo.replyNo }"> <!-- value="${rrvo.reviewNo }" -->
								<input type="hidden" name="replyNo" value="">
						</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- END 게시물 출력 테이블 -->
	</div>
	<form method="get" id="getReview"></form>
	<!--           table_position -->

	<!-- 페이지 번호 클릭 시 페이지 번호와 출력 데이터 갯수를 전달 -->
	<form id="actionForm" action="/report/reply/list" method="get">
		<input type="hidden" name="pageNum" id="pageNum"
			value="${pageMaker.cri.pageNum}"> <input type="hidden"
			name="amount" value="${pageMaker.cri.amount}">
		<!-- 검색 조건과 키워드 파라미터 추가 -->
	</form>
<div class="modal fade" id="reportModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        	삭제 하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary" id="okBtn">확인</button> 
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	 </div>
    </div>
  </div>
</div>
<!-- END modal -->
	
</div>
<!-- 		페이징 시작하는 부분 -->
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
<!-- 전체마진 END -->
<%@ include file="../../include/footer.jsp"%>
<script>
//페이지 번호 링트 처리
$(function(){
	var reportModal1 = $("#reportModal1");
$(".page-item a").on("click", function(e) {
			 e.preventDefault(); //a태그라서 동작안되게 막아줌
			 $('#pageNum').val($(this).attr('href'));	//내가 누른 a태그의 href값을 $('#pageNum')에 넣어줌
			 $('#actionForm').submit();
	  });
$(".getGo").on("click", function(e) {
	 e.preventDefault();
	 $("#getReview").append("<input type='hidden' name='replyReportNo' value='"+ $(this).attr("href")+"'>");
	 $("#getReview").attr("action", "/report/reply/get");
	 $("#getReview").submit();
	 
	});	  
$("#reportRemove").on("click", function (e){
// 	$("#removeForm").submit();
	checkbox_for();
	reportModal1.modal('show');
	
});
$("#okBtn").on("click", function (e){
	$("#removeForm").submit();
});	  
});
function checkbox_for()
{
	var chkbox = $("input[name=replyNoChk]");
	var send_array = Array();
	var send_cnt = 0;
	var replyNo_val;
	
	for(i=0;i<chkbox.length;i++) 
	{
	    if (chkbox[i].checked == true){
	        send_array[send_cnt] = chkbox[i].value;
	        send_cnt++;
	    }
	    replyNo_val = send_array + ",";
	}
	

	
	$('input[name=replyNo]').val(replyNo_val);
	
}
</script>