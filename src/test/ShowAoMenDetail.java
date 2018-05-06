package test;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DaoServlet
 */
@WebServlet("/ShowAoMenDetail")
public class ShowAoMenDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowAoMenDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		ConnectDataBase c=new ConnectDataBase();
		ResultSet result=c.selectAllFromAoMen();
		List<String> Info=new ArrayList<String>();
		List<String> Address=new ArrayList<String>();
		List<String> Photo=new ArrayList<String>();
        try {
			while(result.next()) {
				Info.add(result.getString(9));
				Address.add(result.getString(5));
				Photo.add(result.getString(11));
			}
			request.getSession().setAttribute("AoMenInfo", Info);
			request.getSession().setAttribute("AoMenAddress", Address);
			request.getSession().setAttribute("AoMenPhoto", Photo);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        response.sendRedirect("AoMenDetail.jsp");
        }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
