package com.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class memberDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt = 0;
	memberDTO info = null;
	

	public void conn() { //DB 연결
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
			String db_id = "hr";
			String db_pw = "hr";

			conn = DriverManager.getConnection(db_url, db_id, db_pw);
		} catch (Exception e) {
		}

	}

	public void close() { //DB 닫기
		try {
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
			if (rs != null)
				rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public int join(memberDTO mdto) { //가입
		conn();
		try {
			String sql = "INSERT INTO shop_member VALUES(shop_member_num_seq.NEXTVAL, ?, ?, ?, ?, ?)";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, mdto.getId());
			psmt.setString(2, mdto.getPw());
			psmt.setString(3, mdto.getName());
			psmt.setString(4, mdto.getAddress());
			psmt.setString(5, mdto.getPhone());
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;

	}
	
	public memberDTO login(memberDTO dto) { //로그인 
		conn();
		
		String sql = "SELECT * FROM shop_member WHERE m_id = ? AND m_pw = ?";
		memberDTO loginDto = null; 
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				int num = rs.getInt(1);
				String id = rs.getString(2);
				String name = rs.getString(4);
				String addr = rs.getString(5);
				String phone = rs.getString(6);
				
				loginDto = new memberDTO(num, id, name, addr, phone);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return loginDto;
	}
	
	public int update(memberDTO dto) { //정보수정
		conn();
		try {
			
			
			String sql = "UPDATE shop_member SET m_pw=?, m_name=?, m_address=?, m_phone=? WHERE m_ID=?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getPw());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getAddress());
			psmt.setString(4, dto.getPhone());
			psmt.setString(5, dto.getId());
			cnt = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return cnt;
	}
	
	
	
}
