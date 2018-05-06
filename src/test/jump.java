package test;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class jump
 */
@WebServlet("/jump")
public class jump extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public jump() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String OpenTime = null,Info = null,Ticket = null,Traffic = null,TelePhone=null,Address=null,Photo=null;
		String flag=request.getParameter("flag");
		ConnectDataBase c=new ConnectDataBase();
		c.HotPlus(flag);
		ResultSet r=c.selectByTitle(flag);
		try {
			while(r.next()) {
				OpenTime=r.getString(6);
				Info=r.getString(9);
				Ticket=r.getString(10);
				TelePhone=r.getString(8);
				Traffic=r.getString(7);
				Address=r.getString(5);
				Photo=r.getString(11);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getSession().setAttribute("Address",Address);
		request.getSession().setAttribute("Opentime", OpenTime);
		request.getSession().setAttribute("Info", Info);
		request.getSession().setAttribute("Ticket", Ticket);
		request.getSession().setAttribute("Traffic", Traffic);
		request.getSession().setAttribute("TelePhone", TelePhone);
		request.getSession().setAttribute("Photo",Photo);
		request.getSession().setAttribute("flag", flag);
		response.sendRedirect("Detail.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
