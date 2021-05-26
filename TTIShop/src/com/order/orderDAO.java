package com.order;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class orderDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt = 0;
	orderDTO ginfo = null;
	orderDTO info = null;

	public void conn() { // DB 연결
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
			String db_id = "hr";
			String db_pw = "hr";

			conn = DriverManager.getConnection(db_url, db_id, db_pw);
		} catch (Exception e) {
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
			e.printStackTrace();
		}
	}
	

	public int delete(int o_num) { // 구매 취소 
		conn();
		try {
			String sql = "DELETE FROM shop_order WHERE o_num=?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, o_num);
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;

	}
	
	public int insert(orderDTO odto) { // 상품 구매
		conn();
		try {
			String sql = "INSERT INTO shop_order VALUES(shop_order_num_seq.NEXTVAL, ?, ?, ?, ?, ?, to_char(sysdate, 'YYYY/MM/DD AM HH:MI'), ?, ?)";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, odto.getO_address());
			psmt.setString(2, odto.getO_name());
			psmt.setString(3, odto.getO_phone());
			psmt.setInt(4, odto.getG_num());
			psmt.setString(5, odto.getO_way());
			psmt.setInt(6, odto.getM_num());
			psmt.setInt(7, odto.getO_count());
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;

	}

	
	/*구매한 상품 목록 표시*/
	public ArrayList<orderDTO> select_order(int num) {

		conn();
		ArrayList<orderDTO> cart_list = new ArrayList<orderDTO>();

		try {

			String sql = "SELECT o.*, g.g_price, g.g_name, g.g_img_path FROM shop_goods g, shop_member m, shop_order o WHERE o.m_num=m.m_num AND o.g_num=g.g_num AND m.m_num=? order by o_num desc";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			rs = psmt.executeQuery();
			while (rs.next()) {
				int o_num = rs.getInt(1);
				String o_address = rs.getString(2);
				String o_name = rs.getString(3);
				String o_phone = rs.getString(4);
				int g_num = rs.getInt(5);
				String o_way = rs.getString(6);
				String o_date = rs.getString(7);
				int m_num = rs.getInt(8);
				int o_count = rs.getInt(9);
				int g_price = rs.getInt(10);
				String g_name = rs.getString(11);
				String g_img_path = rs.getString(12);

				info = new orderDTO(o_num, o_address, o_name, o_phone, g_num, o_way, o_date, m_num, o_count, g_price, g_name,g_img_path);

				cart_list.add(info);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return cart_list;
	}

}
