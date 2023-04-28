package delmineServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.db_con;
import DTO.myword;

/**
 * Servlet implementation class delmineForm
 */
@WebServlet("/deletemine")
public class delmineForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delmineForm() {
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
			myword mw = new myword();
			String _id = (request.getParameter("id"));
			String []delWord = request.getParameterValues("del");
			int []deleteSeq = new int [delWord.length];
			for(int j =0;j<deleteSeq.length;j++) {
				deleteSeq[j] = Integer.parseInt(delWord[j]);
			}
			_Db.deleteWord(request,response,_id,deleteSeq);
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
