<!-- delete.jsp -->
<%@ page import="himedia.dao.GuestBookDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.SQLException" %>
<%
	ServletContext context = getServletContext();

	String dbuser = context.getInitParameter("dbuser");
	String dbpass = context.getInitParameter("dbpass");
	
    int no = Integer.parseInt(request.getParameter("no"));
    String password = request.getParameter("pass");

    GuestBookDao dao = new GuestBookDao(dbuser, dbpass);
    try {
        boolean deleted = dao.delete(no, password);
        if (deleted) {
            out.println("방명록이 성공적으로 삭제되었습니다.");
            response.sendRedirect("list.jsp");
        } else {
            out.println("비밀번호가 일치하지 않거나 방명록을 찾을 수 없습니다.");
        }
    } catch (SQLException e) {
        out.println("방명록 삭제 중 오류가 발생했습니다.");
        e.printStackTrace();
    }
%>
