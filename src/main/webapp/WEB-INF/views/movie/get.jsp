<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 

<%@ include file="../include/header.jsp" %>

<!-- 제목 -->
    <div class="container">
        <div class="row">
            <div class="col-xl-12">
                <div class="section_title text-center yeong-movieTitle">
                    <h3>영화 상세보기</h3>
                </div>
            </div>
        </div>
    </div>
    
    <div class="container">
        
    	<div class="movie-container-left">
    		<div class="uploadResult">
				<ul>
				</ul>
			</div>
<!-- 		    <img class="yeong_moveImg" src="img/instragram/1.jpg" alt=""> -->
		</div>
		<div class="movie-container-right">
			<h3>${movie.movieTitle }</h3>
	        <hr>
			<h4>감독 : <span class="yeong-span">${movie.movieManager }</span></h4>
			<h4>주연배우 : <span class="yeong-span">${movie.movieMainActor } </span></h4>
			<h4>조연배우 : <span class="yeong-span">${movie.movieSupportActor } </span></h4>
			<h4>장르 : <span class="yeong-span">${movie.movieGenre }</span></h4>
			<h4>등급 : <span class="yeong-span">
				<c:choose>
			         <c:when test = "${movie.movieGrade eq 0}">
			            	전체 관람가
			         </c:when>
			         <c:when test = "${movie.movieGrade eq 12}">
			            	12세 관람가
			         </c:when>
			         <c:when test = "${movie.movieGrade eq 15}">
			            	15세 관람가
			         </c:when>
			         <c:otherwise>
			            	청소년 관람 불가
			         </c:otherwise>
			    </c:choose>
			</span></h4>
			<h4>러닝타임 : <span class="yeong-span">${movie.runningTime } 분</span></h4>
			<h4>예매율 : <span class="yeong-span">${movie.yesterdayNum } %</span></h4>
			<h4>개봉일 : <span class="yeong-span"><fmt:formatDate value="${movie.openDate }" pattern="yyyy.MM.dd"/></span></h4>
			<h4>줄거리 : <span class="yeong-span">${movie.summary }</span></h4>
		</div>
    </div>
    
    <form id='operForm' action="/movie/modify" method="get">
		<input type="hidden" id="movieNo" name="movieNo" value='<c:out value="${movie.movieNo }"/>'>
		
		<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
		<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>'>
         		<!--  검색 조건과 키워드 파라미터 추가 -->
        <input type="hidden" id="type" name="type" value='<c:out value="${cri.type }"/>'>
        <input type="hidden" id="keyword" name="keyword" value='<c:out value="${cri.keyword }"/>'>
        <input type="hidden" id="commentNo" name="commentNo" value=''>
	</form><br>
    
    <hr class="clear">
    
    <div class="container">
        <div class="col-xl-12">
             <div class="section_title yeong-center">
		   		<button data-oper="list" class='btn btn-primary yeong-list'>List</button>
		   		<button data-oper="modify" class='btn btn-primary'>영화 수정</button>
		   		<button data-oper="remove" class='btn btn-danger'>영화 삭제</button>
    		</div>
    	</div>
    </div>
    <div class="container">
	    <div class="score_area">
	    	<div class="section_title">
                    <h2 class="yeong-allStar">전체 평점 : ★★★★★ (100%) </h2>
            </div>
	    </div>
    </div>
    
    <div class="container">
        <div class="row">
			<div class='comment_register'>
			    <form id="searchForm" action="#" method="get">
			    	<span class="yeong-star yeong-starRed" id="star_grade">
				        <a href="#" class="star1">★</a>
				        <a href="#" class="star2">★</a>
				        <a href="#" class="star3">★</a>
				        <a href="#" class="star4">★</a>
				        <a href="#" class="star5">★</a>
					</span>
					<input class="yeong-commentInput yeong_input" type="hidden" id="memberId" name='memberId' value="dudwn">
					<input class="yeong-commentInput yeong_input" type="hidden" id="commentStar" name='commentStar'>
			        <input class="yeong-commentInput yeong_input" type='text' id="commentContent" name='commentContent' placeholder="한줄평을 등록해주세요">
			        <button id="commentRegisterBtn" type="button" class='btn btn-primary yeong-list'>등록</button>
			    </form>
		    </div>
    	</div>
	</div>
    
    <div class="container">
        <div class="col-xl-12">
		    <table class="table table-hover">
				<thead>
					<tr>
						<th scope="col" class="yeongth10">평점</th>
						<th scope="col" class="yeongth10">아이디</th>
						<th scope="col" class="yeongth60">한줄평</th>
						<th colspan="2" scope="col" class="yeongth20" >버튼</th>
					</tr>
				</thead>
				<tbody class="chat">
<!-- 					<tr> -->
<!-- 						<td scope="col" class="yeongth10">평점</td> -->
<!-- 						<td scope="col" class="yeongth10">아이디</td> -->
<!-- 						<td scope="col" class="yeongth60">한줄평</td> -->
<!-- 						<td colspan="2" scope="col" class="yeongth20" > -->
<!-- 							<a href='#' class='custom-blue' id='commentUpdate'>수정</a> -->
<!-- 							<a href='#' class='custom-red' id='commentDelete'>삭제</a> -->
<!-- 						</td> -->
<!-- 					</tr> -->
				</tbody>
			</table>
		</div>
	</div>
	<!-- END 댓글 목록 페이징 -->
     <div class="panel-footer pagination justify-content-center">
     
     </div>
     

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">수정하실 내용을  입력해주세요</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<span class="yeong-star yeong-starRed" id="star_grade">
				        <a href="#" class="star1">★</a>
				        <a href="#" class="star2">★</a>
				        <a href="#" class="star3">★</a>
				        <a href="#" class="star4">★</a>
				        <a href="#" class="star5">★</a>
					</span>
					
			        <input class="yeong-commentInput" type='text' id="commentContent" name='commentContent' placeholder="한줄평을  수정해주세요">
					
					<input class="yeong-commentInput" type="hidden" id="movieNo" name='movieNo'>
			        <input class="yeong-commentInput" type="hidden" id="commentStar" name='commentStar'>
			        <input class="yeong-commentInput" type="hidden" id='memberId' name='memberId' value='memberId' readonly="readonly" value="dudwn">
			        <input class="yeong-commentInput" type="hidden" id="commentDate" name='commentDate' value='commentDate' readonly="readonly">
			            
				</div>
				<div class="modal-footer justify-content-center">
					<button type="button" id="modalModify" class="btn btn-primary">수정</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal -->
    <div class="modalmodal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                </div>
                <div class="modal-body">
                    	처리가 완료되었습니다.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
	
	<script src="/resources/js/commentReply.js"></script>
	<script>
	$('#star_grade a').click(function(){
		$(this).parent().children("a").removeClass("on");
		$(this).addClass("on").prevAll("a").addClass("on");
		
		return false;
	});
	
	$('.star1').on("click",function(e){	
  		$('#commentStar').val(1);
	});
	$('.star2').on("click",function(e){	
  		$('#commentStar').val(2);
	});
	$('.star3').on("click",function(e){	
  		$('#commentStar').val(3);
	});
	$('.star4').on("click",function(e){	
  		$('#commentStar').val(4);
	});
	$('.star5').on("click",function(e){	
  		$('#commentStar').val(5);
	});
	
// 	$(document).on("click", "#commentReport", function(e){
// 		e.preventDefault();
// 		console.log($(this).data("commentno"));
// 		var commentNo = $(this).data("commentno");
		
// 		location.href="/report/comment/register?commentNo=" + $(this).data("commentno");
// 	});
	
	</script>
	<script>
		
	
	    $(function(){
	    	var movieNo = '<c:out value="${movie.movieNo}"/>';
	    	
	    	$.getJSON("/movie/getAttachList", {movieNo: movieNo}, function(result){
	    		console.log(result);
	    		var str = "";
	    		
	    		$(result).each(function(i, attach){
	    			var fileCallPath = encodeURIComponent( attach.movieUploadPath + "/s_" + attach.movieUuid + "_" + attach.movieFileName);
					var originPath = attach.movieUploadPath + "\\" + attach.movieUuid + "_" + attach.movieFileName;
					originPath = originPath.replace(new RegExp(/\\/g), "/");
					
					str += "<img class='yeong_moveImg' src='/movieUpload/display?movieFileName=" + originPath + "'>"
	    			
	    		});
	    		$(".uploadResult ul").html(str);
	    	}).fail(function(xhr, status, err){
	    		console.log(err);
	    	});
	    	
	    	var operForm = $("#operForm");
	    	var cno = $("#commentNo");
		    
		    $("button[data-oper='modify']").on("click", function (e){
		    	operForm.attr("action", "/movie/modify").submit();
		    });
		  	 
		    $("button[data-oper='list']").on("click", function (e){
		    	operForm.find("#movieNo").remove();
		    	operForm.attr("action", "/movie/list")
		    	operForm.submit();
		    });
		    
		    $("button[data-oper='remove']").on("click", function (e){
		    	operForm.attr("action", "/movie/remove").submit();
		    });
		    
		    $(document).on("click", "#commentReport", function(e){
		    	
		    	var cmno = $(this).data("commentno");
		    	console.log(cmno);
		    	cno.attr("value", cmno);
		    	operForm.attr("action", "/report/comment/register").submit();
		    });
		    
		    var result = '<c:out value="${result}"/>';
		      
	      	 //result 값이 있는지 확인하는 함수 호출
	     	 checkModal(result);
	      
	      	 //뒤로가기 할때 발생하는 오류잡기
	      	 history.replaceState({}, null, null);
	      
	      	 //result 값이 있는지 확인하는 함수
	      	 function checkModal(result){
	    	    if(result === '' || history.state){
	    		    return;
	    	    }
		    	 console.log(result);
		    	 $('#myModal').modal('show');
	         }
		    
			
		});
	    
	  
	    $(function(){
	    	
	    	var movieNo = '<c:out value="${movie.movieNo}"/>'; //
	    	var replyUL = $(".chat");

			console.log("1?");
	    	showList(1);

	    	function showList(page){
	    		commentService.getList({movieNo : movieNo, pageNum:pageNum||1}, //페이지 번호가 없을경우 1로설정
	    			function(replyCnt, list){
	    			var str = "";
	    			console.log("?");
	    			//page번호가 -1로 전달되면 마지막페이지를 호출하게된다 
	    			if(pageNum == -1){
	    				//Math.ceil() 소숫점 이하 올림 -> 댓글갯수에따라 페이지번호 결정
	    				pageNum = Math.ceil(replyCnt/10.0);
	    				showList(pageNum);
	    				return;
	    			}
	    			
	    			//댓글목록이 없으면 replyUL의 내용을 비우고 중단
	    			if(list == null || list.length == 0){
//	     				replyUL.html("");
	    				//마지막페이지에 댓글이1개 일때 삭제하면 그전페이지로 이동
	    				if(pageNum>1){
	    					pageNum = pageNum - 1;
	    					showList(pageNum);
	    				}
	    				return;
	    			}
	    			//댓글 달기
	    			for(var i=0, len=list.length||0; i<len; i++){
	    				if(list[i].commentStar == 1){
	    					list[i].commentStar = "★";
	    				} else if(list[i].commentStar == 2){
	    					list[i].commentStar = "★★";
	    				} else if(list[i].commentStar == 3){
	    					list[i].commentStar = "★★★";
	    				} else if(list[i].commentStar == 4){
	    					list[i].commentStar = "★★★★";
	    				} else if(list[i].commentStar == 5){
	    					list[i].commentStar = "★★★★★";
	    				} 
	    				
	    				
						str += "<tr data-commentNo='"+list[i].commentNo+"'>";
						str += "  <td scope='row' class='yeongth10 yeong-starRed'>" + list[i].commentStar + "</td>";
						str += "  <td class='yeongth10'>" + list[i].memberId + "</td>";
						str += "  <td scope='col' class='yeongth60'>" + list[i].commentContent + "</td>";
						str += "  <td colspan='2' class='yeongth20'><a href='#' class='custom-blue' id='commentUpdate' data-commentNo='"+list[i].commentNo+"'>수정</a>";
						str += "     <a href='#' id='commentDelete' class='custom-red' data-commentNo='"+list[i].commentNo+"'>삭제</a>";
						str += "     <a href='#' id='commentReport' class='custom-red' data-commentNo='"+list[i].commentNo+"'>신고</a></td>";
						
						str += "</td>"
	    				
	    			}
	    			replyUL.html(str);
	    			showReplyPage(replyCnt);
	    		}); //end function
	    		
	    	}//end showList
	    	
	    	var pageNum = 1;
	    	var replyPageFooter = $(".panel-footer");
	    	function showReplyPage(replyCnt){	
	    		//Criteria cri = new Criteria(page, 3); - 컨트롤러 댓글 페이지수조절
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
	    		
	    		var str = "<ul class='pagination'>";
	    		
	    		if(prev) {
	    			str += "<li class='paginate_button previous'><a class='page-link' href='" + (startNum - 1) + "'>Previous</a></li>";
	    		}
	    		
	    		for(var i = startNum ; i<= endNum; i++) {
	    			var active = pageNum == i? "active" : "";
	    			str += "<li class='paginate_button " + active + " '><a class='page-link' href='" + i + "'>" + i + "</a></li>";
	    		}
	    		
	    		if(next) {
	    			str += "<li class='paginate_button'><a class='page-link' href='" + (endNum + 1) + "'>Next</a></li>";
	    		}
	    		str += "</ul></div>";
	    		
	    		console.log(str);
	    		replyPageFooter.html(str);
	    	}//End 댓글 목록 페이징
	    	
	    	replyPageFooter.on("click", "li a", function(e){
	    		e.preventDefault();
	    		console.log("page click");
	    		
	    		var targetPageNum = $(this).attr("href");
	    		
	    		pageNum = targetPageNum;
	    		
	    		showList(pageNum);
	    	});
	    	
	    	//새로운 댓글의 추가버튼
	    	var container = $(".container");
	    	var inputStar = container.find("input[name='commentStar']");
	    	var inputContent = container.find("input[name='commentContent']");
	    	var inputMemberId = container.find("input[name='memberId']");
	    	
	    	
	    	
	    	//모달창
	    	var modal = $(".modal");
	    	var modalInputStar = modal.find("input[name='commentStar']");
	    	var modalInputContent = modal.find("input[name='commentContent']");
	    	var modalcommentDate = modal.find("input[name='commentDate']");
	    	var modalmemberId = modal.find("input[name='memberId']");
	    	var modalmovieNo = modal.find("input[name='movieNo']");
	    	
	    	var modalModify = $("#modalModify");
	    	
	    	
	    	var commentDelete = $("#commentDelete");
	    	var commentRegisterBtn = $("#commentRegisterBtn");
	    
	    	
	    	var replyer = null; //로그인한 아이디
	    	
// 	    	<sec:authorize access="isAuthenticated()">
// 	    		replyer = '<sec:authentication property="principal.username" />';
// 	    	</sec:authorize>
	    	
// 	    	var csrfHeaderName = "${_csrf.headerName}";	//CSRF 토큰 관련 변수 추가
// 	    	var csrfTokenValue = "${_csrf.token}";	//CSRF
	    	
	    	//beforeSend 대신 사용
// 	    	$(document).ajaxSend(function(e, xhr, options){	//전송 전 추가 헤더 설정
// 	    		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
// 	    	});
	    	
	    	commentRegisterBtn.on("click", function(e){
	            var comment = {
	                  commentStar : inputStar.val(),
	                  commentContent : inputContent.val(),
	                  movieNo : movieNo,
	                  memberId : inputMemberId.val()
	            };
	            commentService.add(comment, function(result){
	               alert(result);
	               inputContent.val("");
	               pageNum = 1;			// 등록할때 페이지번호가 1로 가게할려고
	               showList(pageNum);
	            });
	        });
	    	
	    	$(document).on("click", "#commentUpdate", function(e){
	        	console.log($(this).data("commentno"));
	        	
	    		commentService.get($(this).data("commentno"), function(data){		//rno값 보낸다
	    			console.log("gg");
	    	   		console.log(data.commentStar);
	    	   		console.log(data.commentContent);
	    	   		console.log(data.memberId);
	    	   		console.log(data.commentDate);
	    	   		console.log(data.commentNo);
	    	   		
	    	   		modal.data("commentNo", data.commentNo);
	    	   		console.log(modal.data('commentNo'));
	    	   		
	    	   		
	    	    	modalInputStar.val(data.commentStar);		
	    	    	modalInputContent.val(data.commentContent);
	    	    	modalmemberId .val(data.memberId);
	    	    	modalcommentDate.val(data.commentDate);	
	    	    	modalmovieNo.val(data.movieNo);	
	    	    	
// 	    	   		modalInputReplyDate.val(replyService.displayTime(data.replyDate)).attr("readonly", "readonly");	
	    	   		
	    	   		modal.data("commentNo", data.commentNo);
	    	   		
// 	    	   		modal.find("button[id != 'modalCloseBtn']").hide();	
	    			
	    			$('#exampleModal').modal('show');
	    	   		
	    		}, function(err){
	    			console.log(err);
	    		});
	        });
	    	
	    	
	      	//댓글 수정 버튼 이벤트 처리 - 동적이게 처리할필요없음 .on("click"
	        $(document).on("click", "#modalModify", function(e){
	        	console.log(modal.data('commentNo'));
	        	
	        	commentService.update({
	        		commentNo : modal.data('commentNo'),
	        		commentStar : modalInputStar.val(),
	                commentContent : modalInputContent.val()
	    			
	    		}, function(result){
	    			alert("수정완료");
	    			
	    			modal.modal("hide");				
	    	        showList(pageNum);
	    			
	    		}, function(err){
	    			console.log(err);
	    		});
	        });
	        //END 수정 버튼 이벤트 처리
	        
	        
		      $(document).on("click", "#commentDelete", function(e){
		    	  var commentNo = $(this).data('commentno');
		    	  console.log(commentNo);
		    	  
		    	  e.preventDefault();
		    	  
		        	if(!memberId){
		                // 로그인하지 않은 경우
		                alert('로그인 후 삭제가 가능합니다.');
		                return ;
		             }
		             var originalReplyer = inputMemberId.val();
		             console.log(originalReplyer);
		             console.log(memberId);
	
		             console.log(originalReplyer + " + " + memberId);
		             
		             if("dudwn" != originalReplyer){
		                // 자신의 댓글이 아닌 경우
		                alert('자신의 댓글만 삭제 가능합니다.');
		                return ;
		             }
		             
		             commentService.remove(commentNo, originalReplyer, function(result){
		                alert(result);
		                showList(pageNum);
		             });
		      });
	        
	        
	    	
	    });
		</script>
	
	
	
<%@ include file="../include/footer.jsp" %>