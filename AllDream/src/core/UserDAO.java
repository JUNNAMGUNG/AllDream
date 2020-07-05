package core;

import java.sql.*;

import org.json.simple.JSONObject;

import util.*;

public class UserDAO {
	public String login(String uid, String upass) throws Exception{

		Connection conn = ConnectionPool.getInstance().getConn();

		String sql = "SELECT userID, userName, userPassword FROM user WHERE userID = ?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, uid);
		
		ResultSet rs = st.executeQuery();
		
		String code = "OK";
		if(!rs.next())
		{
			code = "NA";//out.print("");
		}else if(!rs.getString("userPassword").equals(upass)){
				code = "PS";//out.print("패스워드가 일치하지 않는다.");
		}else{
			JSONObject jsonobj = new JSONObject();
			jsonobj.put("userID", rs.getString("userID"));
			jsonobj.put("userName", rs.getString("userName"));
			code = jsonobj.toJSONString();
		}
		rs.close();
		st.close();
		conn.close();
		
		return code;
	}
	
	public String signup(String uid, String upass, String uname) throws Exception{
		String code = "";
		
		if(signupconfirm(uid) == "OK"){
			Connection conn = ConnectionPool.getInstance().getConn();
			
			String sql = "INSERT INTO user (userID, userPassword, userName) VALUES (?,?,?)";
			PreparedStatement st = conn.prepareStatement(sql);
			st.setString(1, uid);
			st.setString(2, upass);
			st.setString(3, uname);
			st.executeUpdate();

			st.close();
			conn.close();
			
			code = "OK";//out.print("");
		}else if(signupconfirm(uid) == "EX"){
			code = "EX";//out.print("");
		}else{
			code = "ER";//out.print("");
		}
		
		return code;
	}
	
	public String signupconfirm(String uid) throws Exception{

		Connection conn = ConnectionPool.getInstance().getConn();
		
		String sql = "SELECT userID, userPassword FROM user WHERE userID = ?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, uid);
		
		ResultSet rs = st.executeQuery();
		
		String code = "EX";
		if(!rs.next()){
			code = "OK";//out.print("");
		}
		
		rs.close();
		st.close();
		conn.close();
		
		return code;
	}
	
	/*// 서버시간
	public String getDate() { 
		String SQL = "SELECT NOW()";
		try {
			Connection conn = ConnectionPool.getInstance().getConn();;
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; //""

	}*/
}
