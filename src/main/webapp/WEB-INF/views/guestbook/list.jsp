<%@ page import="java.util.List"%>
<%@ page import="himedia.vo.GuestBookVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<GuestBookVo> list = null;
if (request.getAttribute("list") instanceof List) {
	list = (List<GuestBookVo>) request.getAttribute("list");
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
	<form action="<%=request.getContextPath()%>/gb" method="post">
		<input type="hidden" name="a" value="add">
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
			<td><a
				href="<%=request.getContextPath()%>/gb?a=deleteform&no=<%=vo.getNo()%>">삭제</a></td>
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
