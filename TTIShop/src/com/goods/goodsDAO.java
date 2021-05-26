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
	goodsDTO ginfo = null;
	goodsDTO gdto = null;

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
 
			e.printStackTrace();
		} finally {
			close();
		}

		return cnt;
	}
	
	public goodsDTO details(int number) { // 선택한 goods의 모든 정보를 db에서 가져옴
		conn();

		String sql = "SELECT * FROM shop_goods WHERE g_num = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, number);

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
 
			e.printStackTrace();
		} finally {
			close();
		}
		return gdto;
	}

	
	/*상품 목록 표시*/
	//돗자리 정보 가져오기
	public ArrayList<goodsDTO> select_mat() {

		conn();

		ArrayList<goodsDTO> mat_list = new ArrayList<goodsDTO>();

		try {

			String sql = "SELECT g_num, g_price, g_name, g_img_path, g_tag FROM shop_goods WHERE g_category='mat'";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int num = rs.getInt(1);
				int price = rs.getInt(2);
				String name = rs.getString(3);
				String img_path = rs.getString(4);
				String tag = rs.getString(5);

				ginfo = new goodsDTO(num, price, name, img_path, tag, "mat");

				mat_list.add(ginfo);
				System.out.println(ginfo);
			}

		} catch (SQLException e) {
 
			e.printStackTrace();
		} finally {
			close();
		}

		return mat_list;
	}
	
	//돗자리 정보 가져오기(태그)
		public ArrayList<goodsDTO> pattern_mat(String i_tag) {

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

					ginfo = new goodsDTO(num, price, name, img_path, tag, "mat");

					mat_list.add(ginfo);
					System.out.println(ginfo);
				}

			} catch (SQLException e) {
	 
				e.printStackTrace();
			} finally {
				close();
			}

			return mat_list;
		}


	// 에코백 정보 가져오기
	public ArrayList<goodsDTO> select_eco() {

		conn();

		ArrayList<goodsDTO> eco_list = new ArrayList<goodsDTO>();

		try {

			String sql = "SELECT g_num, g_price, g_name, g_img_path, g_tag FROM shop_goods WHERE g_category='eco'";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int num = rs.getInt(1);
				int price = rs.getInt(2);
				String name = rs.getString(3);
				String img_path = rs.getString(4);
				String tag = rs.getString(5);

				ginfo = new goodsDTO(num, price, name, img_path, tag, "eco");

				eco_list.add(ginfo);
				System.out.println(ginfo);
			}

		} catch (SQLException e) {
 
			e.printStackTrace();
		} finally {
			close();
		}

		return eco_list;
	}
	
	// 에코백 정보 가져오기(태그)
		public ArrayList<goodsDTO> pattern_eco(String i_tag) {

			conn();

			ArrayList<goodsDTO> eco_list = new ArrayList<goodsDTO>();

			try {

				String sql = "SELECT g_num, g_price, g_name, g_img_path, g_tag FROM shop_goods WHERE g_category='eco' AND g_tag=?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, i_tag);
				rs = psmt.executeQuery();

				while (rs.next()) {
					int num = rs.getInt(1);
					int price = rs.getInt(2);
					String name = rs.getString(3);
					String img_path = rs.getString(4);
					String tag = rs.getString(5);

					ginfo = new goodsDTO(num, price, name, img_path, tag, "eco");

					eco_list.add(ginfo);
					System.out.println(ginfo);
				}

			} catch (SQLException e) {
	 
				e.printStackTrace();
			} finally {
				close();
			}

			return eco_list;
		}


	// 앞치마 정보 가져오기
	public ArrayList<goodsDTO> select_apron() {

		conn();

		ArrayList<goodsDTO> apron_list = new ArrayList<goodsDTO>();

		try {

			String sql = "SELECT g_num, g_price, g_name, g_img_path, g_tag FROM shop_goods WHERE g_category='apron'";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int num = rs.getInt(1);
				int price = rs.getInt(2);
				String name = rs.getString(3);
				String img_path = rs.getString(4);
				String tag = rs.getString(5);

				ginfo = new goodsDTO(num, price, name, img_path, tag, "apron");

				apron_list.add(ginfo);
				System.out.println(ginfo);
			}

		} catch (SQLException e) {
 
			e.printStackTrace();
		} finally {
			close();
		}

		return apron_list;
	}
	
	// 앞치마 정보 가져오기(태그)
		public ArrayList<goodsDTO> pattern_apron(String i_tag) {

			conn();

			ArrayList<goodsDTO> apron_list = new ArrayList<goodsDTO>();

			try {

				String sql = "SELECT g_num, g_price, g_name, g_img_path, g_tag FROM shop_goods WHERE g_category='apron' AND g_tag=?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, i_tag);
				rs = psmt.executeQuery();

				while (rs.next()) {
					int num = rs.getInt(1);
					int price = rs.getInt(2);
					String name = rs.getString(3);
					String img_path = rs.getString(4);
					String tag = rs.getString(5);

					ginfo = new goodsDTO(num, price, name, img_path, tag, "apron");

					apron_list.add(ginfo);
					System.out.println(ginfo);
				}

			} catch (SQLException e) {
	 
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

					ginfo = new goodsDTO(num, price, name, img_path, tag, "chair");

					chair_list.add(ginfo);
					System.out.println(ginfo);
				}

			} catch (SQLException e) {
	 
				e.printStackTrace();
			} finally {
				close();
			}

			return chair_list;
		}
		// 의자 정보 가져오기(테그)
		public ArrayList<goodsDTO> pattern_chair(String i_tag) {

			conn();

			ArrayList<goodsDTO> chair_list = new ArrayList<goodsDTO>();

			try {

				String sql = "SELECT g_num, g_price, g_name, g_img_path, g_tag FROM shop_goods WHERE g_category='chair' AND g_tag=?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, i_tag);
				rs = psmt.executeQuery();

				while (rs.next()) {
					int num = rs.getInt(1);
					int price = rs.getInt(2);
					String name = rs.getString(3);
					String img_path = rs.getString(4);
					String tag = rs.getString(5);

					ginfo = new goodsDTO(num, price, name, img_path, tag, "chair");

					chair_list.add(ginfo);
					System.out.println(ginfo);
				}

			} catch (SQLException e) {
	 
				e.printStackTrace();
			} finally {
				close();
			}

			return chair_list;
		}
		public ArrayList<goodsDTO> select_mug() {

			conn();

			ArrayList<goodsDTO> mug_list = new ArrayList<goodsDTO>();

			try {

				String sql = "SELECT g_num, g_price, g_name, g_img_path, g_tag FROM shop_goods WHERE g_category='mug'";
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();

				while (rs.next()) {
					int num = rs.getInt(1);
					int price = rs.getInt(2);
					String name = rs.getString(3);
					String img_path = rs.getString(4);
					String tag = rs.getString(5);

					ginfo = new goodsDTO(num, price, name, img_path, tag, "mug");

					mug_list.add(ginfo);
					System.out.println(ginfo);
				}

			} catch (SQLException e) {
	 
				e.printStackTrace();
			} finally {
				close();
			}

			return mug_list;
		}
		// 의자 정보 가져오기(테그)
		public ArrayList<goodsDTO> pattern_mug(String i_tag) {

			conn();

			ArrayList<goodsDTO> mug_list = new ArrayList<goodsDTO>();

			try {

				String sql = "SELECT g_num, g_price, g_name, g_img_path, g_tag FROM shop_goods WHERE g_category='mug' AND g_tag=?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, i_tag);
				rs = psmt.executeQuery();

				while (rs.next()) {
					int num = rs.getInt(1);
					int price = rs.getInt(2);
					String name = rs.getString(3);
					String img_path = rs.getString(4);
					String tag = rs.getString(5);

					ginfo = new goodsDTO(num, price, name, img_path, tag, "mug");

					mug_list.add(ginfo);
					System.out.println(ginfo);
				}

			} catch (SQLException e) {
	 
				e.printStackTrace();
			} finally {
				close();
			}

			return mug_list;
		}

}
