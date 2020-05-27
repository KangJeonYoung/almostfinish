<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="includes/header.jsp" %>    
    
<div class="row">
	<div class="col-lg-12">
		<h1 class = "page-header">내 정보</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class ="panel panel-default">
		
			<div class="panel-heading">Board Register</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
			
				<form role="form" action="/modify" method="post">
				
				   <c:forEach items="${user }" var="user">
					<div class="form-group">
						<label>아이디</label> <input class="form-control" name='userid' readonly="readonly" value="${user.userid }">
					</div>
					<div class="form-group">
						<label>비밀번호</label> <input class="form-control" name='pw' value="${user.pw }" >
					</div>
				   <div class="row">
                    <div class="col-md-6 pr-1">
					   	<div class="form-group">
							<label>유저의 이름</label> <input class="form-control" name='username' readonly="readonly" value="${user.username }">
						</div>
					</div>
					<div class="col-md-6 pr-1">
					<div class="form-group">
						<label>이메일 </label> <input class="form-control" name='email' value="${user.email }">
					</div>
					</div>
				   </div>					
					</c:forEach>
					
					
						<button type="submit" class = "btn btn-default">수정하기</button>
						<button type="reset" class = "btn btn-default">리 셋</button>
				</form>
			</div>
			<!-- end panel-body -->
		</div>
		<!-- end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->
<%-- <%@include file=includes/footer.jsp"%> --%>