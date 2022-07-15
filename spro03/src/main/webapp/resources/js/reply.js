console.log("Reply Module......")
//var replyService = (function(){return{name:"AAAAA"};})();
var replyService = (function(){
    // 댓글 추가
	function add(reply, callback){
		console.log("reply replyService add-->" );
		
		$.ajax({
		  type:'post',
		  url:'/replies/new',
		  data:JSON.stringify(reply),
		  contentType:"application/json; charset=utf-8",
		  success:function(result, status, xhr){
		    if(callback){
		      callback(result);
		    }
		  },
		  error:function(xhr, status, er){
		    if(error){
		      error(er);
		    }
	      }
	    })
	}	    
		
	// 댓글 목록 가져오기
	function getList(param, callback, error){
	
	    var bno = param.bno;
	    var page = param.page || 1;
	    
		console.log("reply replyService getList--> " + bno + ", " + page);
		
		$.getJSON("/replies/pages/" + bno + "/" +page + ".json",
			function(data){
			  if(callback){ 
			    callback(data);
			  }
			}).fail(function(xhr, status, err){
			  if(error){ 
			     error(); 
			  }
			});
	 }
	 
	 function remove(rno, callback, error){
	   $.ajax({
	     type : 'delete',
	     url : '/replies/' + rno,
	     seccess : function(deleteResult, status, xhr){
	       if(callback){
	         callback(deleteResult);
	       }
	       
	     },
	     
	     error : function(xhr, status, er){
	       if(error){
	         error(er);
	       }
	     }
	   });
	 }
	  
	 function update(reply, callback, error){
	   console.log("RNO: " + reply.rno);
	   
	   $.ajax({
	     type : 'put',
	     url : '/replies/' + reply.rno,
	     data : JSON.stringify(reply),
	     contentType : "application/json; charset=utf-8",
	     success : function(result, status, xhr){
	       if(callback) {
	         callback(result);
	       }
	     },
	     error : function(xhr, status, er){
	       if(error){
	         error(er);
	       }
	     }
	   });
	 }   
	    
	 return { 
	   add: add,
	   getList : getList,
	   remove : remove,
	   update : update
     };
	  
})();