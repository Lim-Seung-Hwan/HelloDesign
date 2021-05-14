package com.goods;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class goodsDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt = 0;
	goodsDTO info = null;

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

	public int insert(goodsDTO gdto) { // 상품 등록
		conn();
		try {
			String sql = "INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, ?, ?, ?, ?, ?, ?)";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, gdto.getPrice());
			psmt.setString(2, gdto.getName());
			psmt.setString(3, gdto.getInfo());
			psmt.setString(4, gdto.getImg_path());
			psmt.setString(5, gdto.getTag());
			psmt.setString(6, gdto.getCategory());
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;

	}

	public int update(goodsDTO dto) { // 상품정보 갱신
		conn();
		try {

			String sql = "UPDATE shop_goods SET g_price=?, g_name=?, g_info=?, g_img_path=?, g_tag=?, g_category=? WHERE g_num=?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getPrice());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getInfo());
			psmt.setString(4, dto.getImg_path());
			psmt.setString(5, dto.getTag());
			psmt.setString(6, dto.getCategory());
			psmt.setInt(7, dto.getNum());
			cnt = psmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

		return cnt;
	}
	
	public goodsDTO details(goodsDTO dto) { // 상품 상세정보
		conn();

		String sql = "SELECT * FROM shop_goods WHERE g_num = ?";
		goodsDTO gdto = null;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getNum());

			rs = psmt.executeQuery();

			if (rs.next()) {
				int num = rs.getInt(1);
				int price = rs.getInt(2);
				String name = rs.getString(3);
				String info = rs.getString(4);
				String img_path = rs.getString(5);
				String tag = rs.getString(6);
				String category = rs.getString(7);

				gdto = new goodsDTO(num, price, name, info, img_path, tag, category);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return gdto;
	}

	
	/*상품 목록 표시*/
	//돗자리 정보 가져오기
	public ArrayList<goodsDTO> select_mat(String i_tag) {

		conn();

		ArrayList<goodsDTO> mat_list = new ArrayList<goodsDTO>();

		try {

			String sql = "SELECT g_num, g_price, g_name, g_img_path, g_tag FROM shop_goods WHERE g_category='mat' AND g_tag=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, i_tag);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int num = rs.getInt(1);
				int price = rs.getInt(2);
				String name = rs.getString(3);
				String img_path = rs.getString(4);
				String tag = rs.getString(5);

				info = new goodsDTO(num, price, name, img_path, tag, "mat");

				mat_list.add(info);
				System.out.println(info);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

		return mat_list;
	}

	
	// 에코백 정보 가져오기
		public ArrayList<goodsDTO> select_eco(String i_tag) {

			conn();

			ArrayList<goodsDTO> eco_list = new ArrayList<goodsDTO>();

			try {

				String sql = "SELECT g_num, g_price, g_name, g_img_path, g_tag FROM shop_goods WHERE g_category='eco'AND g_tag=?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, i_tag);
				rs = psmt.executeQuery();

				while (rs.next()) {
					int num = rs.getInt(1);
					int price = rs.getInt(2);
					String name = rs.getString(3);
					String img_path = rs.getString(4);
					String tag = rs.getString(5);

					info = new goodsDTO(num, price, name, img_path, tag, "eco");

					eco_list.add(info);
					System.out.println(info);
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close();
			}

			return eco_list;
		}


	// 앞치마 정보 가져오기
	public ArrayList<goodsDTO> select_apron(String i_tag) {

		conn();

		ArrayList<goodsDTO> apron_list = new ArrayList<goodsDTO>();

		try {

			String sql = "SELECT g_num, g_price, g_name, g_img_path, g_tag FROM shop_goods WHERE g_category='apron'AND g_tag=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, i_tag);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int num = rs.getInt(1);
				int price = rs.getInt(2);
				String name = rs.getString(3);
				String img_path = rs.getString(4);
				String tag = rs.getString(5);

				info = new goodsDTO(num, price, name, img_path, tag, "apron");

				apron_list.add(info);
				System.out.println(info);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

		return apron_list;
	}

	// 의자 정보 가져오기(전부)
	public ArrayList<goodsDTO> select_chair() {

		conn();

		ArrayList<goodsDTO> chair_list = new ArrayList<goodsDTO>();

		try {

			String sql = "SELECT g_num, g_price, g_name, g_img_path, g_tag FROM shop_goods WHERE g_category='chair'";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int num = rs.getInt(1);
				int price = rs.getInt(2);
				String name = rs.getString(3);
				String img_path = rs.getString(4);
				String tag = rs.getString(5);

				info = new goodsDTO(num, price, name, img_path, tag, "chair");

				chair_list.add(info);
				System.out.println(info);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

		return chair_list;
	}
	// 의자 정보 가져오기
	public ArrayList<goodsDTO> select_chair(String i_tag) {

		conn();

		ArrayList<goodsDTO> chair_list = new ArrayList<goodsDTO>();

		try {

			String sql = "SELECT g_num, g_price, g_name, g_img_path, g_tag FROM shop_goods WHERE g_category='chair'AND g_tag=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, i_tag);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int num = rs.getInt(1);
				int price = rs.getInt(2);
				String name = rs.getString(3);
				String img_path = rs.getString(4);
				String tag = rs.getString(5);

				info = new goodsDTO(num, price, name, img_path, tag, "chair");

				chair_list.add(info);
				System.out.println(info);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

		return chair_list;
	}

}
