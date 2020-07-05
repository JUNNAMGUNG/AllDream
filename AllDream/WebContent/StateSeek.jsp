<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import=" java.util.Vector"%>
<%
	String uStateTitle=request.getParameter("StateTitle");

	Class.forName("com.mysql.jdbc.Driver");

	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/alldream", "root", "1111");
	
	Statement st=conn.createStatement();

	//String sql="INSERT INTO end_time(id) VALUES(";
	//sql+="'"+uid2+"'";
	//sql+=")";
	//st.executeUpdate(sql);
	//String stl="SELECT StateList FROM state WHERE StateList like '";
	//stl+=uStateList+"%'";
	
	//st.executeUpdate(stl);
	

	String sql="SELECT StateTitle FROM state WHERE StateTitle like '";
	sql+=uStateTitle+"%'";
	
	ResultSet rs=st.executeQuery(sql);
	
	/*
	String str="<table border=1>";
	while(rs.next()){
		str+="<tr>";
		str+="<td>"+rs.getString("StateTitle")+"</td>";
		//str+="<td><a href='userDelete.jsp?id="+rs.getString("id")+"'><button>삭제</button></a></td>";
		str+="</tr>";
	}
	str +="</table>";
	out.print(str);
	*/
%>
<form method="get" action="SelectServlet">
	<select name="city">
		<option value="">:::선택:::</option>
		<%
		while(rs.next()){
			String deptNo=rs.getString("StateTitle");
		%>
			<option value="<%=deptNo%>"><%=deptNo%></option>
		<%
		}
		%>
	</select>
	<input type="submit" value="ok">
</form>