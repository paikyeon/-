<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>판 례 수 정</title>
	<script type="text/javascript">
	window.onload = function(){
		
	}
	</script>
</head>
<body>
	<h1>판 례 수 정</h1>

	<div>
		<a href="list?pno=${param.pno}" style="text-decoration:none">판례 목록</a>
	</div>
	<hr>
	<br>

	<form action="update_action" method="post">
<table border="2">
		<tr>
		<td>판 례 제 목:</td>
		<td><input type="text" name="title" value="${vo.title}">
			<input type="hidden" name="no" value="${vo.no}">
			<input type="hidden" name="pno" value="${param.pno}"></td>
	</tr>
		<tr>
		<td>판 례 내 용:</td>
		<td><textarea rows="10" cols="100" name="content">${vo.content}</textarea></td>
	</tr>
	<tr>
		<td>관 련 규 정:</td>
		<td><input type="text" name="relrule" value="${vo.relrule}"></td>
	</tr>
    <tr>
    <td>판 례 등 록 일:</td>
		<td><input id="regdate" type="date" name="regdate" value="${vo.regdate}">
    </tr>
    <tr>
		<td>판 례 발 생 일:</td>
		<td><input type="date" name="hapdate" value="${vo.hapdate}"></td>
   </tr>
	
	
</table>
		
		<input type="submit" value="판 례 등 록">
	</form>


</body>
</html>



