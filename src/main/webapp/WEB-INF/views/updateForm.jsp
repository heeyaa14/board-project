<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp"%>    
<style>
.h1Section {
	width: 100%;
	height: 70px;
	padding-top: 22px;
	background-color: gray;
	text-align: center;
}

.h1Section > h1 {
	font-size: 20px;
	color: white;
	font-family: sans-serif;
	font-weight: 650;
}

.content {
	width: 70%;
	height: 100%;
	margin: 0 auto;
	text-align: center;
}

#btnUpdate {
	width: 120px;
	height: 42px;
	background-color: lightgray;
	color: black;
	border-radius: 8px;
	border: 0px;
	font-size: 14px;
	font-weight: 600;
}

</style>

<main class="container">
	<div class="h1Section">
			<h1>게시글 수정하기</h1>
		</div><br /><br />
		<!-- 
		<div class="content" align="center">
		<table class="table table-bordered" >
			<tr>
				<th>title</th>
				<td><input type="text" value="${board.title}" class="form-control" placeholder="title" id="title"></td>
			</tr>
			<tr>
				<th>content</th>
				<td><textarea class="form-control" rows="5" id="content">${board.content}</textarea></td>
			</tr>
			<tr>
				<th>createDate</th>
				<td>${board.createDate }</td>
			</tr>
			<tr>
				<th>readCount</th>
				<td>${board.readCount }</td>
			</tr>
			 -->
	<div class="content">
		<input type="text" value="${board.title}" class="form-control" placeholder="title" id="title">
		<br />
		<textarea class="form-control" id="content">${board.content}</textarea>
		<br />
		<button id="btnUpdate" type="button" onclick="updateBoard(${board.id})" >수정완료</button>
	</div>
</main>   
    
<script>
function updateBoard(id){
	// id, title, content
	let title = document.querySelector("#title").value;
	let content = document.querySelector("#content").value;
	
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
			alert("수정이 완료되었습니다!");
			location.href="/board/"+id;
		}else{
			alert("수정을 실패했습니다.");
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