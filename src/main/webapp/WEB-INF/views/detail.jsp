<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="layout/header.jsp" %>

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
	margin: 0 auto;
}

button {
	width: 100px;
	height: 40px;
	background-color: lightgray;
	color: black;
	border-radius: 8px;
	border: 0px;
	font-size: 14px;
	font-weight: 600;
}

</style>

<main>
	<div class="h1Section">
		<h1>게시글 상세보기</h1>
	</div><br /><br />
	
	<div class="content" align="center">
	<table class="table table-bordered" >
		<tr>
			<th>title</th>
			<td>${board.title}</td>
		</tr>
		<tr>
			<th>content</th>
			<td>${board.content}</td>
		</tr>
		<tr>
			<th>createDate</th>
			<td>${board.createDate }</td>
		</tr>
		<tr>
			<th>readCount</th>
			<td>${board.readCount }</td>
		</tr>
		
	</table><br />
	<div align="right">
		<button onclick="location.href ='/updateForm/${board.id}'">수정</button>
		<button onclick="deleteBoard(${board.id})">삭제</button>
	</div>
	</div>
</main>

<script>

	function deleteBoard(id){
		fetch("/board/"+id, {
			method: "delete"
		}).then(res=> res.text())
		.then(res=> {
			if(res=="ok"){
				alert("삭제가 완료되었습니다!");
				location.href = "/list";
			}else{
				alert("삭제를 실패했습니다.");
			}
		});
	}
</script>

<%@ include file="layout/footer.jsp" %>

