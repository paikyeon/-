<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
   <% pageContext.setAttribute("replaceChar", "\n"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상 세 보 기</title>
	<script type="text/javascript">
	window.onload = function(){
		document.querySelector("#del_link").onclick = function(){
			
			return confirm("삭제할까요?"); //기본동작 취소
		}
	}
	</script>
</head>
<body>
	
	<h1>상 세 보 기</h1>


<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">판례번호:${vo.no}</th>						
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">판례 제목:</td>
						<td colspan="2">${vo.title}</td>
					</tr>
					<tr>
						<td style="width: 20%;">판례 등록일:</td>
						<td colspan="2">${vo.regdate}</td>
					</tr>
					<tr>
						<td>판례 발생일:</td>
						<td colspan="2">${vo.hapdate}</td>
					</tr>
					<tr>
						<td>판례 내용</td>
						<td colspan="2"> ${fn:replace(vo.content, replaceChar, "<br/>")}</td>
					</tr>
					<tr>
						<td>관련 규정</td>
						<td colspan="2">${vo.relrule}</td>
					</tr>
				</tbody>
			</table>
					
		</div>
	</div>

	<button type="button" class="btn btn-primary">
	<a href="${param.target == null ? 'list' : 'search_list' }?pno=${param.pno}" style="text-decoration:none">목록</a>
		</button>
	<button type="button" class="btn btn-primary">	
	<a href="update_form?no=${vo.no}&pno=${param.pno}" style="text-decoration:none">수정</a>
	</button>
	<button type="button" class="btn btn-primary">
	<a id="del_link" href="delete_action?no=${vo.no}&pno=${param.pno}" style="text-decoration:none">삭제</a>
	</button>

	
	

	
	
		
		
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>