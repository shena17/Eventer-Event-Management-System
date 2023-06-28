<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	
	<link rel="stylesheet" href="./css/style.css">
    <script type="text/javascript" src="./js/script.js" defer></script>
    <script src="https://kit.fontawesome.com/a39ba673b3.js" crossorigin="anonymous"></script>
	
	<title>SupplierDashboard</title>
	
	
</head>
<body>
 <section>

        <div class="side-bar" >
            <div class="logo">
                <span><img src="./images/favicon.png"></span> <img src="./images/eventerText.png">
            </div>


            <div class="links">

                <a href="./index.html">
                <div class="link">
                    <div class="icon"><i class="fa-solid fa-square"></i></div>
                    <div class="name">DashBoard</div>
                </div>
                <a>
                
                <a href="ShowSupplier">
                <div class="link">
                    <div class="icon"><i class="fa-solid fa-user"></i></div>
                    <div class="name">Suppliers</div>
                </div>
                </a>

                <a href="ShowEvents">
                <div class="link">
                    <div class="icon"><i class="fa-solid fa-box-archive"></i></div>
                    <div class="name">Events</div>
                </div>
                </a>

                <a href="#">
                <div class="link">
                    <div class="icon"><i class="fa-solid fa-bag-shopping"></i></div>
                    <div class="name">Payments</div>
                </div>
                </a>

                <div class="link">
                    <div class="icon"><i class="fa-solid fa-chart-pie"></i></div>
                    <div class="name">analitics</div>
                </div>

                <div class="link">
                    <div class="icon"><i class="fa-solid fa-clipboard-list"></i></div>
                    <div class="name">reviews</div>
                </div>

				<a href="index.jsp">
                <div class="link">
                    <div class="icon"><i class="fa-solid fa-wallet"></i></div>
                    <div class="name">Home</div>
                </div>
                </a>

				<a href="./AddOrganizer.jsp">
                <div class="link">
                    <div class="icon"><i class="fa-solid fa-user-tie"></i></div>
                    <div class="name">Add Organizer</div>
                </div>
                </a>

                </div>


                
            </div>
            
        </div>

        <div class="dashboard" hash="false">

            <div class="navbar">
                <span><button id="true" ><i class="fa-solid fa-bars-progress"></i></button><h2>DASHBOARD</h2></span>

                <div class="search">
                    <input type="search" placeholder="Search...">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </div>

                <div class="nav-btn">
                    <i class="fa-solid fa-bell"></i>
                    <div class="center">
                        <input class="button" type="checkbox" id="checkbtn">
                    </div>
                    <div class="profile-pic">
                        <img src="./images/profileIcon.jpg">
                    </div>
                </div>
    

                </script>


            </div>

            <!--------------------------------------------------------->
            <!--------------------------------------------------------->
            <!--------------------------------------------------------->

            <div class="summary">

                <div class="box">

                    <div class="top">
                        <div class="left">
                            <h4>Suppliers</h4>
                            <h2><%out.println( request.getAttribute("SupCount"));%></h2>
                        </div>

                        <div class="right">
                            <i class="fa-solid fa-bars-progress"></i>
                        </div>
                    </div>

                </div>

                <div class="box">

                    <div class="top">
                        <div class="left">
                            <h4>Ongoing Events</h4>
                            <h2>$20 000</h2>
                        </div>

                        <div class="right">
                            <i class="fa-solid fa-bars-progress"></i>
                        </div>
                    </div>

                </div>

                <div class="box">

                    <div class="top">
                        <div class="left">
                            <h4>Past Events</h4>
                            <h2>$20 000</h2>
                        </div>

                        <div class="right">
                            <i class="fa-solid fa-bars-progress"></i>
                        </div>
                    </div>

                </div>

                <div class="box">

                    <div class="top">
                        <div class="left">
                            <h4>Monthly Income</h4>
                            <h2>$20 000</h2>
                        </div>

                        <div class="right">
                            <i class="fa-solid fa-bars-progress"></i>
                        </div>
                    </div>

                </div>


               
            </div>


            <!--------------------------------------------------------->
            <!--------------------------------------------------------->
            <!--------------------------------------------------------->

            <div class="page-middle">

                    <div class="sellings">
                        <div class="tmorebtn">
                            <h2>Events</h2>
                            <a href="ShowEvents"><button>More</button></a>
                        </div>
                        <table>
                            <tr>
                                <th>DATE</th>
                                <th>User ID</th>
                                <th>Venue ID</th>
                                <th>COST</th>
                            </tr>
	
						<c:forEach var="details" items="${EventDetails}">
                            <tr>
                                <td>${details.date}</td>
                                <td>${details.uid}</td>
                                <td>${details.vid}</td>
                                <td>${details.budget}</td>
                            </tr>
                			 </c:forEach>

                        </table>
                    </div>

                    <div class="orders">
                        <table>
                            <div class="tmorebtn">
                                <h2>Payments</h2>
                                <a href="./Payments.html"><button>More</button></a>
                            </div>

                            <tr>
                                <th>Payment ID</th>
                                <th>Event Id</th>
                                <th>Payments</th>
                            </tr>

							<c:forEach var="details" items="${PaymentDetails}">
                            <tr>
                                <td>${details.pid}</td>
                                <td>${details.eid}</td>
                                <td>${details.amount}</td>
                            </tr>
                             </c:forEach>
                            
                        </table>
                    </div>
            </div>
            

        </div>
    

    </section>



</body>
</html>