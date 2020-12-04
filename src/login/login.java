package login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	loginmodel loginmodel = new loginmodel();
       
    
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String useremail = request.getParameter("user");
		String password = request.getParameter("pass");
		try {
			if (loginmodel.factcheck(useremail, password))
			{
				HttpSession session = request.getSession();
				session.setAttribute("useremail", useremail);
				response.sendRedirect("facultydashboard.jsp");
			}
			else 
			{
				response.setContentType("text/html");
				PrintWriter pw=response.getWriter();
				pw.println("<script type=\"text/javascript\">");
				pw.println("alert('Invalid Email or Password');");
				pw.println("</script>");
				RequestDispatcher rd=request.getRequestDispatcher("factlogin.html");
				rd.include(request, response);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String useremail = request.getParameter("user");
		String password = request.getParameter("pass");
		
		
			try {
				if (loginmodel.check(useremail, password))
				{
					HttpSession session = request.getSession();
					session.setAttribute("useremail", useremail);
					response.sendRedirect("studentdashboard.jsp");
				}
				else 
				{
					response.setContentType("text/html");
					PrintWriter pw=response.getWriter();
					pw.println("<script type=\"text/javascript\">");
					pw.println("alert('Invalid Email or Password');");
					pw.println("</script>");
					RequestDispatcher rd=request.getRequestDispatcher("login.html");
					rd.include(request, response);
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
	}

}
