<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="core.*"%>
<% 
	request.setCharacterEncoding("UTF-8");

	String uid = request.getParameter("id");
	String upass = request.getParameter("ps");
	String uname = request.getParameter("name");
	
	UserDAO dao = new UserDAO();
	String code = dao.signup(uid, upass, uname);

	out.print(code);
%>