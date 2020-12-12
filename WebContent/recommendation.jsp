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

     <title>Student Booster - Student Interface</title>

     <meta charset="UTF-8">
     <meta http-equiv="X-UA-Compatible" content="IE=Edge">
     <meta name="description" content="">
     <meta name="keywords" content="">
     <meta name="author" content="">
     <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

     <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
      integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc"
      crossorigin="anonymous"
    />
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
    	response.sendRedirect("login.html");
    }
    %>

    <!-- MENU BAR -->
    <nav class="navbar navbar-expand-lg fixed-top">
        <div class="container">

            <a class="navbar-brand" href="studentdashboard.jsp">Student DashBoard</a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-lg-auto">
                    <li class="nav-item">
                        <a href="studentdashboard.jsp" class="nav-link smoothScroll">Home</a>
                    </li>

                    <li class="nav-item">
                        <a href="recommendation.jsp" class="nav-link smoothScroll" id="current">Recommendation</a>
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

<%
String mail = session.getAttribute("useremail").toString();
String score = "SELECT * FROM studentlists where email = ?";
Connection conn = dbConnection.getConnection();
PreparedStatement stat = conn.prepareStatement(score);
stat.setString(1, mail);
ResultSet rs = stat.executeQuery();
double g1 = rs.getDouble(7);
double g2 = rs.getDouble(8);
double g3 = rs.getDouble(9);
double g4 = rs.getDouble(10);
double g5 = rs.getDouble(11);
double g6 = rs.getDouble(12);
double g7 = rs.getDouble(13);
double g8 = rs.getDouble(14);
double g9 = rs.getDouble(15);
double g10 = rs.getDouble(16);
double g11 = rs.getDouble(17);
double g12 = rs.getDouble(18);
%>

     <!-- SCHEDULE -->
     <section class="schedule section" id="history">
        <div class="container">
             <div class="row">

                    <div class="col-lg-12 col-12 text-center">
                         <h2 class="text-white" data-aos="fade-up" data-aos-delay="200">Recommendation</h2>
                    </div>

                      <div class="col-lg-12 py-5 col-md-12 col-12">
                          <table class="table table-bordered table-responsive schedule-table">
                          <div class="col-lg-12 py-5 col-md-12 col-12">
                                 
            <table class="table table-bordered table-responsive schedule-table">
            <%
			        try {
                    if (g1 <= 0.5) {
                        int count = 1;
                        String recact = "SELECT * FROM activities where GA1 != 'null' and dateofevent >= CURRENT_DATE ";
                        PreparedStatement rec = conn.prepareStatement(recact);
                        ResultSet recom = rec.executeQuery();
                        out.println("<thead class=thead-light id=rec>");
                    	out.println("<tr>");
                    	out.println("<th colspan=4> GA 1 recommendation, Current Score = " + g1);
                    	out.println("</tr>");
                    	out.println("<tr>");
                    	out.println("<th>Sr. N0.</th>");
                    	out.println("<th>Activity Name</th>");
                    	out.println("<th>Date</th>");
                    	out.println("<th>Mapping</th>");
                    	out.println("</tr>");
                    	while (recom.next()) {
                        	out.println("<tr>");
                        	out.println("<td>" +count+ "</td>");
                        	out.println("<td>"+recom.getString(2)+"</td>");
                        	out.println("<td>"+recom.getString(8)+"</td>");
                        	out.println("<td>"+recom.getString(9)+"</td>");
                        	out.println("</tr>");
                        	count ++;
                        }
                        out.println("</thead>");
                    }
                    else {
                    	out.println("<tr>");
                    	out.println("<th colspan=4  style='background-color: green;'> GA 1 well attained, Current Score = " + g1);
                        out.println("</tr>");
                    }
			        }catch (Exception e) {
					      e.printStackTrace();
				    }
			%>
			</table>
			
			<br>
			<br>
			
			<table class="table table-bordered table-responsive schedule-table">
            <%
			        try {
			        	if (g2 <= 0.5) {
	                        int count = 1;
	                        String recact = "SELECT * FROM activities where GA2 != 'null' and dateofevent >= CURRENT_DATE ";
	                        PreparedStatement rec = conn.prepareStatement(recact);
	                        ResultSet recom = rec.executeQuery();
	                        out.println("<thead class=thead-light id=rec>");
	                    	out.println("<tr>");
	                    	out.println("<th colspan=4> GA 2 recommendation, Current Score = " + g2);
	                    	out.println("</tr>");
	                    	out.println("<tr>");
	                    	out.println("<th>Sr. N0.</th>");
	                    	out.println("<th>Activity Name</th>");
	                    	out.println("<th>Date</th>");
	                    	out.println("<th>Mapping</th>");
	                    	out.println("</tr>");
	                    	while (recom.next()) {
	                        	out.println("<tr>");
	                        	out.println("<td>" +count+ "</td>");
	                        	out.println("<td>"+recom.getString(2)+"</td>");
	                        	out.println("<td>"+recom.getString(8)+"</td>");
	                        	out.println("<td>"+recom.getString(10)+"</td>");
	                        	out.println("</tr>");
	                        	count ++;
	                        }
	                        out.println("</thead>");
	                    }
	                    else {
	                    	out.println("<tr>");
	                    	out.println("<th colspan=4  style='background-color: green;'> GA 2 well attained, Current Score = " + g2);
	                        out.println("</tr>");
	                    }
			        }catch (Exception e) {
					      e.printStackTrace();
				    }
			%>
			</table>
			
			<br>
			<br>
			
			<table class="table table-bordered table-responsive schedule-table">
            <%
			        try {
			        	if (g3 <= 0.5) {
	                        int count = 1;
	                        String recact = "SELECT * FROM activities where GA3 != 'null' and dateofevent >= CURRENT_DATE ";
	                        PreparedStatement rec = conn.prepareStatement(recact);
	                        ResultSet recom = rec.executeQuery();
	                        out.println("<thead class=thead-light id=rec>");
	                    	out.println("<tr>");
	                    	out.println("<th colspan=4> GA 3 recommendation, Current Score = " + g3);
	                    	out.println("</tr>");
	                    	out.println("<tr>");
	                    	out.println("<th>Sr. N0.</th>");
	                    	out.println("<th>Activity Name</th>");
	                    	out.println("<th>Date</th>");
	                    	out.println("<th>Mapping</th>");
	                    	out.println("</tr>");
	                    	while (recom.next()) {
	                        	out.println("<tr>");
	                        	out.println("<td>" +count+ "</td>");
	                        	out.println("<td>"+recom.getString(2)+"</td>");
	                        	out.println("<td>"+recom.getString(8)+"</td>");
	                        	out.println("<td>"+recom.getString(11)+"</td>");
	                        	out.println("</tr>");
	                        	count ++;
	                        }
	                        out.println("</thead>");
	                    }
	                    else {
	                    	out.println("<tr>");
	                    	out.println("<th colspan=4  style='background-color: green;'> GA 3 well attained, Current Score = " + g3);
	                        out.println("</tr>");
	                    }
			        }catch (Exception e) {
					      e.printStackTrace();
				    }
			%>
			</table>
			
			<br>
			<br>
			
			<table class="table table-bordered table-responsive schedule-table">
            <%
			        try {
			        	if (g4 <= 0.5) {
	                        int count = 1;
	                        String recact = "SELECT * FROM activities where GA4 != 'null' and dateofevent >= CURRENT_DATE ";
	                        PreparedStatement rec = conn.prepareStatement(recact);
	                        ResultSet recom = rec.executeQuery();
	                        out.println("<thead class=thead-light id=rec>");
	                    	out.println("<tr>");
	                    	out.println("<th colspan=4> GA 4 recommendation, Current Score = " + g4);
	                    	out.println("</tr>");
	                    	out.println("<tr>");
	                    	out.println("<th>Sr. N0.</th>");
	                    	out.println("<th>Activity Name</th>");
	                    	out.println("<th>Date</th>");
	                    	out.println("<th>Mapping</th>");
	                    	out.println("</tr>");
	                    	while (recom.next()) {
	                        	out.println("<tr>");
	                        	out.println("<td>" +count+ "</td>");
	                        	out.println("<td>"+recom.getString(2)+"</td>");
	                        	out.println("<td>"+recom.getString(8)+"</td>");
	                        	out.println("<td>"+recom.getString(12)+"</td>");
	                        	out.println("</tr>");
	                        	count ++;
	                        }
	                        out.println("</thead>");
	                    }
	                    else {
	                    	out.println("<tr>");
	                    	out.println("<th colspan=4  style='background-color: green;'> GA 4 well attained, Current Score = " + g4);
	                        out.println("</tr>");
	                    }
			        }catch (Exception e) {
					      e.printStackTrace();
				    }
			%>
			</table>
			
			<br>
			<br>
			
			<table class="table table-bordered table-responsive schedule-table">
            <%
			        try {
			        	if (g5 <= 0.5) {
	                        int count = 1;
	                        String recact = "SELECT * FROM activities where GA5 != 'null' and dateofevent >= CURRENT_DATE ";
	                        PreparedStatement rec = conn.prepareStatement(recact);
	                        ResultSet recom = rec.executeQuery();
	                        out.println("<thead class=thead-light id=rec>");
	                    	out.println("<tr>");
	                    	out.println("<th colspan=4> GA 5 recommendation, Current Score = " + g5);
	                    	out.println("</tr>");
	                    	out.println("<tr>");
	                    	out.println("<th>Sr. N0.</th>");
	                    	out.println("<th>Activity Name</th>");
	                    	out.println("<th>Date</th>");
	                    	out.println("<th>Mapping</th>");
	                    	out.println("</tr>");
	                    	while (recom.next()) {
	                        	out.println("<tr>");
	                        	out.println("<td>" +count+ "</td>");
	                        	out.println("<td>"+recom.getString(2)+"</td>");
	                        	out.println("<td>"+recom.getString(8)+"</td>");
	                        	out.println("<td>"+recom.getString(13)+"</td>");
	                        	out.println("</tr>");
	                        	count ++;
	                        }
	                        out.println("</thead>");
	                    }
	                    else {
	                    	out.println("<tr>");
	                    	out.println("<th colspan=4  style='background-color: green;'> GA 5 well attained, Current Score = " + g5);
	                        out.println("</tr>");
	                    }
			        }catch (Exception e) {
					      e.printStackTrace();
				    }
			%>
			</table>
			
			<br>
			<br>
			
			<table class="table table-bordered table-responsive schedule-table">
            <%
			        try {
			        	if (g6 <= 0.5) {
	                        int count = 1;
	                        String recact = "SELECT * FROM activities where GA6 != 'null' and dateofevent >= CURRENT_DATE ";
	                        PreparedStatement rec = conn.prepareStatement(recact);
	                        ResultSet recom = rec.executeQuery();
	                        out.println("<thead class=thead-light id=rec>");
	                    	out.println("<tr>");
	                    	out.println("<th colspan=4> GA 6 recommendation, Current Score = " + g6);
	                    	out.println("</tr>");
	                    	out.println("<tr>");
	                    	out.println("<th>Sr. N0.</th>");
	                    	out.println("<th>Activity Name</th>");
	                    	out.println("<th>Date</th>");
	                    	out.println("<th>Mapping</th>");
	                    	out.println("</tr>");
	                    	while (recom.next()) {
	                        	out.println("<tr>");
	                        	out.println("<td>" +count+ "</td>");
	                        	out.println("<td>"+recom.getString(2)+"</td>");
	                        	out.println("<td>"+recom.getString(8)+"</td>");
	                        	out.println("<td>"+recom.getString(14)+"</td>");
	                        	out.println("</tr>");
	                        	count ++;
	                        }
	                        out.println("</thead>");
	                    }
	                    else {
	                    	out.println("<tr>");
	                    	out.println("<th colspan=4  style='background-color: green;'> GA 6 well attained, Current Score = " + g6);
	                        out.println("</tr>");
	                    }
			        }catch (Exception e) {
					      e.printStackTrace();
				    }
			%>
			</table>
			
			<br>
			<br>
			
			<table class="table table-bordered table-responsive schedule-table">
            <%
			        try {
			        	if (g7 <= 0.5) {
	                        int count = 1;
	                        String recact = "SELECT * FROM activities where GA7 != 'null' and dateofevent >= CURRENT_DATE ";
	                        PreparedStatement rec = conn.prepareStatement(recact);
	                        ResultSet recom = rec.executeQuery();
	                        out.println("<thead class=thead-light id=rec>");
	                    	out.println("<tr>");
	                    	out.println("<th colspan=4> GA 7 recommendation, Current Score = " + g7);
	                    	out.println("</tr>");
	                    	out.println("<tr>");
	                    	out.println("<th>Sr. N0.</th>");
	                    	out.println("<th>Activity Name</th>");
	                    	out.println("<th>Date</th>");
	                    	out.println("<th>Mapping</th>");
	                    	out.println("</tr>");
	                    	while (recom.next()) {
	                        	out.println("<tr>");
	                        	out.println("<td>" +count+ "</td>");
	                        	out.println("<td>"+recom.getString(2)+"</td>");
	                        	out.println("<td>"+recom.getString(8)+"</td>");
	                        	out.println("<td>"+recom.getString(15)+"</td>");
	                        	out.println("</tr>");
	                        	count ++;
	                        }
	                        out.println("</thead>");
	                    }
	                    else {
	                    	out.println("<tr>");
	                    	out.println("<th colspan=4  style='background-color: green;'> GA 7 well attained, Current Score = " + g7);
	                        out.println("</tr>");
	                    }
			        }catch (Exception e) {
					      e.printStackTrace();
				    }
			%>
			</table>
			
			<br>
			<br>
			
			<table class="table table-bordered table-responsive schedule-table">
            <%
			        try {
			        	if (g8 <= 0.5) {
	                        int count = 1;
	                        String recact = "SELECT * FROM activities where GA8 != 'null' and dateofevent >= CURRENT_DATE ";
	                        PreparedStatement rec = conn.prepareStatement(recact);
	                        ResultSet recom = rec.executeQuery();
	                        out.println("<thead class=thead-light id=rec>");
	                    	out.println("<tr>");
	                    	out.println("<th colspan=4> GA 8 recommendation, Current Score = " + g8);
	                    	out.println("</tr>");
	                    	out.println("<tr>");
	                    	out.println("<th>Sr. N0.</th>");
	                    	out.println("<th>Activity Name</th>");
	                    	out.println("<th>Date</th>");
	                    	out.println("<th>Mapping</th>");
	                    	out.println("</tr>");
	                    	while (recom.next()) {
	                        	out.println("<tr>");
	                        	out.println("<td>" +count+ "</td>");
	                        	out.println("<td>"+recom.getString(2)+"</td>");
	                        	out.println("<td>"+recom.getString(8)+"</td>");
	                        	out.println("<td>"+recom.getString(16)+"</td>");
	                        	out.println("</tr>");
	                        	count ++;
	                        }
	                        out.println("</thead>");
	                    }
	                    else {
	                    	out.println("<tr>");
	                    	out.println("<th colspan=4  style='background-color: green;'> GA 8 well attained, Current Score = " + g8);
	                        out.println("</tr>");
	                    }
			        }catch (Exception e) {
					      e.printStackTrace();
				    }
			%>
			</table>
			
			<br>
			<br>
			
			<table class="table table-bordered table-responsive schedule-table">
            <%
			        try {
			        	if (g9 <= 0.5) {
	                        int count = 1;
	                        String recact = "SELECT * FROM activities where GA9 != 'null' and dateofevent >= CURRENT_DATE ";
	                        PreparedStatement rec = conn.prepareStatement(recact);
	                        ResultSet recom = rec.executeQuery();
	                        out.println("<thead class=thead-light id=rec>");
	                    	out.println("<tr>");
	                    	out.println("<th colspan=4> GA 9 recommendation, Current Score = " + g9);
	                    	out.println("</tr>");
	                    	out.println("<tr>");
	                    	out.println("<th>Sr. N0.</th>");
	                    	out.println("<th>Activity Name</th>");
	                    	out.println("<th>Date</th>");
	                    	out.println("<th>Mapping</th>");
	                    	out.println("</tr>");
	                    	while (recom.next()) {
	                        	out.println("<tr>");
	                        	out.println("<td>" +count+ "</td>");
	                        	out.println("<td>"+recom.getString(2)+"</td>");
	                        	out.println("<td>"+recom.getString(8)+"</td>");
	                        	out.println("<td>"+recom.getString(17)+"</td>");
	                        	out.println("</tr>");
	                        	count ++;
	                        }
	                        out.println("</thead>");
	                    }
	                    else {
	                    	out.println("<tr>");
	                    	out.println("<th colspan=4  style='background-color: green;'> GA 9 well attained, Current Score = " + g9);
	                        out.println("</tr>");
	                    }
			        }catch (Exception e) {
					      e.printStackTrace();
				    }
			%>
			</table>
			
			<br>
			<br>
			
			<table class="table table-bordered table-responsive schedule-table">
            <%
			        try {
			        	if (g10 <= 0.5) {
	                        int count = 1;
	                        String recact = "SELECT * FROM activities where GA10 != 'null' and dateofevent >= CURRENT_DATE ";
	                        PreparedStatement rec = conn.prepareStatement(recact);
	                        ResultSet recom = rec.executeQuery();
	                        out.println("<thead class=thead-light id=rec>");
	                    	out.println("<tr>");
	                    	out.println("<th colspan=4> GA 10 recommendation, Current Score = " + g10);
	                    	out.println("</tr>");
	                    	out.println("<tr>");
	                    	out.println("<th>Sr. N0.</th>");
	                    	out.println("<th>Activity Name</th>");
	                    	out.println("<th>Date</th>");
	                    	out.println("<th>Mapping</th>");
	                    	out.println("</tr>");
	                    	while (recom.next()) {
	                        	out.println("<tr>");
	                        	out.println("<td>" +count+ "</td>");
	                        	out.println("<td>"+recom.getString(2)+"</td>");
	                        	out.println("<td>"+recom.getString(8)+"</td>");
	                        	out.println("<td>"+recom.getString(18)+"</td>");
	                        	out.println("</tr>");
	                        	count ++;
	                        }
	                        out.println("</thead>");
	                    }
	                    else {
	                    	out.println("<tr>");
	                    	out.println("<th colspan=4  style='background-color: green;'> GA 10 well attained, Current Score = " + g10);
	                        out.println("</tr>");
	                    }
			        }catch (Exception e) {
					      e.printStackTrace();
				    }
			%>
			</table>
			
			<br>
			<br>
			
			<table class="table table-bordered table-responsive schedule-table">
            <%
			        try {
			        	if (g11 <= 0.5) {
	                        int count = 1;
	                        String recact = "SELECT * FROM activities where GA11 != 'null' and dateofevent >= CURRENT_DATE ";
	                        PreparedStatement rec = conn.prepareStatement(recact);
	                        ResultSet recom = rec.executeQuery();
	                        out.println("<thead class=thead-light id=rec>");
	                    	out.println("<tr>");
	                    	out.println("<th colspan=4> GA 11 recommendation, Current Score = " + g11);
	                    	out.println("</tr>");
	                    	out.println("<tr>");
	                    	out.println("<th>Sr. N0.</th>");
	                    	out.println("<th>Activity Name</th>");
	                    	out.println("<th>Date</th>");
	                    	out.println("<th>Mapping</th>");
	                    	out.println("</tr>");
	                    	while (recom.next()) {
	                        	out.println("<tr>");
	                        	out.println("<td>" +count+ "</td>");
	                        	out.println("<td>"+recom.getString(2)+"</td>");
	                        	out.println("<td>"+recom.getString(8)+"</td>");
	                        	out.println("<td>"+recom.getString(19)+"</td>");
	                        	out.println("</tr>");
	                        	count ++;
	                        }
	                        out.println("</thead>");
	                    }
	                    else {
	                    	out.println("<tr>");
	                    	out.println("<th colspan=4  style='background-color: green;'> GA 11 well attained, Current Score = " + g11);
	                        out.println("</tr>");
	                    }
			        }catch (Exception e) {
					      e.printStackTrace();
				    }
			%>
			</table>
			
			<br>
			<br>
			
			<table class="table table-bordered table-responsive schedule-table">
            <%
			        try {
			        	if (g12 <= 0.5) {
	                        int count = 1;
	                        String recact = "SELECT * FROM activities where GA12 != 'null' and dateofevent >= CURRENT_DATE ";
	                        PreparedStatement rec = conn.prepareStatement(recact);
	                        ResultSet recom = rec.executeQuery();
	                        out.println("<thead class=thead-light id=rec>");
	                    	out.println("<tr>");
	                    	out.println("<th colspan=4> GA 12 recommendation, Current Score = " + g12);
	                    	out.println("</tr>");
	                    	out.println("<tr>");
	                    	out.println("<th>Sr. N0.</th>");
	                    	out.println("<th>Activity Name</th>");
	                    	out.println("<th>Date</th>");
	                    	out.println("<th>Mapping</th>");
	                    	out.println("</tr>");
	                    	while (recom.next()) {
	                        	out.println("<tr>");
	                        	out.println("<td>" +count+ "</td>");
	                        	out.println("<td>"+recom.getString(2)+"</td>");
	                        	out.println("<td>"+recom.getString(8)+"</td>");
	                        	out.println("<td>"+recom.getString(20)+"</td>");
	                        	out.println("</tr>");
	                        	count ++;
	                        }
	                        out.println("</thead>");
	                    }
	                    else {
	                    	out.println("<tr>");
	                    	out.println("<th colspan=4  style='background-color: green;'> GA 12 well attained, Current Score = " + g12);
	                        out.println("</tr>");
	                    }
			        }catch (Exception e) {
					      e.printStackTrace();
				    }
			%>
			</table>
			
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
    Janhavi Obhan (Se_IT_40) &nbsp; &nbsp; &nbsp;
    Pandey Ritesh Kumar (Se_IT_43) <br> <br>
    <a href="mailto: janhavi.obhan@somaiya.edu" target="blank">
        <i class="fas fa-envelope fa-2x"></i>
    </a> &nbsp; &nbsp; &nbsp;
    <a href="tel: 9322935775">
        <i class="fas fa-phone-alt fa-2x"></i>
    </a>
    &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
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
