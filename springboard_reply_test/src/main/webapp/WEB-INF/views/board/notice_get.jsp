<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../includes/header.jsp" %>    
 
 <script type="text/javascript" src="../resources/ckeditor/ckeditor.js"></script>
<script>
    CKEDITOR.replace( 'ckeditor', {
    } );
</script> 
   
<div class="row">
	<div class="col-lg-12">
		<h1 class = "page-header">게시글의 내용</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class ="panel panel-default">
		
			<div class="panel-heading">${board.bno } 번째 게시글 내용</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
			
				<div class="row">
                    <div class="col-md-6 pr-1">
                      <div class="form-group">
                        <label> 번호 </label>
                        <input class="form-control" name='bno'
					value = '<c:out value="${board.bno }" />' readonly = "readonly">
                      </div>
                    </div>
                    <div class="col-md-6 pl-1">
                      <div class="form-group">
                        <label> 작성자 </label>
                        <input class="form-control" name='writer'
					value = '<c:out value="${board.writer }" />' readonly = "readonly">
                      </div>
                    </div>
                  </div>
                  
                 <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label> 제목 </label>
                        <input class="form-control" name='title'
					value = '<c:out value="${board.title }" />' readonly = "readonly">
                      </div>
                    </div>
                  </div>
				
				<div class="form-grop">
					<label>텍스트 내용</label>
					<textarea rows="3" class="ckeditor" name='content' readonly="readonly">
					<c:out value="${board.content }"></c:out>
					</textarea>
				</div>
				<br>
				<c:if test="${user == board.writer  ||  model == '1'}">
					<button type="modify" class="btn btn-default" onclick="location.href='/board/notice_modify?bno=<c:out value="${board.bno }"/>'">글 수정</button>
				</c:if>
				<button type="list" class="btn btn-default" onclick="location.href='/board/list'">리스트</button>
			</div>
			<!-- end panel-body -->
		</div>
		<!-- end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->




<%@include file="../includes/footer.jsp"%>