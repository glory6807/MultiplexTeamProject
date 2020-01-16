<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ include file="../include/header.jsp" %>

	<div class="hanna_head">
		<h3>TIME TABLE</h3>
	</div>
	

	<jsp:useBean id="date" class="java.util.Date"/>
	<c:set var="to" value="<%=new Date(new Date().getTime())%>"/>
	<c:set var="tomorrow" value="<%=new Date(new Date().getTime() + 60*60*24*1000)%>"/>
	<c:set var="tonext" value="<%=new Date(new Date().getTime() + 60*60*48*1000)%>"/>

	<!-- 상영 날짜 선택 탭 -->
	<hr>
	<div class="schedule_item">
		<a href='/schedule/get?scheduleDate=<fmt:formatDate value="${to }" pattern="yyyyMMdd"/>' class="schedule_item_date">
			<h3><fmt:formatDate value="${to }" pattern="dd"/></h3>
			<p><fmt:formatDate value="${to }" pattern="MM"/></p>
		</a>
		<a href='/schedule/get?scheduleDate=<fmt:formatDate value="${tomorrow }" pattern="yyyyMMdd"/>' class="schedule_item_date">
			<h3><fmt:formatDate value="${tomorrow }" pattern="dd"/></h3>
			<p><fmt:formatDate value="${tomorrow }" pattern="MM"/></p>
		</a>
		<a href='/schedule/get?scheduleDate=<fmt:formatDate value="${tonext }" pattern="yyyyMMdd"/>' class="schedule_item_date">
			<h3><fmt:formatDate value="${tonext }" pattern="dd"/></h3>
			<p><fmt:formatDate value="${tonext }" pattern="MM"/></p>
		</a>
	</div> <!-- 상영 날짜 선택 탭 END -->
	
	<script>
// 		$(function(){
// 			$(".schedule_item_date").on("click", function(e){
// 				// 상영 날짜를 선택했을 때!
// 				e.preventDefault();
// 			});
// 		});
	
	</script>
	
	<!-- 상영시간표  -->
	<c:set var="loop_flag" value="false"/>
	<c:forEach items="${schedule1 }" var="s">
		<c:if test="${not loop_flag }">
			<div class="hanna_container">
				<br>
				<div class="hanna_schedule_movie"> ${s.movieVO.movieTitle } </div>
				<div class="hanna_schedule_screen"> 1관 3층 </div><br>
				<c:set var="loop_flag" value="true"/>
				<hr>
				<div class="hanna_schedule_time_wrap">
					<c:forEach items="${schedule1 }" var="s" >
							<div class="hanna_schedule_time"> ${s.scheduleTime } </div>
					</c:forEach>
				</div>
			</div>
		</c:if>
	</c:forEach>
	
	<c:set var="loop_flag" value="false"/>
	<c:set var="loop_flag2" value="false"/>
	<c:forEach items="${schedule2 }" var="s">
		<c:if test="${not loop_flag }">
			<div class="hanna_container">
				<br>
				<div class="hanna_schedule_movie"> ${s.movieVO.movieTitle } </div>
				<div class="hanna_schedule_screen"> 2관 3층 </div><br>
				<c:set var="loop_flag" value="true"/>
				<hr>
				<div class="hanna_schedule_time_wrap">
					<c:forEach items="${schedule2 }" var="s">
						<div class="hanna_schedule_time"> ${s.scheduleTime } </div>
					</c:forEach>
				</div>
			</div>
		</c:if>
	</c:forEach>
	
	<c:set var="loop_flag" value="false"/>
	<c:set var="loop_flag2" value="false"/>
	<c:forEach items="${schedule3 }" var="s">
		<c:if test="${not loop_flag }">
			<div class="hanna_container">
				<br>
				<div class="hanna_schedule_movie"> ${s.movieVO.movieTitle } </div>
				<div class="hanna_schedule_screen"> 3관 3층 </div><br>
				<c:set var="loop_flag" value="true"/>
				<hr>
				<div class="hanna_schedule_time_wrap">
					<c:forEach items="${schedule3 }" var="s">
						<div class="hanna_schedule_time"> ${s.scheduleTime } </div>
					</c:forEach>
				</div>
			</div>
		</c:if>
	</c:forEach>
	<!-- 상영시간표 END -->

	<!-- 관리자에게만 보임 : 시간표 등록/수정/삭제 버튼 -->
<!--     <div class="container"> -->
<!--         <div class="row"> -->
<!--             <div class="col-xl-10 offset-xl-1 col-md-12"> -->
<!--                 <div class="Query_border"> -->
<!--                     <div class="row align-items-center justify-content-center"> -->
<!--                         <div class="col-xl-6 col-md-6"> -->
<!-- 							<a href="#" class="hanna_button">시간표 등록</a> -->
<!-- 							<a href="#" class="hanna_button">시간표 수정</a> -->
<!-- 							<a href="#" class="hanna_button delete_button">시간표 삭제</a> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->
    
    <div class="hanna_container">
<!--     	<div class="container"> -->
<!--     	<div class="row"> -->
<!-- 			<div class="col-xl-12"> -->
<!-- 				<div class="section_title text-center"> -->
			    	<button class="hanna_button">시간표 등록</button>
					<button class="hanna_button">시간표 수정</button>
					<button class="hanna_button delete_button">시간표 삭제</button>
<!-- 				</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
    </div>
	
	
	
	
<%@ include file="../include/footer.jsp" %>