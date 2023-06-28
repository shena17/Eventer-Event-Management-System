<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/login.css">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/footer.css">
        <title>Login</title>
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

                        <a href="register.jsp" class="loginIcon"><i class="fa-solid fa-user-plus"></i></a>

                        <ul class="navigation">
                            <li><a href="index.jsp">Home</a></li>
                            <li><a href="#">Events</a></li>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Services</a></li>

                            <li><a href="register.jsp" class="loginBtn"><button class="nav-btn">SIGN UP<i
                                            class="fa-solid fa-user-plus"></i></button></a></li>
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

                <div class="intro" id="intro">

                </div>

                <script type="module" src="js/index.js"></script>



                <!-- BODY -->
                <div class="body">

                    <div class="login-body">

                        <div class="left">

                            <div class="intro">

                                <p>Let's Party</p>

                            </div>

                        </div>

                        <div class="right">

                            <p class="login-topic">Login</p>

                            <form method="POST" action="loginUser">

                                <div class="input">
                                    <label for="username">Username</label>
                                    <input type="text" name="username" id="username" placeholder="Enter Username"
                                        onkeyup="usernameValidation()">
                                    <p class="error " id="usernameError"></p>
                                </div>

                                <div class="input">
                                    <label for="pwd">Password</label>
                                    <input type="password" name="pwd" id="pwd" placeholder="Enter Password"
                                        onkeyup="pwdValidation()">
                                    <p class="error " id="pwdError"></p>
                                </div>

                                <div class="forgot-pwd"><a href="resetPwd.jsp">Forgot Password?</a></div>

                                <div><input type="submit" value="Login" class="login-btn"
                                        onclick="return validateSubmit()">
                                </div>

                                <p class="or">or</p>

                                <a href="https://www.google.lk/" class="google">
                                    <div class="google"><img src="images/google-color-icon.svg" alt="google"
                                            class="google">
                                        Log in
                                        with Google</div>
                                </a>


                            </form>

                            <script src="js/login.js"></script>

                            <div class="newAcc">
                                <p>New to Eventer?
                                    <a href="register.jsp">Create Account</a>
                                </p>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </header>

        <!-- FOOTER -->

        <%@include file="footer.jsp" %>



    </body>

    </html>