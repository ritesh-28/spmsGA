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
<html lang="en">

<head>

    <title>Student Booster - Faculty Interface</title>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
        integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous" />
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- MAIN CSS -->
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/studentstyle.css">

</head>

<body data-spy="scroll" data-target="#navbarNav" data-offset="50">

    <%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    if(session.getAttribute("useremail")==null)
    {
    	response.sendRedirect("factlogin.html");
    }
    %>

    <!-- MENU BAR -->
    <nav class="navbar navbar-expand-lg fixed-top">
        <div class="container">

            <a class="navbar-brand" href="index.html">Faculty DashBoard</a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-lg-auto">
                    <li class="nav-item">
                        <a href="facultydashboard.jsp" class="nav-link smoothScroll">Home</a>
                    </li>

                    <li class="nav-item">
                        <a href="factprog.jsp" class="nav-link smoothScroll" id="current">Class Progress Report</a>
                    </li>

                    <li class="nav-item">
                        <form action="logout">
                            <button type="submit" class="button_2">Log Out </button>
                        </form>
                    </li>

                </ul>
            </div>

        </div>
    </nav>


    <section id="actlist">
        <div class="container">
            <div class="col-lg-12 col-12 text-center py-5">
                <h1 class="mb-4 text-black">Enter following Data to view Class Progress Report</h2>
            </div>
            <form action="" method="get">
                <div class="form-control">
                    <div class="form-group">
                        <div class="dropdown-1">
                            <label for="Department">Department: &nbsp; </label>
                            <select name="department" required>
                                <option value="" disabled selected hidden>--Select--</option>
                                <option value="Information Technology">Information Technology</option>
                            </select>
                        </div>
                        <div class="dropdown-2">
                            <label for="Year">Year: &nbsp; </label>
                            <select name="year" required>
                                <option value="" disabled selected hidden>--Select--</option>
                                <option value="FE_IT">FE_IT</option>
                                <option value="SE_IT">SE_IT</option>
                                <option value="TE_IT">TE_IT</option>
                                <option value="BE_IT">BE_IT</option>
                            </select>
                        </div>
                    </div>
                    <div class=" col-md-12 text-right">
                        <input class="button_1" type="submit" value="Load Data" style="color: black;">
                    </div>
                    <div class=" col-md-12 text-left">
                        <a href="factprog.jsp" class="button_2">View Individual Report</a>
                    </div>
                </div>
            </form>
        </div>
    </section>

    <section class="profile" id="profile">
        <div class="container">
            <div class="row">

                <div class="col-lg-12 col-12 text-center">
                    <h6>
                        <%
                            try {
                                String studcla = request.getParameter("year");
                                out.println(studcla);
                            }
                            catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </h6>
                    <h2 class="text-white">Students List</h2>
                </div>

                <div class="col-lg-12 py-5 col-md-12 col-12">
                    <table class="table table-bordered table-responsive schedule-table">

                        <thead class="thead-light">
                            <th>Roll No</th>
                            <th>Student ID</th>
                            <th>Name</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>Total Score</th>
                        </thead>

                        <%
                 try {
                	String studcla = request.getParameter("year");
                    String hisQuery = "SELECT * FROM studentlists WHERE Class = ? ORDER BY RollNo";
                    Connection conn = dbConnection.getConnection();
                    PreparedStatement stat = conn.prepareStatement(hisQuery);
                    stat.setString(1, studcla);
                    ResultSet rs = stat.executeQuery();
                    while (rs.next()) {
                        out.println("<tr>");
                        out.println("<td>"+rs.getString(3)+"</td>");
                        out.println("<td>"+rs.getString(1)+"</td>");
                        out.println("<td>"+rs.getString(4)+"</td>");
                        out.println("<td>"+rs.getString(5)+"</td>");
                        out.println("<td>"+rs.getString(6)+"</td>");
                        out.println("<td>"+rs.getString(19)+"</td>");
                        out.println("</tr>");
                    }
                 }
                 catch (Exception e) {
         			e.printStackTrace();
         		}
                %>

                    </table>
                </div>


            </div>
        </div>

        </div>
        </div>
    </section>

    <section class="schedule section" id="progress">
        <div class="container">
            <div class="row">

                <div class="col-lg-12 col-12 text-center">
                    <h6>Progress Status</h6>

                    <h2 class="text-white">Progress Table</h2>
                </div>

                <div class="col-lg-12 py-5 col-md-12 col-12">
                    <table class="table table-bordered table-responsive schedule-table">

                        <thead class="thead-light">
                            <tr>
                            <th colspan=13>Average GA Scores of <% out.println(" "+request.getParameter("year")); %></th>
                            </tr>
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
                        </thead>

                        <%
             try {
            	String studcla = request.getParameter("year");
                String hisQuery = "SELECT round(avg(GA1),3), round(avg(GA2),3), round(avg(GA3),3), round(avg(GA4),3), round(avg(GA5),3), round(avg(GA6),3), round(avg(GA7),3), round(avg(GA8),3), round(avg(GA9),3), round(avg(GA10),3), round(avg(GA11),3), round(avg(GA12),3), round(avg(total),3) FROM studentlists WHERE Class=? GROUP BY Class";
                Connection conn = dbConnection.getConnection();
                PreparedStatement stat = conn.prepareStatement(hisQuery);
                stat.setString(1, studcla);
                 DefaultCategoryDataset data = new DefaultCategoryDataset();
                 ResultSet rs = stat.executeQuery();
                 while (rs.next()) {
                     out.println("<tr>");
                     out.println("<td>"+rs.getString("round(avg(GA1),3)")+"</td>");
                     out.println("<td>"+rs.getString("round(avg(GA2),3)")+"</td>");
                     out.println("<td>"+rs.getString("round(avg(GA3),3)")+"</td>");
                     out.println("<td>"+rs.getString("round(avg(GA4),3)")+"</td>");
                     out.println("<td>"+rs.getString("round(avg(GA5),3)")+"</td>");
                     out.println("<td>"+rs.getString("round(avg(GA6),3)")+"</td>");
                     out.println("<td>"+rs.getString("round(avg(GA7),3)")+"</td>");
                     out.println("<td>"+rs.getString("round(avg(GA8),3)")+"</td>");
                     out.println("<td>"+rs.getString("round(avg(GA9),3)")+"</td>");
                     out.println("<td>"+rs.getString("round(avg(GA10),3)")+"</td>");
                     out.println("<td>"+rs.getString("round(avg(GA11),3)")+"</td>");
                     out.println("<td>"+rs.getString("round(avg(GA12),3)")+"</td>");
                     out.println("<td>"+rs.getString("round(avg(total),3)")+"</td>");
                     out.println("</tr>");
                     
                     data.setValue(rs.getDouble("round(avg(GA1),3)"), rs.getString(1), "GA 1");
                     data.setValue(rs.getDouble("round(avg(GA2),3)"), rs.getString(1), "GA 2");
                     data.setValue(rs.getDouble("round(avg(GA3),3)"), rs.getString(1), "GA 3");
                     data.setValue(rs.getDouble("round(avg(GA4),3)"), rs.getString(1), "GA 4");
                     data.setValue(rs.getDouble("round(avg(GA5),3)"), rs.getString(1), "GA 5");
                     data.setValue(rs.getDouble("round(avg(GA6),3)"), rs.getString(1), "GA 6");
                     data.setValue(rs.getDouble("round(avg(GA7),3)"), rs.getString(1), "GA 7");
                     data.setValue(rs.getDouble("round(avg(GA8),3)"), rs.getString(1), "GA 8");
                     data.setValue(rs.getDouble("round(avg(GA9),3)"), rs.getString(1), "GA 9");
                     data.setValue(rs.getDouble("round(avg(GA10),3)"), rs.getString(1), "GA 10");
                     data.setValue(rs.getDouble("round(avg(GA11),3)"), rs.getString(1), "GA 11");
                     data.setValue(rs.getDouble("round(avg(GA12),3)"), rs.getString(1), "GA 12");
                 }
                 
                 JFreeChart grafico = ChartFactory.createBarChart("Average GA Scores of "+studcla, "GRADUATE ATTRIBUTES", "GA SCORES", data, PlotOrientation.VERTICAL, true, true, true);
                 grafico.removeLegend();
                 final ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
                 final File file1 = new File(getServletContext().getRealPath(".") + "/prog.png");
                 ChartUtilities.saveChartAsPNG(file1, grafico, 900, 500, info);
             }
              catch (Exception e) {
                  e.printStackTrace();
              }
             %>


                    </table>
                </div>

                <div class="col-lg-12 col-12 text-center">

                    <h2 class="text-white" data-aos="fade-up" data-aos-delay="200">Progress Graph</h2>
                </div>

                <div class="col-lg-12 py-5 col-md-12 col-12">
                    <img alt="" src="prog.png">
                </div>

            </div>
        </div>
    </section>


    <!-- FOOTER -->
    <footer class="site-footer">

        <h2>Copyright &copy; IT Department, KJSIEIT </h2>
        <h3>Guided By</h3> Dr. Radhika Kotecha <br />
        (HOD, IT Department, KJSIEIT) <br />
        <h3>Developed by</h3>
        Janhavi Obhan (Se_IT_43) &nbsp; &nbsp; &nbsp;
        Pandey Ritesh Kumar (Se_IT_43) <br> <br>
        <a href="mailto: janhavi.obhan@somaiya.edu" target="blank">
            <i class="fas fa-envelope fa-2x"></i>
        </a> &nbsp; &nbsp; &nbsp;
        <a href="tel: 9322935775">
            <i class="fas fa-phone-alt fa-2x"></i>
        </a>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <a href="mailto: riteshkumar.dp@somaiya.edu" target="blank">
            <i class="fas fa-envelope fa-2x"></i>
        </a> &nbsp; &nbsp; &nbsp;
        <a href="tel: 9082407433">
            <i class="fas fa-phone-alt fa-2x"></i>
        </a>

    </footer>

    <!-- SCRIPTS -->
    <script src="Js/jquery.min.js"></script>
    <script src="Js/bootstrap.min.js"></script>
    <script src="Js/aos.js"></script>
    <script src="Js/custom.js"></script>

</body>

</html>