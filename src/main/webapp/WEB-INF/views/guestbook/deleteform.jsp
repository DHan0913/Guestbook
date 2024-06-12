<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>삭제</title>
</head>
<body>
    <form method="post" action="<%= request.getContextPath() %>/guestbook/delete.jsp">
        <input type="hidden" name="no" value="<%= request.getParameter("no") %>">
        <input type="hidden" name="a" value="insert">
        <table>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="pass"></td>
                <td><input type="submit" value="삭제"></td>
                <td><a href="list.jsp">목록</a></td>
            </tr>
        </table>
    </form>
</body>
</html>
