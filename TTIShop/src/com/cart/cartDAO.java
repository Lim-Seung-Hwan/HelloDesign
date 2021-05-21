package com.cart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.member.memberDTO;


public class cartDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt = 0;
	cartDTO info = null;

	public void conn() { // DB 연결
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
			String db_id = "hr";
			String db_pw = "hr";

			conn = DriverManager.getConnection(db_url, db_id, db_pw);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void close() { // DB 닫기
		try {
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
			if (rs != null)
				rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public cartDTO check(cartDTO dto) {
		conn();
		
		String sql = "SELECT * FROM shop_cart WHERE m_num = ? AND g_num = ?";
		cartDTO alreadydto = null; 
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getM_num());
			psmt.setInt(2, dto.getG_num());
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				int m_num = rs.getInt(1);
				int g_num = rs.getInt(2);
				int g_count =  rs.getInt(3);
				
				alreadydto = new cartDTO(m_num, g_num, g_count);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return alreadydto;
	}
	
	public int update(cartDTO dto) {
		conn();
		try {
			
			
			String sql = "UPDATE shop_cart SET g_count=? WHERE m_num=? and g_num=?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getC_count());
			psmt.setInt(2, dto.getM_num());
			psmt.setInt(3, dto.getG_num());
			cnt = psmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		return cnt;
	}
	
	public int insert(cartDTO dto) { // 상품 등록
		cartDTO check = check(dto);
		conn();
		if(check==null) {
			try {
				String sql = "INSERT INTO shop_cart VALUES(?, ?, ?)";
	
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, dto.getM_num());
				psmt.setInt(2, dto.getG_num());
				psmt.setInt(3, dto.getC_count());
				cnt = psmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close();
			}
		} else {
			check.setC_count(check.getC_count()+dto.getC_count());
			update(check);
		}
		return cnt;

	}
	public int delete(cartDTO dto) { // 상품 등록
		conn();
		try {
			String sql = "DELETE FROM shop_cart WHERE m_num=? AND g_num=?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getM_num());
			psmt.setInt(2, dto.getG_num());
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;

	}
	public int drop(int mnum) { // 상품 등록
		conn();
		try {
			String sql = "DELETE FROM shop_cart WHERE m_num=?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, mnum);
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;

	}


	
	/*상품 목록 표시*/
	public ArrayList<cartDTO> select_cart(int num) {

		conn();
		ArrayList<cartDTO> cart_list = new ArrayList<cartDTO>();

		try {

			String sql = "SELECT g.g_name, g.g_price, g.g_img_path, c.g_count, g.g_num FROM shop_goods g, shop_member m, shop_cart c WHERE c.m_num=m.m_num AND c.g_num=g.g_num AND m.m_num=?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			rs = psmt.executeQuery();
			while (rs.next()) {
				String name = rs.getString(1);
				int price = rs.getInt(2);
				String imgpath = rs.getString(3);
				int count = rs.getInt(4);
				int g_num = rs.getInt(5);

				info = new cartDTO(name, price, imgpath, count, g_num);

				cart_list.add(info);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

		return cart_list;
	}
}
