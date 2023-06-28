<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE html>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/ceb392bc28.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/upcoming.css">
    <link rel="stylesheet" href="css/payment.css">
    <title>Payment</title>
</head>

<body>
    <div class="main">
        <div class="left">
            <div class="logo">
                <img src="images/logo.png" at="logo">
            </div>
            <div class="sidebar">
                <!-- sidebar -->
                <ul>
                    <a href="userDash.html" class="text">
                        <li><i class="fa-solid fa-house"></i>Home</li>
                    </a>
                    <a href="common.html" class="text">
                        <li><i class="fa-solid fa-bookmark"></i>Book Event</li>
                    </a>
                    <a href="upcoming.html" class="text">
                        <li><i class="fa-solid fa-calendar-days"></i>Upcoming Events</li>
                    </a>
                    <a href="past.html" class="text">
                        <li><i class="fa-solid fa-calendar-check"></i>Past Events</li>
                    </a>
                    <a href="notification.html" class="text">
                        <li><i class="fa-solid fa-bell"></i>Notifications</li>
                    </a>
                    <a href="supplierview.html" class="text">
                        <li><i class="fa-solid fa-boxes-packing"></i>View suppliers</li>
                    </a>
                </ul>
            </div>

        </div>
        <div class="right">
            <div class="right-main">
                <div class="rightupper">
                    <!-- topbar -->
                    <div class="rightconner">
                        <span class="dash">Dashboard</span>
                    </div>
                    <div class="rightmiddle">
                        <div class="bordline">
                            <input type="search" class="search" name="search" placeholder="Search...">
                            <button type="submit" class="btn"><i class="fa-solid fa-magnifying-glass"></i></button>
                        </div>
                    </div>
                    <div class="together">
                        <div class="rightbefore">
                            <span class="user">User</span>
                        </div>
                        <div class="rightnext">
                            <img src="images/circledefault.png" alt="profile" width="50px" height="50px">
                        </div>
                    </div>
                </div>
            </div>
            
            <% String name = (String)request.getAttribute("name");%>
            <% double budget = (Double)request.getAttribute("budget"); %>
            <%int eid = (int)request.getAttribute("eid"); %>
            

            <!-- BODY -->
            <div class="rightlower">

                <div class="payment">

                    <img src="images/paypal.png" alt="paypal" class="paypal">

                    <div class="upper">
                        <div class="detail">
                            <p class="label">Name
                            </p>
                            <p class="result"><%=name%></p>
                        </div>
                        <div class="detail">
                            <p class="label">
                                Total Payment</p>
                            <p class="result">$<%=budget%>
                            </p>
                        </div>
                    </div>

                    <form action="PaymentConfirm" method="post">
                        <div class="detail">
                            <label for="cno" class="label">Card Number</label>
                            <input type="text" name="cno" class="result">
                        </div>

                        <div class="lower">
                            <div class="detail">
                                <label for="expiry" class="label">Expiry Date</label>
                                <input type="text" name="expiry" class="result">
                            </div>

                            <div class="detail">
                                <label for="ccv" class="label">CCV</label>
                                <input type="text" name="ccv" class="result">
                            </div>
                        </div>
                        
                        <input type="text" name="eid" value=<%=eid %> class="result" style="display:none;">

                        <div class="payBtn">
                            <input type="submit" value="Pay $<%=budget%>" class="pay">
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>

</body>

</html>