<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="core.*"%>
<% 
	request.setCharacterEncoding("UTF-8");

	String sid = (String)session.getAttribute("uid");
	if(sid != null){
		out.print("EX");
		return;
	}

	String uid = request.getParameter("id");
	String upass = request.getParameter("ps");
	
	UserDAO dao = new UserDAO();
	String code = dao.login(uid, upass);
	
	if(code != "NA" && code != "PS"){
		session.setAttribute("usrobj", code);
		session.setAttribute("userID", uid);
	}
	out.print(code);
%>