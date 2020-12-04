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
    	response.sendRedirect("factlogin.html");
    }
    %>

    <!-- MENU BAR -->
    <nav class="navbar navbar-expand-lg fixed-top">
        <div class="container">

            <a class="navbar-brand" href="facultydashboard.jsp">Faculty DashBoard</a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-lg-auto">
                    <li class="nav-item">
                        <a href="facultydashboard.jsp" class="nav-link smoothScroll" id= "current">Home</a>
                    </li>

                    <li class="nav-item">
                        <a href="factact.jsp" class="nav-link smoothScroll">Activity</a>
                    </li>

                    <li class="nav-item">
                        <a href="factprog.jsp" class="nav-link smoothScroll">Progress Report</a>
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


     <!-- HERO -->
     <section class="hero d-flex flex-column justify-content-center align-items-center" id="home">

            <div class="bg-overlay"></div>

               <div class="container">
                    <div class="row">

                        <div class="col-lg-8 col-md-10 mx-auto col-12">
                                <div class="hero-text mt-5 text-center">

                                    <h6>Welcome</h6>

                                    <h1 class="text-white">${useremail}</h1>
                                
                                </div>
                        </div>

                    </div>
               </div>
     </section>


     <section class="profile" id="profile">
        <div class="container">
            <div class="row">

                <div class="d-flex flex-column justify-content-center ml-lg-auto mr-lg-5 col-lg-5 col-md-6 col-12">
					<h2 class="mb-4 text-white" data-aos="fade-up">Profile</h2> <br> <br>
				<%
                 try {
        			String mail = session.getAttribute("useremail").toString();
        			String hisQuery = "SELECT * FROM facultyList where email = ?";
                    Connection conn = dbConnection.getConnection();
                    PreparedStatement stat = conn.prepareStatement(hisQuery);
                    stat.setString(1, mail);
                    ResultSet rs = stat.executeQuery();
                    while (rs.next()) {
                    	out.println("<h6 class='mb-6 text-white' data-aos='fade-up'>Name: "+rs.getString(1)+"</h6> <br>");
                    	out.println("<h6 class='mb-6 text-white' data-aos='fade-up'>Department: "+rs.getString(4)+"</h6> <br>");
                    	out.println("<h6 class='mb-6 text-white' data-aos='fade-up'>Designation: "+rs.getString(5)+"</h6>");
                    }
                 }
                 catch (Exception e) {
         			e.printStackTrace();
         		}
                %>
                </div>

                <div class="mr-lg-auto mt-3 col-lg-4 col-md-6 col-12">
                    <div class="about-working-hours">
                        <div> <br> <br> <br> <br> <br>
							<%
							try {
							   String mail = session.getAttribute("useremail").toString();
							   String hisQuery = "SELECT * FROM facultyList where email = ?";
							   Connection conn = dbConnection.getConnection();
							   PreparedStatement stat = conn.prepareStatement(hisQuery);
							   stat.setString(1, mail);
							   ResultSet rs = stat.executeQuery();
							   while (rs.next()) {
								   out.println("<h6 class='mb-6 text-white' data-aos='fade-up'>Phone: "+rs.getString(3)+"</h6>");
								   out.println("<br>");
								   out.println("<h6 class='mb-6 text-white' data-aos='fade-up'>Email: "+rs.getString(2)+"</h6>");
							   }
							}
							catch (Exception e) {
								e.printStackTrace();
							}
						   %>

                        </div>

                    </div>
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