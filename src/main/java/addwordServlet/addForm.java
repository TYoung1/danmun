package addwordServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.db_con;
import DTO.myword;
import DTO.word;

/**
 * Servlet implementation class addForm
 */
@WebServlet("/addForm")
public class addForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addForm() {
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
			String _id = (request.getParameter("id"));
			String []sWord = request.getParameterValues("save");
			int []saveWord = new int [sWord.length];
			for(int j =0;j<saveWord.length;j++) {
				saveWord[j] = Integer.parseInt(sWord[j]);
			}
			_Db.addWord(request,response,_id,saveWord);
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
