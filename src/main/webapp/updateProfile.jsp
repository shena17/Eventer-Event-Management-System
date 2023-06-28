<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
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
        <title>Update Profile</title>
        <link rel="icon" href="images/favicon.png" type="image/x-icon">
        <script src="https://kit.fontawesome.com/38b6b4f5e7.js" crossorigin="anonymous"></script>
    </head>

    <body>

        <header>

            <div class="top-layer">

                <%@include file="header.jsp" %>


                    <!-- BODY -->
                                 
                    <%
	            		String fname = request.getParameter("fname");
	            		String lname = request.getParameter("lname");
	            		String nic = request.getParameter("nic");
	            		String phone = request.getParameter("phone");
	            		String email = request.getParameter("email");
	            		String username = request.getParameter("username");
                    %>

                    <div class="body">

                        <p><i class="fa-solid fa-circle-user user"></i></p>

                        <form action="UpdateProfile" method="POST">

                            <div class="main">

                                <div class="left">

                                    <div class="input">
                                        <label for="fname">First Name</label>
                                        <input type="text" name="fname" id="fname" value=<%= fname %> placeholder="Enter your first name"
                                            onkeyup="fnameValidation()">
                                        <p class="error " id="fnameError"></p>
                                    </div>
                                    <div class="input">
                                        <label for="lname">Last Name</label>
                                        <input type="text" name="lname" id="lname" value=<%= lname %> placeholder="Enter your last name"
                                            onkeyup="lnameValidation()">
                                        <p class="error " id="lnameError"></p>
                                    </div>
                                    <div class="input">
                                        <label for="NIC">NIC</label>
                                        <input type="text" name="nic" id="nic" value=<%= nic %> placeholder="Enter your NIC number"
                                            onkeyup="nicValidation()">
                                        <p class="error" id="nicError"></p>
                                    </div>



                                </div>

                                <div class="right">
                                    <div class="input">
                                        <label for="phone">Contact</label>
                                        <input type="text" name="contact" id="contact" value=<%= phone %> 
                                            placeholder="Enter your mobile number" onkeyup="contactValidation()">
                                        <p class="error " id="contactError"></p>
                                    </div>
                                    <div class="input">
                                        <label for="email">Email</label>
                                        <input type="text" name="email" id="email" placeholder="Enter your email" value=<%= email %>
                                            onkeyup="emailValidation()">
                                        <p class="error " id="emailError"></p>
                                    </div>
                                    <div class="input">
                                        <label for="username">Username</label>
                                        <input type="text" name="username" id="username"
                                            placeholder="Enter your username" value=<%= username %>  readonly onkeyup="usernameValidation()">
                                        <p class="error " id="usernameError"></p>
                                    </div>

                                </div>

                            </div>

                            <div class="signup-btn btn-btm"><input class="submit" type="submit" value="Update Profile"
                                    id="submit" name="submit" onclick="return validateForm()">
                            </div>

                        </form>
                    </div>

				
                    <script src="js/updateProfile.js"></script>

	            </div>


        </header>

        <!-- FOOTER -->

        <%@include file="footer.jsp" %>

    </body>

    </html>