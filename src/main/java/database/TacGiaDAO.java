package database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.cj.protocol.Resultset;

import model.TacGia;


import database.JDBCUtil;
public class TacGiaDAO implements DAOInterface<TacGia>{

	@Override
	public ArrayList<TacGia> selectAll() {
		ArrayList<TacGia> ketQua = new ArrayList <TacGia>();
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();
			
			// Bước 2: tạo ra đối tượng statement
			String sql = "SELECT * from tacgia ";
			
			PreparedStatement st = con.prepareStatement(sql);
			//st.setString(1, .getUsername());
			
			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			
			// Bước 4:
			while(rs.next()) {
				String maTacGia = rs.getString("matacgia");
				String hoVaTen = rs.getString("hovaten");
				Date ngaySinh = rs.getDate("ngaysinh");
				String tieuSu = rs.getString("tieusu");
				
				ketQua.add(new TacGia(maTacGia,hoVaTen,ngaySinh,tieuSu));
			}
			
			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ketQua;
	}

	

	@Override
	public TacGia selectById(TacGia t) {
		TacGia ketQua =null;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();
			
			// Bước 2: tạo ra đối tượng statement
			String sql = "SELECT * from tacgia "+
							"WHERE matacgia=?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getMaTacGia());
			
			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			
			// Bước 4:
			while(rs.next()) {
				String maTacGia = rs.getString("matacgia");
				String hoVaTen = rs.getString("hovaten");
				Date ngaySinh = rs.getDate("ngaysinh");
				String tieuSu = rs.getString("tieusu");
				
				ketQua = new TacGia(maTacGia,hoVaTen,ngaySinh,tieuSu);
				break;
			}
			
			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ketQua;
	}

	@Override
	public int insert(TacGia t) {
		int ketQua = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();
			
			// Bước 2: tạo ra đối tượng statement
			String sql = "INSERT INTO tacgia(matacgia,hovaten,ngaysinh,tieusu) "+
							"VALUES (?,?,?,?)";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getMaTacGia());
			st.setString(2, t.getHoVaTen());
			st.setDate(3, t.getNgaySinh());
			st.setString(4, t.getTieuSu());
			
			
			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			
			
			// Bước 4:
			ketQua = st.executeUpdate();
			
			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ketQua;
	}

	@Override
	public int insertAll(ArrayList<TacGia> arr) {
		int ketQua = 0;
		for(TacGia t : arr) {
			ketQua +=this.insert(t);
		}
		return ketQua;
	}

	@Override
	public int delete(TacGia t) {
		int ketQua = 0 ;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();
			
			// Bước 2: tạo ra đối tượng statement
			String sql = "DELETE from tacgia "+
							"WHERE matacgia=?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getMaTacGia());
			
			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			
			
			// Bước 4:
			ketQua = st.executeUpdate();
			
			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ketQua;
	}

	@Override
	public int deleteAll(ArrayList<TacGia> arr) {
		int ketQua = 0;
		for(TacGia t : arr) {
			ketQua +=this.delete(t);
		}
		return ketQua;
	}

	@Override
	public int update(TacGia t) {
		int ketQua = 0 ;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();
			
			// Bước 2: tạo ra đối tượng statement
			String sql = "UPDATE tacgia "+
						 "SET "+
						 "hovaten = ? "+
						 ",ngaysinh = ? "+
						 ",tieusu = ? " +
						 "WHERE matacgia = ?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getHoVaTen());
			st.setDate(2, t.getNgaySinh());
			st.setString(3, t.getTieuSu());
			st.setString(4, t.getMaTacGia());
			
			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			
			
			// Bước 4:
			ketQua = st.executeUpdate();
			
			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ketQua;
	}

//	public static void main(String[] args) {
//		TacGiaDAO tgd = new TacGiaDAO();
////		ArrayList<TacGia> kq = tgd.selectAll();
////		for (TacGia tacGia : kq) {
////			System.out.println(tacGia.toString());
////		}
//		
//		
//		TacGia tg = tgd.selectById(new TacGia("TG1", "", null, ""));
//		System.out.println(tg);
////		
////		
////		TacGia tg_new = new TacGia("TG10", "David", new Date(2000-1900, 10, 15), "");
////		tgd.insert(tg_new);
////		
////		TacGia tg_new = new TacGia("TG10", "David", new Date(2000-1900, 10, 15), "");
////		tgd.delete(tg_new);
////		
////		
//		TacGia tg1 = tgd.selectById(new TacGia("TG1", "", null, ""));
//		System.out.println(tg1);
//		tg1.setTieuSu("TIỂU SỬ ĐÃ BỊ THAY ĐỔI");
//		
//		tgd.update(tg1);
//	}
}
