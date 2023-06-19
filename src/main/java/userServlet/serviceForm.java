package userServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.db_con;

/**
 * Servlet implementation class serviceForm
 */
@WebServlet("/serviceForm")
public class serviceForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public serviceForm() {
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
		try {
			response.setContentType("text/html; charset=UTF-8");
			db_con _Db = new db_con();
			String[] chkUser = request.getParameterValues("chk");
			String action = request.getParameter("action");
			System.out.println(action);
			if(action.equals("revoke")) {
				_Db.revokeGrant(request, response, chkUser);
			}else if(action.equals("grant")) {
				_Db.giveGrant(request, response, chkUser);
			}else {
				_Db.banUser(request, response, chkUser);
			}
		} catch (Exception e) {
			e.printStackTrace();
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
