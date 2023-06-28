<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/register.css">
    <link rel="stylesheet" href="css/userProfile.css">
    <title>Profile</title>
    <link rel="icon" href="images/favicon.png" type="image/x-icon">
    <script src="https://kit.fontawesome.com/38b6b4f5e7.js" crossorigin="anonymous"></script>
</head>

<body>

    <header>

        <div class="top-layer">

            <nav class="navbar" id="navbar">
        <div class="nav-box">

            <button class="open expand" aria-expanded="false"><i class="fa-solid fa-bars"></i></button>

            <button class="close expand" aria-expanded="false"><i class="fa-solid fa-xmark"></i></button>

            <script src="js/header.js"></script>

            <a href="index.jsp"><img src="images/eventer.png" alt="logo" class="logo"></a>


            <% if(session.getAttribute("username")==null){ %>

                <a href="login.jsp" class="loginIcon"><i class="fa-solid fa-right-to-bracket"></i></a>

                <% } else { %>

                    <form><button class="userProfile profileIcon" type="submit" formaction="userProfile"><i
                                class="fa-solid fa-user-circle"></i></button></form>
                    <%} %>



                        <ul class="navigation">

                            <li><a href="index.jsp">Home</a></li>
                            <li><a href="#">Events</a></li>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Services</a></li>

                            <% if(session.getAttribute("username")==null){ %>

                                <li><a href="login.jsp" class="loginBtn"><button class="nav-btn">LOGIN<i
                                                class="fa-solid fa-right-to-bracket"></i></button></a></li>

                                <% } else { %>

                                    <li><a href="LogoutUser" class="loginBtn"><button class="nav-btn">LOGOUT<i
                                                class="fa-solid fa-right-from-bracket"></i></button></a></li>
                                    <%} %>

              			</ul>
        </div>



    </nav>



    <!-- JS -->
    <div class="menu" data-visible="false">
        <ul>
            <li><a href="index.jsp"><i class="fa-solid fa-chevron-right"></i>Home</a></li>
            <li><a href="#"><i class="fa-solid fa-chevron-right"></i>Events</a></li>
            <li><a href="#"><i class="fa-solid fa-chevron-right"></i>About Us</a></li>
            <li><a href="#"><i class="fa-solid fa-chevron-right"></i>Services</a></li>
        </ul>
    </div>

    <script type="module" src="js/index.js"></script>
            
            
            <!-- BODY -->
            
			<!--Get data from the servlet-->
			
			<c:forEach var="details" items="${userDetails}">
			
				<c:set var="fname" value="${details.fname}"></c:set>
				<c:set var="lname" value="${details.lname}"></c:set>
				<c:set var="nic" value="${details.nic}"></c:set>
				<c:set var="phone" value="${details.phone}"></c:set>
				<c:set var="email" value="${details.email}"></c:set>
				<c:set var="username" value="${details.uname}"></c:set>
								
                <!-- BODY -->

                <div class="body">

                    <p><i class="fa-solid fa-circle-user user"></i></p>

                    <form action="DeleteUser">

                        <div class="main">

                            <div class="left">

                                <div class="input">
                                    <label for="fname">First Name</label>
                                    <p class="display">${details.fname}</p>
                                </div>
                                <div class="input">
                                    <label for="lname">Last Name</label>
                                    <p class="display">${details.lname}</p>
                                </div>
                                <div class="input">
                                    <label for="NIC">NIC</label>
                                    <p class="display">${details.nic}</p>
                                </div>


                            </div>

                            <div class="right">
                                <div class="input">
                                    <label for="phone">Contact</label>
                                    <p class="display">${details.phone}</p>
                                </div>

                                <div class="input">
                                    <label for="email">Email</label>
                                    <p class="display">${details.email}</p>
                                </div>
                                <div class="input">
                                    <label for="username">Username</label>
                                    <p class="display">${details.uname}</p>
                                </div>
                            </div>

                        </div>
                        
                        <c:url value="updateProfile.jsp" var="userUpdate">
                        
                        	<c:param name="fname" value="${fname}"/>
                        	<c:param name="lname" value="${lname}"/>
                        	<c:param name="nic" value="${nic}"/>
                        	<c:param name="phone" value="${phone}"/>
                        	<c:param name="email" value="${email}"/>
                        	<c:param name="username" value="${username}"/>
                        
                        </c:url>

                        <div class="btns">
                               <a href="${userUpdate}"><div class="signup-btn submit">Update Profile</div></a>
                               <a href="DeleteUser"><div class="signup-btn submit">Delete Profile</div></a>
                        </div>

                    </form>

                </div>
                
                </c:forEach>

        </div>

    </header>

    <!-- FOOTER -->

    <%@include file="footer.jsp" %>


</body>

</html>