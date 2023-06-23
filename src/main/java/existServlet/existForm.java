package existServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.db_con;

/**
 * Servlet implementation class existForm
 */
@WebServlet(name = "existid", urlPatterns = { "/existid" })
public class existForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public existForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		  String userId = request.getParameter("userid");
	        if(userId == null || userId.equals("")) {
	        	response.getWriter().write("true");
	        }
	        try {
	        	db_con _Db = new db_con();
	            boolean exist = _Db.chkId(userId);
	            
	            response.getWriter().write(String.valueOf(exist));
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.getWriter().write("false");
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
