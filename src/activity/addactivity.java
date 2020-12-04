package activity;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/addactivity")
public class addactivity extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public addactivity() {
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String actname = request.getParameter("actname");
		String actdesc = request.getParameter("actdesc");
		String actorg = request.getParameter("actorg");
		String actcat = request.getParameter("actcat");
		String acttype = request.getParameter("acttype");
		String actlevel = request.getParameter("actlevel");
		String actdate = request.getParameter("actdate");
		String ga1 = request.getParameter("ga1");
		String ga2 = request.getParameter("ga2");
		String ga3 = request.getParameter("ga3");
		String ga4 = request.getParameter("ga4");
		String ga5 = request.getParameter("ga5");
		String ga6 = request.getParameter("ga6");
		String ga7 = request.getParameter("ga7");
		String ga8 = request.getParameter("ga8");
		String ga9 = request.getParameter("ga9");
		String ga10 = request.getParameter("ga10");
		String ga11 = request.getParameter("ga11");
		String ga12 = request.getParameter("ga12");
		
		activities act = new activities();
		act.setActname(actname);
		act.setActdesc(actdesc);
		act.setActorg(actorg);
		act.setActcat(actcat);
		act.setActtype(acttype);
		act.setActlevel(actlevel);
		act.setActdate(actdate);
		act.setGa1(ga1);
		act.setGa2(ga2);
		act.setGa3(ga3);
		act.setGa4(ga4);
		act.setGa5(ga5);
		act.setGa6(ga6);
		act.setGa7(ga7);
		act.setGa8(ga8);
		act.setGa9(ga9);
		act.setGa10(ga10);
		act.setGa11(ga11);
		act.setGa12(ga12);
		
		activitymodel activitymodel = new activitymodel();
		try {
			activitymodel.use(act);
		}catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("factact.jsp");
	}

}
