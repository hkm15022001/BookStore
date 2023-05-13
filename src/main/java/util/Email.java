package util;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Email {
	//mật khẩu ứng dụng gmail
	final static String from = "hkm15022001@gmail.com";
	final static String password = "vylferozbscklxqq";
	
	
	public static Boolean sendEmail(String to,String sub,String content) {
		
		//// Properties : khai báo các thuộc tính
		Properties prop = new Properties();
		prop.put("mail.smtp.host","smtp.gmail.com" );
		prop.put("mail.smtp.port","587"); //tls 587 ssl 465
		prop.put("mail.smtp.auth","true");
		prop.put("mail.smtp.starttls.enable","true");
		
		//create Authenticator
		Authenticator auth = new Authenticator () {
			@Override
			protected PasswordAuthentication getPasswordAuthentication(){
				return new PasswordAuthentication(from, password);
			}
		};
		
		//Phiên làm việc
		Session session = Session.getInstance(prop ,auth);
		
		//Tạo một tin nhắn
		MimeMessage msg = new MimeMessage(session);
		
		try {
			// Kiểu nội dung
			msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
			
			// Người gửi
			msg.setFrom(from);

			// Người nhận
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));

			// Tiêu đề email
			msg.setSubject(sub);

			// Quy đinh ngày gửi
			msg.setSentDate(new Date());

			// Quy định email nhận phản hồi
			// msg.setReplyTo(InternetAddress.parse(from, false))

			// Nội dung
			msg.setContent(content, "text/HTML; charset=UTF-8");

			// Gửi email
			Transport.send(msg);
			System.out.println("Gửi email thành công");
			return true;
		} catch (Exception e) {
			System.out.println("Gặp lỗi trong quá trình gửi email");
			e.printStackTrace();
			return false;
		}
		
	}
	
//	public static void main(String[] args) {
//		
//			Email.sendEmail("thuthuynguyen12345123@gmail.com", System.currentTimeMillis() + "", "Đây là phần nội dung!");
//		
//
//	}
}
