<%@ page import="java.util.List"%>
<%@ page import="himedia.dao.GuestBookDao"%>
<%@ page import="himedia.vo.GuestBookVo"%>
<%@ page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//	DB 접속 정보를 컨텍스트 파라미터로부터 받아오기
ServletContext context = getServletContext();
String dbuser = context.getInitParameter("dbuser");
String dbpass = context.getInitParameter("dbpass");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록</title>
</head>
<body>

	<%
	try {
		GuestBookDao dao = new GuestBookDao(dbuser, dbpass);
		List<GuestBookVo> list = dao.getlist();
	%>

	<!-- 방명록 추가 폼 -->
	<h1>작성</h1>
	<form action="add.jsp" method="post">
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
	} catch (SQLException e) {
	out.println("방명록 조회 중 오류가 발생했습니다.");
	e.printStackTrace();
	}
	%>

</body>
</html>
