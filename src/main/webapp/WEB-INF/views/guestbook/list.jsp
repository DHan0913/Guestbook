﻿<%@ page import="java.util.List"%>
<%@ page import="himedia.vo.GuestBookVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//	Servlet으로부터 전달한 list 객체 얻어오기
List<GuestBookVo> list = null;
if (request.getAttribute("list") instanceof List) {	//	전달 받은 list가 List인지 확인
	list = (List<GuestBookVo>)request.getAttribute("list");	//	다운 캐스팅
}
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록</title>
</head>
<body>


	<!-- 방명록 추가 폼 -->
	<h1>작성</h1>
	<form action="<%=request.getContextPath() %>/guestbook/add.jsp" method="post">
		<table border="1" width="500">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
				<td>비밀번호</td>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td colspan="4"><textarea name="content" cols="60" rows="5"></textarea></td>
			</tr>
			<tr>
				<td colspan="4" align="right"><input type="submit" value="확인"></td>
			</tr>
		</table>
	</form>
	<br />

	<h1>방명록</h1>
	<%
	int i = 0;
	for (GuestBookVo vo : list) {
		i = i + 1;
	%>
	<table width="510" border="1">
		<tr>
			<td>[<%=i%>]
			</td>
			<td><%=vo.getName()%></td>
			<td><%=vo.getRegDate()%></td>
			<td><a href="deleteform.jsp?no=<%=vo.getNo()%>">삭제</a></td>
		</tr>
		<tr>
			<td colspan="4"><%=vo.getContent()%></td>
		</tr>
	</table>
	<br />
	<%
	}
	%>

</body>
</html>
