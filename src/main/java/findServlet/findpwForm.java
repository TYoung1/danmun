package findServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.db_con;
import DTO.user;

/**
 * Servlet implementation class findpwForm
 */
@WebServlet("/findpw")
public class findpwForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public findpwForm() {
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
		// TODO Auto-generated method stub
		try {
			db_con _Db = new db_con();
			String id = request.getParameter("user_id");
			String name = request.getParameter("user_name");
			int age =Integer.parseInt(request.getParameter("user_age"));

			user _Data = new user();
//	               유저 DTO 에 값 저장 
			_Data.setUserid(id);
			_Data.setUsername(name);
			_Data.setAge(age);

//	            아이디 찾기 함수 호출
			_Db.findpw(request, response, _Data);
		} catch (Exception e) {

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
