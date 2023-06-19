package DAO;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

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
	
//	회원가입
	public void signup_user(HttpServletRequest request, HttpServletResponse response,user User) throws IOException {
//		grant 를 제외한 모든정보 삽입
		String sql = "insert into user (_userid,_userpw,_username,_userage,_gender) values(?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, User.getUserid());
			pstmt.setString(2,User.getUserpw());
			pstmt.setString(3,User.getUsername());
			pstmt.setInt(4,User.getAge());
			pstmt.setString(5, User.getGender());
			pstmt.executeUpdate();
//			완료후 home.jsp로 이동
			response.sendRedirect("home.jsp");
		}catch(Exception e) {
//			아이디 중복
			HttpSession session = request.getSession();
			session.setAttribute("chk", "1");
			response.sendRedirect("signup.jsp");
			e.printStackTrace();
		}
	}
	
//	로그인
	public void signin_user(HttpServletRequest request, HttpServletResponse response, user User) throws IOException {
		try {
//			userid 에 해ㅐ당하는 정보 가져오기
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
//				아이디 일치 확인
				if(id.equals(User.getUserid())) {
					idexist= true;
//					비밀번호 일치 확인
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
//	회원탈퇴
	public void deleteUser(HttpServletRequest request, HttpServletResponse response, String id) {
		String sql = "delete from user where _userid = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.executeUpdate();
			response.sendRedirect("logout.jsp");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
//	아이디 찾기 
	public void findid(HttpServletRequest request, HttpServletResponse response, user _Data)
			throws IOException {
		try {
//			이름과 성별, 생년월일로 정보찾는 쿼리 
			String sql = "select _userid from user where _username = ? AND _userage = ? ";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, _Data.getUsername());
			pstmt.setInt(2,_Data.getAge());
			res= pstmt.executeQuery();
			while (res.next()) {
				String id = res.getString(1);
//				세션객체 사용해서 저장 
				HttpSession session = request.getSession();
				session.setAttribute("user_id",id);

				response.sendRedirect("find.jsp");
			}
			// 해당 쿼리 결과가 없을 경우 페이지 리로딩
			response.sendRedirect("find.jsp");
		} catch (Exception e) {

			e.printStackTrace();
		}
	}
//	비밀번호 찾기 
	public void findpw(HttpServletRequest request, HttpServletResponse response, user _Data)
			throws IOException {
		try {
//			이름과 성별, 생년월일로 정보찾는 쿼리 
			String sql = "select _userpw from user where _userid = ? AND _username = ? AND _userage = ? ";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, _Data.getUserid());
			pstmt.setString(2, _Data.getUsername());
			pstmt.setInt(3,_Data.getAge());
			res= pstmt.executeQuery();
			while (res.next()) {
				String pw = res.getString(1);
//				세션객체 사용해서 저장 
				HttpSession session = request.getSession();
				session.setAttribute("user_pw",pw);

				response.sendRedirect("find.jsp");
			}
			// 해당 쿼리 결과가 없을 경우 페이지 리로딩
			response.sendRedirect("find.jsp");
		} catch (Exception e) {

			e.printStackTrace();
		}
	}

//	랜덤한 단어 하나 가져오기
	public word oneword() {
		try {
//			랜덤 limit 1개
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
//	랜덤 미니게임 단어
	public word miniword() {
		String sql = "select _word from word where length(_word) < 6 and length(_word) >4 order by rand() limit 1";
		try {
//			랜덤 limit 1개
			PreparedStatement pstmt = conn.prepareStatement(sql);
			res=pstmt.executeQuery();
			if(res.next()) {
				word one = new word();
				one.setWord(res.getString(1));
				return one;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
//	많이조회한단어 가져오기
	public ArrayList<word> getbestWord() { 
//		10개만 가져오기 내림차순 
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
//	많이조회한순서대로 30개 리스트 가져오기
	public ArrayList<word> getbestList() { 
//		30개 제한 리스트
		String sql = "select _seq,_word,_mean from word order by _count desc limit 30";
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
	public void  upcount(String word) {
		String sql = "update word set _count = _count+1 where _word = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, word);
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
//	검색단어 가져오기
	public ArrayList<word>getallWord(HttpServletRequest request, HttpServletResponse response,word _word){
//		검색한 글로 시작하는 단어에대한 정보 모두가져오기
		String sql = "select _seq,_word,_mean from word where _word like ?";
		ArrayList<word> list = new ArrayList<word>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,_word.getWord()+"%");
			res = pstmt.executeQuery();
			
			while (res.next()) {
				word each = new word();
//				 SEQ,TITLE,게시날짜  객체에 저장 
				each.setSeq(res.getInt(1));
				each.setWord(res.getString(2));
				each.setMean(res.getString(3));
				list.add(each);
				if(_word.getWord().trim().equals(res.getString(2))) {
					upcount(_word.getWord().trim());
				}
			}
			HttpSession session = request.getSession();
			session.setAttribute("list", list);
			response.sendRedirect("findword.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
//	회원 조회
	public List<user>searchUser(HttpServletRequest request, HttpServletResponse response,String type,String what){
		String sql = "";
        if ("userid".equals(type)) {
            sql = "SELECT * FROM user WHERE _userid=?";
        } else if ("username".equals(type)) {
            sql = "SELECT * FROM user WHERE _username=?";
        } else if ("gender".equals(type)) {
            sql = "SELECT * FROM user WHERE _gender=?";
        }
        List<user> list = new ArrayList<user>();
        try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,what);
			res = pstmt.executeQuery();
			
			while (res.next()) {
				user each = new user();
//				 SEQ,TITLE,게시날짜  객체에 저장 
				each.setUserid(res.getString("_userid"));
	            each.setUsername(res.getString("_username"));
	            each.setAge(res.getInt("_userage"));
	            each.setGender(res.getString("_gender"));
				list.add(each);
			}
			HttpSession session = request.getSession();
			session.setAttribute("list", list);
			response.sendRedirect("admin.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
        return list;
	}
//	내단어장에 단어 추가
	public void addWord(HttpServletRequest request, HttpServletResponse response,String id, int[] save) throws IOException {
		String sql = "insert into myword (_userid,_seq) values(?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			if(id.equals("null")) {
				HttpSession session = request.getSession();
				session.setAttribute("dup", "0");
				response.sendRedirect("home.jsp");
			}else {
				pstmt.setString(1,id);
			for(int i=0;i<save.length;i++) {
				pstmt.setInt(2,save[i]);
				pstmt.executeUpdate();
			}
			response.sendRedirect("home.jsp");
			}
		}
		catch(Exception e) {
			HttpSession session = request.getSession();
			session.setAttribute("dup", "1");
			response.sendRedirect("home.jsp");
			e.printStackTrace();
			
		}
		
	}
//	리스트에서 +버튼으로 추가
	public void addWordatlist(HttpServletRequest request, HttpServletResponse response,String id,int seq,int type) throws IOException {
		String sql = "insert into myword (_userid,_seq) values(?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, seq);
			pstmt.executeUpdate();
			if(type == 0) {
				response.sendRedirect("bestlist.jsp");
			}else if(type == 8) {
				response.sendRedirect("findword.jsp");
			}else {
			response.sendRedirect("typeword.jsp?type="+ type+"");
			}
		}catch(Exception e) {
			HttpSession session = request.getSession();
			session.setAttribute("dup", "1");
			response.sendRedirect("bestlist.jsp");
			e.printStackTrace();
		}
	}
//	내 단어장에 저장된 단어수 카운팅
	public String countWord(String id) {
		String sql = "select count(_userid) from myword where _userid = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			res = pstmt.executeQuery();
			if(res.next()) {
				return res.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "0";
	}
//	내단어장
	public ArrayList<word>mywordList(String id,int page) {
		String sql = "select A._seq,_word,_mean from myword as A inner join word as B on A._seq = B._seq where A._userid = ? order by _order limit ?,10";
		ArrayList<word> list = new ArrayList<word>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, (page - 1) * 10);
			res=pstmt.executeQuery();
			while(res.next()) {
				word mine = new word();
				mine.setSeq(res.getInt(1));
				mine.setWord(res.getString(2));
				mine.setMean(res.getString(3));
				list.add(mine);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
//	내단어장에 단어 삭제
	public void deleteWord(HttpServletRequest request, HttpServletResponse response,String id,int[]Seq) {
		String sql = "delete from myword where _userid = ? and _seq = ? ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			for(int i=0;i<Seq.length;i++) {
			pstmt.setInt(2,Seq[i]);
			pstmt.executeUpdate();
			}
			response.sendRedirect("myword.jsp");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
//	유저삭제
	public void banUser(HttpServletRequest request, HttpServletResponse response,String[] id) {
		String sql = "delete from user where _userid=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			for(int i=0; i<id.length;i++) {
				pstmt.setString(1,id[i]);		
				pstmt.executeUpdate();
			}
			response.sendRedirect("admin.jsp");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
//	권한주기
	public void revokeGrant(HttpServletRequest request,HttpServletResponse response,String[]id ) {
		String sql = "update user set _grant =0 where _userid=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			for(int i=0; i<id.length;i++) {
				pstmt.setString(1,id[i]);		
				pstmt.executeUpdate();
			}
			response.sendRedirect("admin.jsp");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
//	권한뺏기
	public void giveGrant(HttpServletRequest request,HttpServletResponse response,String[]id ) {
		String sql = "update user set _grant =1 where _userid=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			for(int i=0; i<id.length;i++) {
				pstmt.setString(1,id[i]);		
				pstmt.executeUpdate();
			}
			response.sendRedirect("admin.jsp");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
//	내가 원하는 단어 글로 추가
	public void addone(HttpServletRequest request, HttpServletResponse response,String id,String word) throws IOException {
		String sql = "insert into myword (_userid,_seq) values(?,(select _seq from  word where _word = ?))";	
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2,word);
			pstmt.executeUpdate();
			response.sendRedirect("myword.jsp");
		}catch(Exception e) {
			HttpSession session = request.getSession();
			session.setAttribute("message","1");
			response.sendRedirect("myword.jsp");
			e.printStackTrace();
		}
 	}
//	타입에맞는 단어리스트 가져오기
	public ArrayList<word>gettypeWord(int type){
		String sql = "select _seq,_word,_mean from word where _type = ?";
		ArrayList<word> list = new ArrayList<word>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,type);
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
	
	
}