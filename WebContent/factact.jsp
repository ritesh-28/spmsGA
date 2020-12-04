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
    <link rel="stylesheet" href="css/factact.css">

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
                        <a href="factact.jsp" class="nav-link smoothScroll" id="current">Activity</a>
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

    <section id="actlist">

        <div class="row">
            <div class="col-md-4 text-center">
                <h1 class="mb-4 text-black">Activity List</h2>
            </div>

            <div class="col-md-4 text-center">
                <form action="" method="get">
                    <br>
                    <input type="text" class="form-control" name="actsearch" placeholder="Search Activity">
                </form>
            </div>
        </div>

        <div class="col-lg-12 py-5 col-md-12 col-12">
            <table class="table table-bordered table-responsive schedule-table">

                <thead class="thead-light">
                    <tr>
                        <th rowspan="2">Sr. N0.</th>
                        <th rowspan="2">Activity Name</th>
                        <th rowspan="2">Organizer</th>
                        <th rowspan="2">Category</th>
                        <th rowspan="2">Type</th>
                        <th rowspan="2">Level</th>
                        <th rowspan="2">Date</th>
                        <th colspan="12">Mapped Graduate Attributes</th>
                    </tr>
                    <tr>
                        <th>GA1</th>
                        <th>GA2</th>
                        <th>GA3</th>
                        <th>GA4</th>
                        <th>GA5</th>
                        <th>GA6</th>
                        <th>GA7</th>
                        <th>GA8</th>
                        <th>GA9</th>
                        <th>GA10</th>
                        <th>GA11</th>
                        <th>GA12</th>
                    </tr>

                    <%
                        Connection conn = dbConnection.getConnection();
                        String searchact = request.getParameter("actsearch");
                        String sql;
                        if(searchact == null) {
                        	sql = "SELECT * FROM activities order by dateofevent";
                        }
                        else {
                        	sql = "SELECT * FROM activities where Name like '%" +searchact+ "%' or description like '%" +searchact+ "%' or organizer like '%" +searchact+ "%' or category like '%" +searchact+ "%' or level like '%" +searchact+ "%' or type like '%" +searchact+ "%'";
                        }
                        PreparedStatement stat = conn.prepareStatement(sql);
                        ResultSet rs = stat.executeQuery();
                        int count =1;
                        while (rs.next()) {
                            out.println("<tr>");
                            out.println("<td>"+count+"</td>");
                            out.println("<td>"+rs.getString(2)+"</td>");
                            out.println("<td>"+rs.getString(4)+"</td>");
                            out.println("<td>"+rs.getString(5)+"</td>");
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
                        %>
                </thead>
            </table>
        </div>
    </section>





    <section class="schedule section" id="progress">
        <div class="container">

            <form action="addactivity" method="post">

                <div class="col-lg-12 col-12 text-center py-5">
                    <h1 class="mb-4 text-white">Add New Activity</h2>
                </div>

                <div class="row">

                    <div class="mx-auto mt-4 mt-lg-0 mt-md-0 col-lg-5 col-md-6 col-12">
                        <input type="text" class="form-control" name="actname" placeholder="Name" pattern="[A-Z].+"
                        oninvalid="this.setCustomValidity('Activity Name should start with an UpperCase Letter')"
                        onchange="try{setCustomValidity('')}catch(e){}" required>

                        <input type="text" class="form-control" name="actorg" placeholder="Organizer" pattern="[A-Z].+" 
                        oninvalid="this.setCustomValidity('Organizer name should start with an UpperCase Letter')"
                        onchange="try{setCustomValidity('')}catch(e){}" required>

                        <input type="date" class="form-control" name="actdate" placeholder="Date" required>

                    </div>

                    <div class="mx-auto mt-4 mt-lg-0 mt-md-0 col-lg-5 col-md-6 col-12">
                        <div class="form-control">
                            <div class="dropdown">
                                <label for="category">Category: </label>
                                <select name="actcat" required>
                                    <option value="" disabled selected hidden>-Select-</option>
                                    <option value="CURRICULAR">CURRICULAR</option>
                                    <option value="CO-CURRICULAR">CO-CURRICULAR</option>
                                    <option value="EXTRA-CURRICULAR">EXTRA-CURRICULAR</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-control">
                            <div class="dropdown">
                                <label for="type">Type: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                <select name="acttype" required>
                                    <option value="" disabled selected hidden>-Select-</option>
                                    <option value="INDIVIDUAL">INDIVIDUAL</option>
                                    <option value="TEAM/GROUP">TEAM/GROUP</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-control">
                            <div class="dropdown">
                                <label for="level">Level: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                <select name="actlevel" required>
                                    <option value="" disabled selected hidden>-Select-</option>
                                    <option value="DEPARTMENT">DEPARTMENT</option>
                                    <option value="INSTITUTE LEVEL">INSTITUTE LEVEL</option>
                                    <option value="ZONAL">ZONAL</option>
                                    <option value="STATE">STATE</option>
                                    <option value="NATIONAL">NATIONAL</option>
                                    <option value="INTERNATIONAL">INTERNATIONAL</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mx-auto mt-4 mt-lg-0 mt-md-0 col-lg-5 col-md-12 col-12">
                    <textarea class="form-control" rows="5" name="actdesc" placeholder="Description" pattern="[A-Za-z].+" 
                        oninvalid="this.setCustomValidity('Description of activity should start with an alphabetical letter')"
                        onchange="try{setCustomValidity('')}catch(e){}" required></textarea>
                </div>
                <div class="row">
                    <div class="mx-auto mt-4 mt-lg-0 mt-md-0 col-lg-5 col-md-6 col-12">
                        <table>
                            <tr>
                                <th>GA 1 Engineering Knowledge</th>
                                <td>
                                    <select name="ga1">
                                        <option value="null">null</option>
                                        <option value="LOW">LOW</option>
                                        <option value="MEDIUM">MEDIUM</option>
                                        <option value="HIGH">HIGH</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>GA 2 Problem Analysis</th>
                                <td>
                                    <select name="ga2">
                                        <option value="null">null</option>
                                        <option value="LOW">LOW</option>
                                        <option value="MEDIUM">MEDIUM</option>
                                        <option value="HIGH">HIGH</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>GA 3 Development of Solution</th>
                                <td>
                                    <select name="ga3">
                                        <option value="null">null</option>
                                        <option value="LOW">LOW</option>
                                        <option value="MEDIUM">MEDIUM</option>
                                        <option value="HIGH">HIGH</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>GA 4 Investigations of Inauspicious Problems</th>
                                <td>
                                    <select name="ga4">
                                        <option value="null">null</option>
                                        <option value="LOW">LOW</option>
                                        <option value="MEDIUM">MEDIUM</option>
                                        <option value="HIGH">HIGH</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>GA 5 Modern Tool Usage</th>
                                <td>
                                    <select name="ga5">
                                        <option value="null">null</option>
                                        <option value="LOW">LOW</option>
                                        <option value="MEDIUM">MEDIUM</option>
                                        <option value="HIGH">HIGH</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>GA 6 Impact on Society and Environment</th>
                                <td>
                                    <select name="ga6">
                                        <option value="null">null</option>
                                        <option value="LOW">LOW</option>
                                        <option value="MEDIUM">MEDIUM</option>
                                        <option value="HIGH">HIGH</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="mx-auto mt-4 mt-lg-0 mt-md-0 col-lg-5 col-md-6 col-12">
                        <table>
                            <tr>
                                <th>GA 7 Environment and Sustainability</th>
                                <td>
                                    <select name="ga7">
                                        <option value="null">null</option>
                                        <option value="LOW">LOW</option>
                                        <option value="MEDIUM">MEDIUM</option>
                                        <option value="HIGH">HIGH</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>GA 8 Ethics</th>
                                <td>
                                    <select name="ga8">
                                        <option value="null">null</option>
                                        <option value="LOW">LOW</option>
                                        <option value="MEDIUM">MEDIUM</option>
                                        <option value="HIGH">HIGH</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>GA 9 Communication</th>
                                <td>
                                    <select name="ga9">
                                        <option value="null">null</option>
                                        <option value="LOW">LOW</option>
                                        <option value="MEDIUM">MEDIUM</option>
                                        <option value="HIGH">HIGH</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>GA 10 Individual and Team Work</th>
                                <td>
                                    <select name="ga10">
                                        <option value="null">null</option>
                                        <option value="LOW">LOW</option>
                                        <option value="MEDIUM">MEDIUM</option>
                                        <option value="HIGH">HIGH</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>GA 11 Project Management and Finance</th>
                                <td>
                                    <select name="ga11">
                                        <option value="null">null</option>
                                        <option value="LOW">LOW</option>
                                        <option value="MEDIUM">MEDIUM</option>
                                        <option value="HIGH">HIGH</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>GA 12 Life-Long Learning</th>
                                <td>
                                    <select name="ga12">
                                        <option value="null">null</option>
                                        <option value="LOW">LOW</option>
                                        <option value="MEDIUM">MEDIUM</option>
                                        <option value="HIGH">HIGH</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>

                <div class="act-but">
                    <input class="button_r" type="reset" value="Reset"> &nbsp; &nbsp; &nbsp;
                    <input class="button_s" type="submit" value="Add Activity">
                </div>



            </form>

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