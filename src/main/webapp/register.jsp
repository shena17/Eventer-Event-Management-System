<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/footer.css">
        <link rel="stylesheet" href="css/register.css">
        <title>SignUp</title>
        <link rel="icon" href="images/favicon.png" type="image/x-icon">
        <script src="https://kit.fontawesome.com/38b6b4f5e7.js" crossorigin="anonymous"></script>
    </head>

    <body>

        <header>

            <div class="top-layer">

                <%@include file="header.jsp" %>


                    <!-- BODY -->

                    <div class="body">

                        <p>Sign Up</p>

                        <form action="registerUser" method="POST">

                            <div class="main">

                                <div class="left">


                                    <div class="input">
                                        <label for="fname">First Name</label>
                                        <input type="text" name="fname" id="fname" placeholder="Enter your first name"
                                            onkeyup="fnameValidation()">
                                        <p class="error " id="fnameError"></p>
                                    </div>
                                    <div class="input">
                                        <label for="lname">Last Name</label>
                                        <input type="text" name="lname" id="lname" placeholder="Enter your last name"
                                            onkeyup="lnameValidation()">
                                        <p class="error " id="lnameError"></p>
                                    </div>
                                    <div class="input">
                                        <label for="NIC">NIC</label>
                                        <input type="text" name="nic" id="nic" placeholder="Enter your NIC number"
                                            onkeyup="nicValidation()">
                                        <p class="error" id="nicError"></p>
                                    </div>
                                    <div class="input">
                                        <label for="phone">Contact</label>
                                        <input type="text" name="contact" id="contact"
                                            placeholder="Enter your mobile number" onkeyup="contactValidation()">
                                        <p class="error " id="contactError"></p>
                                    </div>


                                </div>

                                <div class="right">

                                    <div class="input">
                                        <label for="email">Email</label>
                                        <input type="text" name="email" id="email" placeholder="Enter your email"
                                            onkeyup="emailValidation()">
                                        <p class="error " id="emailError"></p>
                                    </div>
                                    <div class="input">
                                        <label for="username">Username</label>
                                        <input type="text" name="username" id="username"
                                            placeholder="Enter your username" onkeyup="usernameValidation()">
                                        <p class="error " id="usernameError"></p>
                                    </div>
                                    <div class="input">
                                        <label for="pwd">Create Password</label>
                                        <input type="password" name="pwd" id="pwd" placeholder="Create your password"
                                            onkeyup="pwdValidation()">
                                        <p class="error " id="pwdError"></p>
                                    </div>
                                    <div class="input">
                                        <label for="confirmpwd">Confirm Password</label>
                                        <input type="password" id="confirmpwd" name="confirmpwd"
                                            placeholder="Confirm your password" onkeyup="confirmValidation()">
                                        <p class="error " id="confirmpwdError"></p>
                                    </div>
                                </div>

                            </div>

                            <div class="signup-btn"><input class="submit" type="submit" value="Create Account"
                                    id="submit" name="submit" onclick="return validateForm()">
                            </div>

                        </form>

                        <p class="or">or</p>

                        <a href="https://www.google.lk/" class="google">
                            <div class="google"><img src="images/google-color-icon.svg" alt="google" class="google">
                                Sign Up
                                with Google</div>
                        </a>
                    </div>

                    <script src="js/signup.js"></script>

            </div>
        </header>

        <!-- FOOTER -->

        <%@include file="footer.jsp" %>


    </body>

    </html>