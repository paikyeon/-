<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>판 례 목 록</title>

    <!-- 부트스트랩 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<style type="text/css">
	
	</style>
  </head>
  <body>
  
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">E-스포츠 심판 업무보조용 웹사이트 상단 바</a>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
			
	
 					
	<div class="col-md-10; row text-center" style="width: 100%; float:none; margin:0 auto">
	<meta charset="UTF-8">
	<title>판 례 검 색 목 록</title>
	<style type="text/css">
	a { text-decoration: none; }
	a:hover { text-decoration: underline; }
	</style>
</head>
<body>
	<h1>판 례 검 색 목 록</h1>
	<hr>
	저장갯수: ${ judge_count }
	<h2>목록</h2>
	<table class="table" border="1">
	  <tr>
	    <th>번호</th>
	    <th>제목</th>
	    <th>작성일</th>
	  </tr>
	  <c:forEach items="${judge_list}" var="judge">
	  <tr>
	    <td>${judge.no}</td>
	    <td><a href="detail?no=${judge.no}&pno=${param.pno == null ? 1 : param.pno}">${judge.title}</a></td>
		<td>${judge.regdate}</td>
	  </tr>
	  </c:forEach>
	  
	</table>
	
	<hr>
	 <header class="navbar navbar-expand-sm bg-light justify-content-center">
		<nav>
		<ul class="pagination">
  		
		<c:if test="${ pageNavi[0] != 1 }">
		 <li class="page-item">	
			 <a class="page-link" href="search?pno=${pageNavi[0]-1}&target=${param.target}&word=${param.word}">이전</a>
		</li>
		</c:if>
  			
			
    			<c:forEach items="${pageNavi}" var="pageNo">
			 <li class="page-item ${ (param.pno == pageNo)?'active' : ''  }">
			 <a class="page-link" href="search?pno=${pageNo}&target=${param.target}&word=${param.word}">${pageNo}</a> 
			</li>
		</c:forEach>
		
			
		  <c:if test="${ pageNavi[pageNavi.size()-1] < pageNavigator.maxPage  }">
			 <li class="page-item ${ (param.pno == pageNo)?'active' : ''  }">
			<a class="page-link" href="search?pno=${pageNavi[pageNavi.size()-1] + 1}&target=${param.target}&word=${param.word}">다음</a>
			    </li>
			</li>
		</c:if>
		  </ul>
		</nav>
		</div>	

	<hr>
	<div id="search">
		<form action="search">
			<label>검색대상
				<select name="target">
					<option value="title">제 목</option>
					<option value="judge"  ${param.target=='judge' ? "selected" : ""} >내 용</option>
				</select>
			</label>
			<label>
				검색어 <input name="word" value="${param.word}">
			</label>	
			<input type="submit" value="검 색">
		</form>
	</div>
	
				<div class="float-end">
				<button type="button" class="btn btn-dark">
					<a href="list">판 례 목 록</a>
				</button>
				</div>
	
</body>
</html>


