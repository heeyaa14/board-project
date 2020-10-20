<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="layout/header.jsp"%>

<main class="container">
	<form>

		<div class="form-group">
			<label for="title">Title:</label> <input type="text"
				value="${board.title}" class="form-control" placeholder="title"
				id="title">
		</div>

		<div class="form-group">
			<label for="content">Content:</label>
			<textarea class="form-control" rows="5" id="content">${board.content}</textarea>
		</div>

		<button type="button" onclick="updateBoard(${board.id})" class="btn btn-primary">수정하기</button>
	</form>
</main>

<script>
function updateBoard(id){
	// id, title, content
	let title = document.querySelector("#title").value;
	let content = document.querySelector("#content").value;
;
	
	console.log("id", id);
	console.log("title", title);
	console.log("content", content);

	let board = {
		title: title,
		content: content
	};

	fetch("/board/"+id, {
		method: "put",
		headers: {
			'Content-Type': 'application/json; charset=utf-8',
		},
		body: JSON.stringify(board)
	}).then(res=> res.text())
	.then(res=> {
		if(res=="ok"){
			alert("수정완료");
			location.href="/board/"+id;
		}else{
			alert("수정실패");
		}
	});

	console.log(board);
}

  $(document).ready(function() {
      $('#content').summernote({
    	  tabsize: 2,
          height: 300
      });
  });
</script>

<%@ include file="layout/footer.jsp"%>


