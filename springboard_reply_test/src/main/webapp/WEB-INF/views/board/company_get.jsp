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
					<button type="modify" class="btn btn-default" onclick="location.href='/board/company_modify?bno=<c:out value="${board.bno }"/>'">글 수정</button>
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

	<form role="form" action="/replies/company_register" method="post">
		<div class = "panel panel-default">
			<div class= "panel-heading">
				<i class = "fa fa-comments fa-fw"></i> 댓글
					<input type="hidden" name="bno" value="${board.bno }" />
					<button type="submit" id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New Reply</button>
			</div>
			
			<div class = "panel-body">
				<ul class = "chat">
					<li class = "left clearfix" data-rno = '12'>
						<div>
							<div class = "header">
								<label>작성자</label> <input class="form-control" name='replyer' value="${user }" readonly="readonly">
							</div>
							<label>내용</label>
							<p><textarea class = "form-control" rows="3" name ='reply'></textarea></p>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</form>

<c:forEach items="${list }" var="replies">
<c:if test="${replies.bno eq board.bno }" >
<div class = 'row'>
	<div class = "col-lg-12">
		
		<div class = "panel panel-default">
			<div class= "panel-heading">
				<i class = "fa fa-comments fa-fw"></i> 댓글
			</div>
			
			<div class = "panel-body">
				<ul class = "chat">
				
					<li class = "left clearfix" data-rno = '12'>
						<div>
							<div class = "header">
								<strong class = "primary-font"><c:out value="${replies.replyer }"/></strong>
								<small class = "pull-right text-muted"><fmt:formatDate pattern="yyyy-MM-dd"
                                   		value="${replies.replyDate }"/></small>								
							</div>
							<p><c:out value="${replies.reply }"/></p>
							<form action="/replies/company_remove" method="get">
							<input type="hidden" name="rno" value="${replies.rno }">
							<input type="hidden" name="replyer" value="${replies.replyer}">
							<button type="button" onclick="location.href='/replies/company_modify?rno=<c:out value="${replies.rno }"/>'" class='btn btn-primary btn-xs pull-right'>수 정</button>
							<c:if test="${user == replies.replyer  ||  model == '1'}">
							<input type="hidden" name="bno" value="${replies.bno }">
							<button type="submit" id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>삭 제</button>
							</c:if>
							</form>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
</c:if>
</c:forEach>



<%@include file="../includes/footer.jsp"%>