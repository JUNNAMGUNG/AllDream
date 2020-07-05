package core;

import java.sql.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import util.*;

public class FeedDAO {
	// 글쓰기(C)
	public String insert(String uid, String feed, JSONArray images) throws Exception{

		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		
		try{
			conn = ConnectionPool.getInstance().getConn();
			
			synchronized(this){
				String sql = "SELECT AUTO_INCREMENT FROM information_schema.TABLES ";
				sql += "WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'feed'";
				st = conn.prepareStatement(sql);
				rs = st.executeQuery();
				if(!rs.next()) return "ER";
				
				int feedNo = rs.getInt(1);
				
				JSONObject jsonobj = (JSONObject)(new JSONParser()).parse(feed);
				jsonobj.put("no", feedNo);
				jsonobj.put("images", images);
				
				sql = "INSERT INTO feed(id,content) VALUES(?,?)";
				st = conn.prepareStatement(sql);
				st.setString(1, uid);
				st.setString(2, jsonobj.toJSONString());

				int cnt = st.executeUpdate();
				return (cnt == 0) ? "ER" : "OK";
			}			
		} finally{
			if(st != null) st.close();
			if(conn != null) conn.close();
		}
	
	}
	
	// 리스트(R)
	public String fetch(String uid) throws Exception{
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try{
			
			conn = ConnectionPool.getInstance().getConn();
			
			//String sql = "SELECT content FROM feed WHERE id = ? ORDER BY ts DESC LIMIT 20";
			String sql = "SELECT content FROM feed ORDER BY ts DESC LIMIT 20";
			st = conn.prepareStatement(sql);
			//st.setString(1, uid);

			String res = "[";
			int cnt = 0;
			
			rs = st.executeQuery();
			while(rs.next()){
				if(cnt++ > 0) res +=",";
				res += rs.getString("content");
			}
			res +="]";

			return res;
			
		} finally{
			if(rs != null) rs.close();
			if(conn != null) conn.close();
		}
	}
	
	// 상세보기(R)
	public String detail(String no) throws Exception{
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try{
			conn = ConnectionPool.getInstance().getConn();
			
			String sql = "SELECT content FROM feed WHERE no = ?";
			st = conn.prepareStatement(sql);

			st.setString(1, no);
			
			String Rs ="";
			rs = st.executeQuery();
			while(rs.next()){
			 Rs = rs.getString("content");
			}

			return Rs;
			
		} finally{
			if(rs != null) rs.close();
			if(conn != null) conn.close();
		}
	}
	
	// 글수정 (U)
	public String update(String feedno, String feed, JSONArray images) throws Exception{
		Connection conn = null;
		PreparedStatement st = null;
		try{

			//sql = "INSERT INTO feed(id,content) VALUES(?,?)";
			
			conn = ConnectionPool.getInstance().getConn();

			JSONObject jsonobj = (JSONObject)(new JSONParser()).parse(feed);
			jsonobj.put("images", images);
			
			String sql = "UPDATE feed SET content = ? WHERE no = ?";
			st = conn.prepareStatement(sql);
			st.setString(1, jsonobj.toJSONString());
			st.setString(2, feedno);

			int cnt = st.executeUpdate();
			return (cnt == 0) ? "ER" : "OK";
		} finally{
			if(st != null) st.close();
			if(conn != null) conn.close();
		}
	}
	
	// 글삭제 (D)
	public String delete(String no) throws Exception{
		Connection conn = null;
		PreparedStatement st = null;
		try{
			
			conn = ConnectionPool.getInstance().getConn();
			
			String sql = "DELETE FROM feed WHERE no = ?";
			st = conn.prepareStatement(sql);
			st.setString(1, no);

			int cnt = st.executeUpdate();
			return (cnt == 0) ? "ER" : "OK";
		} finally{
			if(st != null) st.close();
			if(conn != null) conn.close();
		}
	}
}
