package com.cart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.goods.goodsDTO;

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

	public int insert(cartDTO dto) { // 상품 등록
		conn();
		try {
			String sql = "INSERT INTO shop_cart VALUES(?, ?)";

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


	
	/*상품 목록 표시*/
	public ArrayList<cartDTO> select_cart(int num) {

		conn();
		ArrayList<cartDTO> cart_list = new ArrayList<cartDTO>();

		try {

			String sql = "select g.g_name, g.g_price from shop_goods g, shop_member m, shop_cart c where c.m_num=m.m_num and c.g_num=g.g_num and m.m_num=?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			rs = psmt.executeQuery();
			while (rs.next()) {
				String name = rs.getString(1);
				int price = rs.getInt(2);

				info = new cartDTO(name, price);

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
