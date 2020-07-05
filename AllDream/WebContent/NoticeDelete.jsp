<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	String uno=request.getParameter("no");

	Class.forName("com.mysql.jdbc.Driver");

	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/alldream", "root", "1111");
	
	Statement st=conn.createStatement();
	
	String sql="DELETE FROM notice WHERE no='"+uno+"'";
	int cnt=st.executeUpdate(sql);
	
	//String stl="UPDATE notice SET notice.no=@COUNT:=@COUNT+1";
	//int cnt2=st.executeUpdate(stl);
	
	String res = (cnt == 1) ? "공지 삭제가 완료됐습니다." : "공지 삭제가 실패했습니다.";
	if(cnt == 1){
		response.sendRedirect("NoticeList.jsp");
	}else{
		response.sendRedirect("NoticeList.jsp");
	}	
	
	st.close();
	conn.close();
%>