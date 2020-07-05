<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%
	String uNoticeTitle=request.getParameter("NoticeTitle");
	String uNoticeDesc=request.getParameter("NoticeDesc");

	Class.forName("com.mysql.jdbc.Driver");

	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/alldream", "root", "1111");
	
	Statement st=conn.createStatement();
	
	///Duplication check using SELECT
	//String sql="SELECT id FROM user WHERE id='"+uid+"'";
	//ResultSet rs=st.executeQuery(sql);
		String sql="INSERT INTO notice(NoticeTitle,NoticeDesc) VALUES(";
		sql +="'"+uNoticeTitle+"',";
		sql +="'"+uNoticeDesc+"'";
		sql +=")";
		
		int cnt=st.executeUpdate(sql);

		//String stl="UPDATE notice SET notice.no=@COUNT:=@COUNT+1";
		//int cnt2=st.executeUpdate(stl);
		
		String res=(cnt == 1) ? "공지사항 작성이 완료됐습니다." : "공지사항 작성이 실패했습니다.";
		if(cnt == 1){
			response.sendRedirect("NoticeList.jsp");
		}else{
			response.sendRedirect("NoticeWrite.jsp");
		}
%>