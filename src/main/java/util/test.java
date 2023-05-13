package util;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;

import database.KhachHangDAO;
import model.KhachHang;

public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		KhachHangDAO khachHangDAO = new KhachHangDAO();
//		KhachHang kh1 = khachHangDAO.selectByUsername("minhq");
//		long now = System.currentTimeMillis();
//		Timestamp checkTime = new Timestamp(now);
//		System.out.println(checkTime);
//		System.out.println(kh1.getThoiGianXacThuc());
//		System.out.println(checkTime.compareTo(kh1.getThoiGianXacThuc()) <= 0);
		
		Date now = new Date(new java.util.Date().getTime());
		long timestamp = now.getTime();

		// Thêm 5 phút vào thời gian hiện tại
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(now);
		calendar.add(Calendar.MINUTE, 5);
		timestamp = calendar.getTime().getTime();

		// Tạo một đối tượng Timestamp từ thời gian đã tính
		Timestamp ts = new Timestamp(timestamp);
		System.out.println(ts);

	}
}