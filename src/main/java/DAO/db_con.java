package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DTO.user;
import DTO.word;

public class db_con {
	private Connection conn;

	private ResultSet res = null;

//	db연결
	public db_con() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			String url = "jdbc:mysql://localhost/danmun?characterEncoding=UTF-8&serverTimezone=UTC";
			String id = "root";
			String pwd = "1234"; // mysql 접속 비번
			conn = DriverManager.getConnection(url, id, pwd);
			System.out.println("db접속 성공");
		} catch (Exception e) {

			System.out.println("db접속 실패");
			e.printStackTrace();
		}
	}
//	public void signup_user(user User) {
//		String sql = "insert into user values(?,?,?,?,?)";
//		PreparedStatement pstmt = conn.prepareStatement(sql);
//		res= pstmt.executeUpdate();
//		pstmt.setString(1, User.getUserid());
//		pstmt.setString(2,User.getUserpw());
//		pstmt.setString(3,User.getUsername());
//		pstmt.setInt(4,User.getAge());
//		pstmt.setString(5, User.getGender());
//	}
	public void signin_user(user User) {
		try {
//			현재 시간날짜 가져오는 쿼리 
			String sql = "select * from user where _userid = ? and _userpw = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
//			쿼리문 실행결과 res에 담아주기
//			executeQuery select문에 사용
			pstmt.setString(1,User.getUserid());
			pstmt.setString(2,User.getUserpw());
			res = pstmt.executeQuery();
			if (res.next()) {
				String id = res.getString("_userid");
				String pw = res.getString("_userpw");
				String name = res.getString("_username");
				int grant = res.getInt("_grant");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public word oneword() {
		try {
			String sql = "select _word,_mean from word order by rand() limit 1";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			res=pstmt.executeQuery();
			if(res.next()) {
				word one = new word();
				one.setWord(res.getString(1));
				one.setMean(res.getString(2));
				return one;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public ArrayList<word> getbestWord() {
//		 가장 마지막에 쓴글 기준 5개 제한 
		String sql = "select _seq,_word,_mean from word order by _count desc limit 10";
		ArrayList<word> list = new ArrayList<word>();
		try {
			PreparedStatement psmt = conn.prepareStatement(sql);
			res = psmt.executeQuery();
			while (res.next()) {
				word best = new word();
//				 SEQ,TITLE,게시날짜  객체에 저장 
				best.setSeq(res.getInt(1));
				best.setWord(res.getString(2));
				best.setMean(res.getString(3));
				list.add(best);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}