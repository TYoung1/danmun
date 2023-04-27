package DAO;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

import DTO.myword;
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
	public void signin_user(HttpServletRequest request, HttpServletResponse response, user User) throws IOException {
		try {
//			
			String sql = "select * from user where _userid = ? ";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,User.getUserid());
			res = pstmt.executeQuery();
			boolean idexist = false;
			if (res.next()) {
				String id = res.getString("_userid");
				String pw = res.getString("_userpw");
				String name = res.getString("_username");
				int grant = res.getInt("_grant");
				if(id.equals(User.getUserid())) {
					idexist= true;
					if(pw.equals(User.getUserpw())) {
//						모두 일치할 경우
						HttpSession session = request.getSession();
						session.setAttribute("userId",id);
						session.setAttribute("userPw",pw);
						session.setAttribute("name",name);
						session.setAttribute("grant",grant);
						
						response.sendRedirect("home.jsp");
					}
					else {
//						비밀번호가 틀릴경우 
						HttpSession session = request.getSession();
						session.setAttribute("chk", "1");
						response.sendRedirect("home.jsp");
					}
				}
			}
//			아이디가 틀렷을경우
			if(!idexist) {
				HttpSession session = request.getSession();
				session.setAttribute("chk", "2");
				response.sendRedirect("home.jsp");
			}
		} catch (Exception e) {
			response.sendRedirect("home.jsp");
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
			PreparedStatement pstmt = conn.prepareStatement(sql);
			res = pstmt.executeQuery();
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
	public ArrayList<word>getallWord(word _word){
		String sql = "select _seq,_word,_mean from word where _word like ?";
		ArrayList<word> list = new ArrayList<word>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			System.out.println(_word.getWord());
			pstmt.setString(1,_word.getWord()+"%");
			res = pstmt.executeQuery();
			
			while (res.next()) {
				word each = new word();
//				 SEQ,TITLE,게시날짜  객체에 저장 
				each.setSeq(res.getInt(1));
				each.setWord(res.getString(2));
				each.setMean(res.getString(3));
				list.add(each);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public void addWord(myword mw) {
		String sql = "insert into myword values(?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,mw.getId());
			pstmt.setInt(2,mw.getSeq());
			pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}
//	public void plusWord(int[] save) {
//		try {
//		for(int i=0;i<save.length;i++) {
//		String sql = "insert into myword values(?,?)";
//		PreparedStatement pstmt = conn.prepareStatement(sql);
//		pstmt.setString(1,);
//		pstmt.setInt(2,save[i]);
//		}
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//	}
}