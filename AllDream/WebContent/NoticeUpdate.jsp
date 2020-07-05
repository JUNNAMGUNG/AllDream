<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>
<%@page import="java.util.*"%>

<%
	String no = request.getParameter("no");
	String NoticeTitle = request.getParameter("NoticeTitle");
	String NoticeDesc = request.getParameter("NoticeDesc");
		
	Class.forName("com.mysql.jdbc.Driver");

	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/alldream", "root", "1111");
	
    Statement stmt = conn.createStatement();
    
	String sql = "UPDATE notice SET NoticeTitle = '" + NoticeTitle + "', NoticeDesc = '" + NoticeDesc + "' WHERE no = " + no;

	int cnt = stmt.executeUpdate(sql);

	String res=(cnt == 1) ? "공지사항 수정이 완료됐습니다." : "공지사항 수정이 실패했습니다.";
	if(cnt == 1){
		response.sendRedirect("NoticeList.jsp");
	}else{
		response.sendRedirect("NoticeList.jsp");
	}

	stmt.close();
	conn.close();
%>
	
	
    