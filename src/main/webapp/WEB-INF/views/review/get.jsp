<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ include file="../include/header.jsp"%>
<script>
$(function(){
	//수정버튼 클릭하였을떄!
    var operForm = $("#operForm");
    
    $("button[data-oper='modify']").on("click", function (e){
    	operForm.attr("action", "/review/modify").submit();
    });
  	 
    $("button[data-oper='list']").on("click", function (e){
    	operForm.find("#reviewNo").remove();
    	operForm.attr("action", "/review/list")
    	operForm.submit();
    });
    
});
//END 전체 function
</script>

<div class="side_margin">
	<div class="row">
		<div class="review_title">리뷰</div>
	</div>
	<div class="title_under"></div>
	<div class="get_title_style">
		<div class="get_title">	<c:out value="${rvo.reviewTitle }"/></div>
	
		<div class = "title_under_div">
			<span class="title_under_ex2">작성일:<fmt:formatDate pattern="yyyy-MM-dd"
							value="${rvo.reviewDate }"/></span> 
			<span class="title_under_ex2">작성자:<c:out value="${rvo.memberId }"/></span> 
			<span class="title_under_ex2">조회수:<c:out value="${rvo.reviewView }"/></span>
		</div>
	</div>
	<div class="movie_title_style">
		<div class="movie_get_title">영화제목</div>
	</div>
	<textarea rows="10" cols="100" class="review_textarea" readonly="readonly">
	<c:out value="${rvo.reviewContent }"/>
	</textarea>
	
	<div class="title_under2"></div>
<!-- 	버튼위치 style -->
	<div class="buttln_style">
	 
	 <button data-oper="list" class="btn btn-info">List</button>
	 <div class="button_position">
	 		<button type="submit" class="btn btn-default" data-oper ="modify">수정</button>
				
				<form method="post" action="/review/remove">
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
				<input type="hidden" name="reviewNo" value='<c:out value="${rvo.reviewNo }"/>'>
				<button id="reviewRemove" class="btn btn-danger" type="submit">
				삭제</button>
				</form>
				<form method="get" action="/report/review/register">
				<input type="hidden" name="reviewNo" value='<c:out value="${rvo.reviewNo }"/>'>
				<input type="hidden" name="reviewTitle" value='<c:out value="${rvo.reviewTitle }"/>'>
				<input type="hidden" name="memberId" value="로옹로옹">
			<button id="reviewReport" class="btn btn-danger" type="submit">신고</button>
			</form>
			
		</div>
		
	 </div>
<!-- 	END 버튼위치 style -->

		<form id='operForm' action="/review/modify" method="get">
					<input type="hidden" id="reviewNo" name="reviewNo" value='<c:out value="${rvo.reviewNo }"/>'>
					<input type="hidden" id="reviewTitle" name="reviewTitle" value='<c:out value="${rvo.reviewTitle }"/>'>
					<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
					<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>'>
		</form>
		
<!-- 	 리뷰댓글란 -->
<!-- 	 <input type="text" name="reply" id="replyInput"> -->
<!-- 	  <button id="reviewReply" class="btn btn-primary">등록</button> -->
	 
<!-- 	 END리뷰댓글란 -->

<!-- 리뷰 댓글 목록 -->
	            <div class='row'>
	             <button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">댓글 등록</button>
	               <div class="col-lg-12">
	                  <!--  /.panel -->
	                  <div class="panel panel-default">
	                     <div class="panel-heading">
	                        <i class="fa fa-comments fa-fw"></i> Reply
	                        <!-- 댓글 달기 버튼 생성 -->
<%-- 	                        <sec:authorize access="isAuthenticated()"> --%>
<!-- 	                        	<button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">new Reply</button> -->
<%-- 	                        </sec:authorize> --%>
	                     </div>
	                     <!-- /.panel-heading -->
	                     <div class="panel-body">
	                        <ul class="chat">
	                           <!-- start reply -->
	                           <li class="left clearfix" data-rno='12'>
	                              <div>
	                                 <div class="header">
	                                    <strong class="primary-font"></strong>
	                                    <small class="pull-right text-muted"></small>
	                                 </div>
	                                 <p></p>
	                              </div>
	                           </li> <!-- END Reply -->
	                        </ul> <!-- ./END ul -->                     
	                     </div> <!-- /.panel .chat-panel -->
	                     <!-- 댓글 목록 페이징 -->
	                     <div class="panel-footer">
	                     </div>
	                     <!-- 댓글 목록 페이징 END -->
	                     
<!-- 리뷰 댓글 목록END -->
<!-- Modal --> 
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				   <div class="modal-dialog">
				      <div class="modal-content">
				         <div class="modal-header">
				            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&tiems;</button>
							  <h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
						</div> <!-- /.modal-header END -->
				         <div class="modal-body">
				            <div class="form-group">
				     		<input type="hidden" name="replyNo">
				               <label>replyContent</label>
				               <input class="form-control" name='replyContent'>
				            </div> <!-- /.form-group END -->
				            <div class="form-group">
				               <label>memberId</label>
				               <input class="form-control" name='memberId'  readonly="readonly">
				               
				            </div> <!-- /.form-group END -->
				            <div class="form-group">
				               <label>Reply Date</label>
				               <input class="form-control" name='replyDate' value='2019'>
				            </div> <!-- /.form-group END -->
				         </div> <!-- /.modal-body END -->
				         <div class="modal-footer">
				         	<form method="get" action="/report/reply/register" id="replyRegForm">
					         	<div id="replyHere">
					         	
					         	</div>
								<input type="hidden" name="replyContent" id="replyContent" value='<c:out value="${revo.replyContent }"/>'>
								<input type="hidden" name="memberId" value="악성댓글">
								<button id="replyReport" class="btn btn-danger" type="submit">댓글신고</button>
							</form>	  
				            <button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
				            <button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
				            <button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
				            <button id='modalCloseBtn' type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				            <!-- data-dismiss="modal" 창닫기 -->
				         </div> <!-- /.modal-footer END -->
				      </div> <!-- /.modal-content END -->
				   </div>   <!-- /.modal-dialog END -->
				</div> <!-- /.modal END -->






</div>
</div>
</div>
</div>
<!-- 전체마진 END -->
<%@ include file="../include/footer.jsp"%>
<script src="/resources/js/reply.js"></script>
<script>

	console.log($('input#replyContent').val());

	$(function(){
		$('#replyReport').on("click", function(e){
			e.preventDefault();
			var replyNo = $(".modal").data("rno");
			$('#replyHere').append("<input type='hidden' name='replyNo' id='replyNo' value='"+ replyNo +"'/>");
			$('#replyRegForm').submit();
		});
	})



$(function(){
console.log(replyService);
var reviewNo = '<c:out value="${rvo.reviewNo}"/>';
console.log('r' + reviewNo);
var replyUL = $(".chat");

//댓글 목록 출력 함수 호출 - page 번호는 1로 지정
showList(1);
//댓글 리스트 보여주기

function showList(page){
	replyService.getList({reviewNo:reviewNo, page:page||1}, //페이지 번호가 없을경우 1로설정

		function(replyCnt, list){
		var str = "";
		
		//page번호가 -1로 전달되면 마지막페이지를 호출하게된다 
		if(page == -1){
			pageNum = Math.ceil(replyCnt/10.0);
			showList(pageNum);
			return;
		}
		
		//댓글목록이 없으면 replyUL의 내용을 비우고 중단
		if(list == null || list.length == 0){
			if(pageNum>1){
				pageNum = pageNum - 1;
				showList(pageNum);
			}
		}
		for(revo of list){
            str+= "<li class='left clearfix' data-rno='"+revo.replyNo+"'>";	
            str+= "  <div><div class='header'><strong class='primary-font'>"+revo.memberId+"</strong>";
            str+= "     <small class='pull-right text-muted'>"+replyService.displayTime(revo.replyDate)+"</small></div>";
            str+= "         <p>"+revo.replyContent+"</p></div></li>";
         }
		replyUL.html(str);
		showReplyPage(replyCnt);
	}); //end function
}//end showList

var pageNum = 1;
var replyPageFooter = $(".panel-footer");

function showReplyPage(replyCnt){	
	var endNum = Math.ceil(pageNum / 10.0) * 10;
	var startNum = endNum - 9;
	var prev = startNum != 1;
	var next = false;
	
	if(endNum * 10 >= replyCnt) {
		endNum = Math.ceil(replyCnt/10.0);
	}
	
	if(endNum * 10 < replyCnt) {
		next = true;
	}
	
	var str = "<ul class='pagination pull-right'>";
	
	if(prev) {
		str += "<li class='page-item'><a class='page-link' href='" + (startNum - 1) + "'>Previous</a></li>";
	}
	
	for(var i = startNum ; i<= endNum; i++) {
		var active = pageNum == i? "active" : "";
		str += "<li class='page-item " + active + " '><a class='page-link' href='" + i + "'>" + i + "</a></li>";
	}
	
	if(next) {
		str += "<li class='page-item'><a class='page-link' href='" + (endNum + 1) + "'>Next</a></li>";
	}
	str += "</ul></div>";
	
	console.log(str);
	replyPageFooter.html(str);
}//End 댓글 목록 페이징

replyPageFooter.on("click", "li a", function(e){
	e.preventDefault();
	console.log("page click");
	
	var targetPageNum = $(this).attr("href");
	console.log("targetPageNum : " + targetPageNum);
	
	pageNum = targetPageNum;
	
	showList(pageNum);
});

//모달창으로 새로운 댓글의 추가버튼
var modal = $(".modal"); //모달창 찾아옴
var modalInputReply = modal.find("input[name='replyContent']");	//모달창 각각의 이름으로 찾아옴
var modalInputReplyer = modal.find("input[name='memberId']");
var modalInputReplyDate = modal.find("input[name='replyDate']");

var modalModBtn = $("#modalModBtn");	//버튼 각각 id로 찾아옴
var modalRemoveBtn = $("#modalRemoveBtn");
var modalRegisterBtn = $("#modalRegisterBtn");
var replyReport = $("#replyReport");
var memberId = 'ghdrm12'; //로그인한 아이디

// <sec:authorize access="isAuthenticated()">
// 	replyer = '<sec:authentication property="principal.username" />';
// </sec:authorize>

var csrfHeaderName = "${_csrf.headerName}";	//CSRF 토큰 관련 변수 추가
var csrfTokenValue = "${_csrf.token}";	//CSRF

//beforeSend 대신 사용
$(document).ajaxSend(function(e, xhr, options){	//전송 전 추가 헤더 설정
	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
});

//새 댓글추가 버튼 누르면 실행
$("#addReplyBtn").on("click", function(e){
	modal.find("input").val("");						//input타입을 찾아서 value값을 공백으로
	//replyer를 폼에 추가
	modal.find("input[name='memberId']").val(memberId);
	modalInputReplyDate.closest("div").hide();			//modalInputReplyDate의 가장 가까운(closest) div를 숨긴다
	
	modal.find("button[id != 'modalCloseBtn']").hide();	//버튼이 modalCloseBtn이 아니면 숨겨라
	modalRegisterBtn.show();							//등록버튼보여지게해라
	
	modal.modal("show");							//모달 바로 실행
});
//모달 등록 버튼 눌렀을경우
modalRegisterBtn.on("click", function(e){

	//제이손 형식으로 reply에 값을 넣어준다
    var reply = {
    		replyContent : modalInputReply.val(),
          memberId : modalInputReplyer.val(),
          reviewNo : reviewNo
    };
	
	
    //reply.js add호출
    replyService.add(reply, function(result){
       alert(result);					//알림창 result에 success
      
       modal.find("input").val("");		//input태그를 찾아서 value값을 공백으로 한다
       modal.modal("hide");				//모달창을 숨긴다
       pageNum = 1;			// 등록할때 페이지번호가 1로 가게할려고
       showList(pageNum);
//        showList(-1);
    });
}); 
//END 댓글 등록 버튼 이벤트 처리


//댓글이 클릭이 되면 조회
	$(".chat").on("click", 'li', function(e){	//UL밑에 li 클릭하면
	alert($(this).data('rno'));			//댓글 클릭시 rno 출력

	console.log("111" +$(this).data("rno"));
	
   	replyService.get($(this).data("rno"), function(data){		//rno값 보낸다
   		console.log(data.replyContent);
   		
   		modalInputReply.val(data.replyContent);			
   		modalInputReplyer.val(data.memberId);
   		modalInputReplyDate.val(replyService.displayTime(data.replyDate)).attr("readonly", "readonly");	
   		
   		modal.data("rno", data.replyNo);
   		
   		modal.find("button[id != 'modalCloseBtn']").hide();	
		modalModBtn.show();	
		modalRemoveBtn.show();
		replyReport.show();
    	modal.modal('show');
   		
	}, function(err){
		console.log(err);
	});
});


//댓글 수정 버튼 이벤트 처리 - 동적이게 처리할필요없음 .on("click"
    modalModBtn.on("click", function(e){
    		
	    	replyService.update({
			replyNo : modal.data('rno'),
			replyContent : modalInputReply.val()
			
		}, function(result){
			alert("수정완료");
			
			modal.modal("hide");				
	        showList(pageNum);
			
		}, function(err){
			console.log(err);
		});
    });
    //END 수정 버튼 이벤트 처리
    
 // 댓글 삭제 버튼 이벤트 처리
    modalRemoveBtn.on("click", function(e){
//        if(!memberId){
//           // 로그인하지 않은 경우
//           alert('로그인 후 삭제가 가능합니다.');
//           modal.modal("hide");
//           return ;
//        }
//        var originalReplyer = modalInputReplyer.val();
//        if(memberId != originalReplyer){
//           // 자신의 댓글이 아닌 경우
//           alert('자신의 댓글만 삭제 가능합니다.');
//           modal.modal("hide");
//           return ;
//        }
       var replyNo = modal.data("rno");
//        replyService.remove(replyNo, originalReplyer, function(result){  나중에 원래 쓸것
    	replyService.remove(replyNo, memberId, function(result){
          alert(result);
          modal.modal("hide");
          showList(pageNum);
       });
    });
  
});
</script>
