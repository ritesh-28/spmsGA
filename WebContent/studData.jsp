<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dbutil.dbConnection" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="org.jfree.chart.*" %>
<%@ page import="org.jfree.chart.plot.*" %>
<%@ page import="org.jfree.data.general.*" %>
<%@ page import="org.jfree.data.category.*" %>
<%@ page  import="org.jfree.chart.entity.*" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Faculty Dashboard- student data</title>
        <link rel="stylesheet" href="css\faculty.css">
        <link rel="stylesheet" href="css/factstudData.css">
    </head>
    <body>
    
    <%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    if(session.getAttribute("useremail")==null)
    {
    	response.sendRedirect("factlogin.jsp");
    }
    %>
        <section class="content">
    
            <!---------------NAVIGATION BAR (PRESENT ON EACH PAGE)------------>
            <nav id="navbar">
                <div id="logo">
                    <img src="images\kjsieitLOGO.svg" alt="KJSIEIT">
                </div>
                <ul>
                    <li ><a href="facthome.jsp">Home</a></li>
                    <li ><a href="activity.jsp">Activities</a></li>
                    <li class="current"><a href="studData.jsp">Students' Performance</a></li>
                </ul>
                <p>Welcome, ${useremail}</p>
                    <form action="logout">
                    <button type="submit" class="button_1">Log Out </button>
                    </form>
            </nav>
    
            <!------------Actual Content----------->
            <section id="home">
                <h3 class="h-secondary">Enter student details to view GA scores</h3>
                <form action="studinfo" method="post">
                <div class="stud-info">
                    <div class="dropdown-1">
                        <table>
                            <th>Department</th>
                            <td>
                                <select name="department" required>
                                    <option value="" disabled selected hidden>--Select--</option>
                                    <option value="Information Technology">Information Technology</option>
                                </select>
                            </td>
                        </table>
                    </div>
                    <div class="dropdown-2">
                        <table>
                            <th>Class</th>
                            <td>
                                <select name="year" required>
                                    <option value="" disabled selected hidden>--Select--</option>
                                    <option value="FE_IT">FE_IT</option>
                                    <option value="SE_IT">SE_IT</option>
                                    <option value="TE_IT">TE_IT</option>
                                    <option value="BE_IT">BE_IT</option>
                                </select>
                            </td>
                        </table>
                    </div>
                    <div class="dropdown-3">
                        <table>
                            <th>Roll No</th>
                            <td>
                                <select name="roll" required>
                                    <option value="" disabled selected hidden>--Select--</option>
                                    <%
                                    try {
                                    	Connection conn = dbConnection.getConnection();
                                    	String sql = "SELECT RollNo FROM studentlists ORDER BY RollNo";
                                    	PreparedStatement stat = conn.prepareStatement(sql);
                                    	ResultSet rs = stat.executeQuery();
                                    	while (rs.next()) {
                                    		out.println("<option>");
                                    		out.println(rs.getString("RollNo"));
                                    		out.println("</option>");
                                    	}
                                    }
                                    catch (Exception e) {
                             			e.printStackTrace();
                                    }
                                    %>
                                </select>
                            </td>
                        </table>
                    </div>
                    <input class="button_y" type="submit" value="Load Data">   
                </div>
            </form>
                <h3 class="h-secondary">Basic Student Information: </h3>
                <table>
                    <tr>
                        <th>Student ID</th>
                        <th>Class</th>
                        <th>Roll No</th>
                        <th>Name</th>
                        <th>Phone</th>
                        <th>Email</th>
                    </tr>
                <%
                 try {
                	String studcla = session.getAttribute("syear").toString();
                	String studroll = session.getAttribute("sroll").toString();
        			String hisQuery = "SELECT * FROM studentlists WHERE RollNo = ? AND Class = ?";
                    Connection conn = dbConnection.getConnection();
                    PreparedStatement stat = conn.prepareStatement(hisQuery);
                    stat.setString(1, studroll);
                    stat.setString(2, studcla);
                    ResultSet rs = stat.executeQuery();
                    while (rs.next()) {
                    	out.println("<tr>");
                    	out.println("<td>"+rs.getString(1)+"</td>");
                    	out.println("<td>"+rs.getString(2)+"</td>");
                    	out.println("<td>"+rs.getString(3)+"</td>");
                    	out.println("<td>"+rs.getString(4)+"</td>");
                    	out.println("<td>"+rs.getString(5)+"</td>");
                    	out.println("<td>"+rs.getString(6)+"</td>");
                    	out.println("</tr>");
                    }
                 }
                 catch (Exception e) {
         			e.printStackTrace();
         		}
                %>
                 </table>
                 
               
                
                
                <h3 class="h-secondary">Progress Status: </h3>
                <table>
                    <tr>
                        <th>GA 1</th>
                        <th>GA 2</th>
                        <th>GA 3</th>
                        <th>GA 4</th>
                        <th>GA 5</th>
                        <th>GA 6</th>
                        <th>GA 7</th>
                        <th>GA 8</th>
                        <th>GA 9</th>
                        <th>GA 10</th>
                        <th>GA 11</th>
                        <th>GA 12</th>
                        <th>Total</th>
                    </tr>
                <%
                    try {
                    	String studcla = session.getAttribute("syear").toString();
                    	String studroll = session.getAttribute("sroll").toString();
            			String hisQuery = "SELECT * FROM studentlists WHERE RollNo = ? AND Class = ?";
                        Connection conn = dbConnection.getConnection();
                        PreparedStatement stat = conn.prepareStatement(hisQuery);
                        stat.setString(1, studroll);
                        stat.setString(2, studcla);
    	                DefaultCategoryDataset data = new DefaultCategoryDataset();
                        ResultSet rs = stat.executeQuery();
                        while (rs.next()) {
                        	out.println("<tr>");
                        	out.println("<td>"+rs.getString(7)+"</td>");
                        	out.println("<td>"+rs.getString(8)+"</td>");
                        	out.println("<td>"+rs.getString(9)+"</td>");
                        	out.println("<td>"+rs.getString(10)+"</td>");
                        	out.println("<td>"+rs.getString(11)+"</td>");
                        	out.println("<td>"+rs.getString(12)+"</td>");
                        	out.println("<td>"+rs.getString(13)+"</td>");
                        	out.println("<td>"+rs.getString(14)+"</td>");
                        	out.println("<td>"+rs.getString(15)+"</td>");
                        	out.println("<td>"+rs.getString(16)+"</td>");
                        	out.println("<td>"+rs.getString(17)+"</td>");
                        	out.println("<td>"+rs.getString(18)+"</td>");
                        	out.println("<td>"+rs.getString(19)+"</td>");
                        	out.println("</tr>");
                        	
                        	data.setValue(rs.getDouble(7), rs.getString(1), "GA 1");
		                    data.setValue(rs.getDouble(8), rs.getString(1), "GA 2");
		                    data.setValue(rs.getDouble(9), rs.getString(1), "GA 3");
		                    data.setValue(rs.getDouble(10), rs.getString(1), "GA 4");
		                    data.setValue(rs.getDouble(11), rs.getString(1), "GA 5");
		                    data.setValue(rs.getDouble(12), rs.getString(1), "GA 6");
		                    data.setValue(rs.getDouble(13), rs.getString(1), "GA 7");
		                    data.setValue(rs.getDouble(14), rs.getString(1), "GA 8");
		                    data.setValue(rs.getDouble(15), rs.getString(1), "GA 9");
		                    data.setValue(rs.getDouble(16), rs.getString(1), "GA 10");
		                    data.setValue(rs.getDouble(17), rs.getString(1), "GA 11");
		                    data.setValue(rs.getDouble(18), rs.getString(1), "GA 12");
                        }
                        
                        JFreeChart grafico = ChartFactory.createBarChart("Progress Graph", "GRADUATE ATTRIBUTES", "GA SCORES", data, PlotOrientation.VERTICAL, true, true, true);
        	              
    	                  final ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
    	                  final File file1 = new File(getServletContext().getRealPath(".") + "/progchart.png");
    	                  ChartUtilities.saveChartAsPNG(file1, grafico, 900, 500, info);
                    }
                     catch (Exception e) {
             			e.printStackTrace();
             		}
                    %>
                </table>
                
                <h3 class="h-secondary">Progress Graph: </h3>
                <img alt="" src="progchart.png">

                <h3 class="h-secondary">Participation History: </h3>
                <table>
                    <tr>
                        <th rowspan="2">Sr. N0.</th>
                        <th rowspan=2>Activity Name</th>
                        <th rowspan=2>Rank/Position</th>
                        <th colspan=12>Scores alloted per Graduate Attribute</th>
                        <th rowspan=2>Total Score obtained from the activity</th>
                    </tr>
                    <tr>
                        <th>GA 1</th>
                        <th>GA 2</th>
                        <th>GA 3</th>
                        <th>GA 4</th>
                        <th>GA 5</th>
                        <th>GA 6</th>
                        <th>GA 7</th>
                        <th>GA 8</th>
                        <th>GA 9</th>
                        <th>GA 10</th>
                        <th>GA 11</th>
                        <th>GA 12</th>
                    </tr>
                
                
                <%
                try {
                	String studcla = session.getAttribute("syear").toString();
                	String studroll = session.getAttribute("sroll").toString();
			        String hisQuery = "SELECT * FROM participationHistoryandProgress WHERE RollNo = ? AND Class = ?";
                    Connection conn = dbConnection.getConnection();
                    PreparedStatement stat = conn.prepareStatement(hisQuery);
                    stat.setString(1, studroll);
                    stat.setString(2, studcla);
                    ResultSet rs = stat.executeQuery();
                    int count = 1;
                    while (rs.next()) {
            	        out.println("<tr>");
                    	out.println("<td>"+count+"</td>");
            	        out.println("<td>"+rs.getString(6)+"</td>");
            	        out.println("<td>"+rs.getString(7)+"</td>");
            	        out.println("<td>"+rs.getString(8)+"</td>");
            	        out.println("<td>"+rs.getString(9)+"</td>");
            	        out.println("<td>"+rs.getString(10)+"</td>");
            	        out.println("<td>"+rs.getString(11)+"</td>");
            	        out.println("<td>"+rs.getString(12)+"</td>");
            	        out.println("<td>"+rs.getString(13)+"</td>");
            	        out.println("<td>"+rs.getString(14)+"</td>");
            	        out.println("<td>"+rs.getString(15)+"</td>");
            	        out.println("<td>"+rs.getString(16)+"</td>");
            	        out.println("<td>"+rs.getString(17)+"</td>");
            	        out.println("<td>"+rs.getString(18)+"</td>");
            	        out.println("<td>"+rs.getString(19)+"</td>");
            	        out.println("<td>"+rs.getString(20)+"</td>");
            	        out.println("</tr>");
            	        count ++;
                   }
		      }catch (Exception e) {
			      e.printStackTrace();
		      }
              %>
                </table>
            </section>
        </section>
    
    <!----------FOOT SECTION (THIS CONTAINS COPYRIGHTS AND IS PRESENT ON EACH PAGE)------------->
    <footer>
        <div class="center">
            <h3>Copyright &copy; IT Department, KJSIEIT.</h3> <br>
            Guided by Dr. Radhika Kotecha (HOD, IT Department, KJSIEIT) <br>
            Developed by <br>
            Pandey Ritesh Kumar (SE-IT-43) <br>
            Janhavi Obhan (SE-IT-40)
        </div>
    </footer>
</body>
</html>