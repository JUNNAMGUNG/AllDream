<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>
 
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/custom.css">
	<link rel="stylesheet" href="css/comp.css">
	<title>모두드림</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script>
		var userID = "${userID }";
	</script>
</head>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
			data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>			
			</button>
		
			<a class="navbar-brand" href="index.jsp">모두드림</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="index.jsp">메인</a></li>
				<li><a href="jusoPopup.jsp">지역설정</a></li>
				<li class="active"><a href="NoticeList.jsp">공지사항</a></li>
				<li><a href="CompList.html">기관리스트</a></li>
				<li><a href="find.jsp">친구찾기</a></li>
				<li><a href="messageBox.jsp" class="count_unread">메시지함 <strong style="color:red;"></strong></a></li>		
			</ul>	
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#none" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="modifyAction?userIDforMod=${userID }">회원정보 수정</a></li>
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>
			</ul>		
			
		</div>
	</nav>
	<%
		String userID = null;
	//사용자 접속유무 확인
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
	%>
<%
	Class.forName("com.mysql.jdbc.Driver");

	String uno=request.getParameter("no");
	
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/alldream", "root", "1111");
	
	Statement st=conn.createStatement();
	
	String str="<div  class='container'><table class='table table-bordered table-hover' style='text-align:center;border:1px solid #ddd'>";
	String sql= "SELECT no, NoticeTitle, NoticeDesc, ts FROM notice WHERE no = " + uno;
	ResultSet rs=st.executeQuery(sql);
		str+="<thead>";
		str+="<tr>";
		str+="<th colspan='6'><h4>공지사항상세보기</h4></th>";
		str+="</tr>";
		str+="</thead>";
	while(rs.next()){
		str+="<tr>";
		str+="<td>"+rs.getString("no")+"</td>";
		str+="<td>"+rs.getString("NoticeTitle")+"</td>";
		str+="<td>"+rs.getString("NoticeDesc")+"</td>";
		str+="<td>"+rs.getString("ts")+"</td>";

		if(userID.equals("admin")){
			str+="<td><a href='NoticeDelete.jsp?no="+rs.getString("no");
			str+="'><button>삭제</button></a></td>";	
			str+="<td><a href='NoticeUpdate_pre.jsp?no="+rs.getString("no");
			str+="'><button>수정</button></a></td>";	
			str+="</tr>";
		}else{
			str+="</tr>";
		}
	}
	str +="</table></div>";


	out.print(str);
	
	rs.close();
	st.close();
	conn.close();
%>