<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>판 례 목 록</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<style type="text/css">
	
	</style>
  </head>
  <body>


		
		<div class="col-md-10; row text-center" style="width: 100%; float:none; margin:0 auto">
	    <h1>판 례 목 록</h1>
		<p>저장갯수: ${ judge_count }</p>
		<table class="table">
		  <tr>
		    <th class="col-md-2 col-sm-2 col-xs-2">번호</th>
		    <th>제목</th>
		    <th>작성일</th>
		  </tr>
		  <c:forEach items="${judge_list}" var="judge" varStatus="st">
		  <tr>
		    <td>${judge.no}</td>
		    <td><a href="detail?no=${judge.no}&pno=${param.pno}" style="text-decoration:none" >${judge.title}</a></td>
		    <td>${judge.regdate}</td>
		  </tr>
		  </c:forEach>
		</table>
		
		
		 <header class="navbar navbar-expand-sm bg-light justify-content-center">
		<nav>
		  <ul class="pagination">
  			<c:if test="${ pageNavi[0] != 1 }">
		    <li class="page-item">
		      <a class="page-link" href="list?pno=${pageNavi[0]-1}" aria-label="Previous">
		        이전
		      </a>
		    </li>
			</c:if>
			
    		<c:forEach items="${pageNavi}" var="pageNo">
			    <li class="page-item ${ (param.pno == pageNo)?'active' : ''  }">
			    	<a class="page-link" href="list?pno=${pageNo}">${pageNo}</a>
			    </li>
			</c:forEach>
			
		    <li  class="page-item">
	    		<c:if test="${ pageNavi[pageNavi.size()-1] < pageNavigator.maxPage  }">
			      <a  class="page-link" href="list?pno=${pageNavi[pageNavi.size()-1] + 1}" aria-label="Next">
			        다음
			      </a>
				</c:if>
		    </li>
		  </ul>
		</nav>
		</div>
		
			<div id="search">
			<form action="search" class="form-inline">
				<div class="form-group">
				<label for="search_target">검색대상 </label>
					<select name="target" id="search_target">
						<option value="title">제 목</option>
						<option value="content">내 용</option>
					</select>
				</div>
				<div class="float-start">
				<label for="word"> 검색어 </label>
					 <input name="word" id="word">
				<input type="submit" value="검 색">
				</div><br>
			</form>
		</div>			
		
				<div class="float-end">
				<button type="button" class="btn btn-dark">
					<a href="insert_form" style="text-decoration:none">글 등 록</a>
				</button>
				</div><br>
		
				
	</div><!-- end .container -->




  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  </body>
</html>





