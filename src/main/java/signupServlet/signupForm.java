package signupServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.db_con;
import DTO.user;

/**
 * Servlet implementation class signupForm
 */
@WebServlet("/signup")
public class signupForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public signupForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");
//		try {
//			db_con _Db = new db_con();
//			user User = new user();
//			User.setUserid(request.getParameter("user_id"));
//			User.setUserpw(request.getParameter("user_pw"));
//			User.setUsername(request.getParameter("user_name"));
//			User.setAge(Integer.parseInt(request.getParameter("user_age")));
//			User.setGender(request.getParameter("user_gender"));
//
////				로그인 함수 호출 
//			_Db.signup_user(User);
//		} catch (Exception e) {
//
//		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
