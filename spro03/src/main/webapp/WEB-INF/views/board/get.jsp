<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@include file="../includes/header.jsp" %>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">게시글 상세 화면</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            게시글 상세
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <!-- <form role="form" action="/board/get"> -->
                                        <div class="form-group">
                                            <label>번호</label>
                                            <input class="form-control" name="bno" 
                                                 value='<c:out value="${board.bno }"/>' readonly="readonly">
                                        </div>
                                        <div class="form-group">
                                            <label>제목</label>
                                            <input class="form-control" name="title" 
                                                 value='<c:out value="${board.title }"/>' readonly="readonly">
                                        </div>
                                        <div class="form-group">
                                            <label>내용</label>
                                            <textarea class="form-control" rows="3" name="content" readonly><c:out value="${board.content}"/></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>작성자</label>
                                            <input class="form-control" placeholder="Enter text" name="writer"
                                               value='<c:out value="${board.writer }"/>' readonly>
                                        </div>
                                        
                                        <button data-oper='modify' class="btn btn-default">수정</button>
                                        <button data-oper='list' class="btn btn-default">목록</button>
                                        <form id="operForm" action="/board/modify" method="get">
                                        	<input type='hidden' id="bno" name="bno" value='<c:out value="${board.bno }"/>'>
                                            <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
  											<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
  											<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
  											<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
                                        </form>
                                    <!-- </form> -->
                                </div>
                                <!-- /.col-lg-6 (nested) -->
        
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
<%@include file="../includes/footer.jsp" %>

<script type="text/javascript" src="/resources/js/reply2.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	
	console.log("==================")
	console.log("JS TEST")
	
	var bnoValue = '<c:out value = "${board.bno}"/>';
	
	// for replyService add Test
	/* replyService.add(
		{reply:"JS TEST", replyer:"tester", bno:bnoValue},
		function(result){
			alert("RESULT : " + result);
		}
	);  */
	
	
	// for replyService add Test
	replyService.getList({bno:bnoValue, page:1},
		function(list){
			for(var i = 0, len=list.length||0 ; i<len ; i++){
				console.log(list[i]);
			}
		}
	);
	
	// for replyService delete Test
	/* replyService.remove(101, 
	  function(count){
		console.log(count);
		if (count==="success"){
			alert("REMOVE 성공했음.");
		}
	  },
	  function(err){
		  alert("REMOVE ERROR.. ");
	  }
	); */
	
	//12번 댓글 수정 
	 replyService.update({
	  rno : 2,
	  bno : bnoValue,
	  reply : "Modified Reply...."
	  
	}, function(result) {

	  alert("수정 완료...");

	});  
	
	
	
	console.log(replyService)
})
</script>


<script type="text/javascript">
$(document).ready(function(){
	var operForm = $("#operForm");
	
	$("button[data-oper='modify']").on('click', function(e){
		operForm.attr("action","/board/modify").submit();
	});
	
	$("button[data-oper='list']").on("click",function(e){
		operForm.find("#bno").remove();
		operForm.attr("action", "/board/list");
		operForm.submit();
	})
})
</script>