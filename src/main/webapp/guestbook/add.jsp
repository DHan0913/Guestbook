<!-- add.jsp -->
<%@ page import="himedia.dao.GuestBookDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Date" %>
<%
    String name = request.getParameter("name");
    String password = request.getParameter("pass");
    String content = request.getParameter("content");

    GuestBookDao dao = new GuestBookDao();
    try {
        dao.insert(name, password, content);
        response.sendRedirect("list.jsp");
    } catch (SQLException e) {
        out.println("데이터 입력 중 오류가 발생했습니다.");
        e.printStackTrace();
    }
%>
