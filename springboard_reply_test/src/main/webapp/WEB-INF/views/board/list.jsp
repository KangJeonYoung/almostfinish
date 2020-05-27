<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
    
<!DOCTYPE html>
<html lang="UTF-8">

<%-- <%
String id = (String)session.getAttribute("test");
if(id==null){ %>
<script>
location.href="/login";
</script>
<%}%> --%>


<%@include file="../includes/header.jsp" %>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">자유 게시판</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            자유 게시판 페이지
                            <buttom id='regBtn' type="button" class="btn btn-sx pull-right">글 쓰 기</buttom>
                            
                            <%-- <c:if test="${model == '1' }">
                            	<buttom type="button" onclick="location.href='/admin'" class="btn btn-sx">관리자 계정</buttom>
                            </c:if>  --%>
                            <input type="text" value="${model }">
                            
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>#번호</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>작성일</th>
                                            <th>수정일</th>
                                        </tr>
                                    </thead>
                                    
                                    <c:forEach items="${list }" var="board">
									<tr>
                                   		<td><c:out value="${board.bno }"/></td>
                                   		<td><a href='/board/get?bno=<c:out value="${board.bno }"/>'>
                                   		<c:out value="${board.title }"/></a></td>
                                   		<td><c:out value="${board.writer }"/></td>
                                   		<td><fmt:formatDate pattern="yyyy-MM-dd"
                                   		value="${board.regdate }"/></td>
                                   		<td><fmt:formatDate pattern="yyyy-MM-dd"
                                   		value="${board.updateDate }"/></td>
                                   	</tr>                             
                                    </c:forEach>
                                    
                                </table>
                              <%--   세션얻어오는 방법
                                <% session.getAttribute(${); %> --%>
                                <!-- Modal 추가 -->
					          	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					          		aria-labelledby="myModalLabel" aria-hidden="true">
					          		<div class = "modal-dialog">
					          			<div class="modal-content">
					          				<div class="modal-header">
					          					<button type="button" class = "close" data-dismiss="modal" 
					          						aria-hidden="true">&times;</button>
					          					<h4 class="modal-title" id="myModalLabel">Modal title</h4>
					          				</div>
					          				<div class = "modal-body">처리가 완료되었습니다.</div>
					          				<div class="modal-footer">
					          					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					          					<!-- <button type="button" class="btn btn-primary">Save changes</button> -->
					          				</div>
					          			</div>
					          			<!-- /.modal-content -->
					          		</div>
					          		<!-- /.modal-dialog -->
					          	</div>
					          	<!-- /.modal -->
					          	
                            </div>
                            <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
            </div>
            <!-- /.row -->

            <script type="text/javascript">
            	$(document).ready(function(){
            		var result = '<c:out value="${result}"/>';
		            checkModal(result);
            
        		    function checkModal(result){
            	
            			if(result === ''){
            				return;
            			}
            	
           			 	if (parseInt(result) >0){
            				console.log("들어옴?");
            				$(".modal-body").html("게시글" + parseInt(result) + " 번이 등록되었습니다.");
            			}
            	
            			$("#myModal").modal("show");
            		}
        		    
        		    $("#regBtn").on("click", function(){
        		    	self.location = "/board/register";
        		    });
            	});
            </script>
            
	<!-- 아래코드는 footer -->
  <%@ include file="../includes/footer.jsp" %>
            
       <script>
		var id = <%=(String)session.getAttribute("id")%>

		if(id == null){
			// 거치적 거리면 alert 부분 삭제 가능.
			location.href="/login"
			alert('로그인을 해주세요.');
		} else{}

      </script>  
            
</body>

</html>
