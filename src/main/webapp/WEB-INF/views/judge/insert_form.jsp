<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판 례 등 록 </title>
	<script type="text/javascript">
	window.onload = function(){
		//오늘 날짜 추출
		var today = new Date()
		var year = today.getFullYear();//4자리 연도
		var mon = today.getMonth()+1;
		mon = (mon < 10)?"0"+mon: mon;
		var date = today.getDate();
		date = (date<10)?"0"+date: date;
		// date타입은  입출력 형식은  "YYYY-MM-DD"
		document.querySelector("#regdate").value = year+"-"+mon+"-"+date;
		//alert(year+"-"+mon+"-"+date);
	
		
		
	}
	</script>
</head>
<body>
	<form action="insert_action" method="post">
<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">

				<tbody>
					<h1>판 례 등 록</h1>
	<div>
	<a class="btn btn-primary" href="list" style="text-decoration:none"  role="button">판례 목록</a>
	</div>
	<form action="insert_action" method="post">
		<tr><label>
			<td>판 례 제 목</td>
			<td colspan="2"><input type="text" name="title"></td>
		</label> </tr>
		
		<tr><label>
		<td>판 례 등 록 일:</td>
			<td colspan="2"><input id="regdate" type="date" name="regdate"></td>
		</label> </tr>
		
		<tr><label>
		<td>판 례 발 생 일:</td>
			<td colspan="2"><input type="date" name="hapdate"></td>
		</label> </tr>
		
		<tr><label>
			<td>판 례 내 용:</td>
			<td colspan="2"><textarea rows="10" cols="100" name="content"></textarea></td>
		</label></tr>
		
		<tr><label>
		<td>관 련 규 정 :</td>
			<td colspan="2"><input type="text" name="relrule"></td>
		</label> </tr>
				
				</tbody>
			</table>
			
<input type="submit" value="판 례 등 록">
	</form>


</body>
</html>