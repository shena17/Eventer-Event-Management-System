<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>


    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/footer.css">
        <link rel="stylesheet" href="css/resetPwd.css">
        <title>Reset Password</title>
        <link rel="icon" href="images/favicon.png" type="image/x-icon">
        <script src="https://kit.fontawesome.com/38b6b4f5e7.js" crossorigin="anonymous"></script>
    </head>

    <body>

        <header>

            <div class="top-layer">

                <%@include file="header.jsp" %>

                    <!-- BODY -->
                    <div class="body">

                        <div class="login-body">


                            <div class="right">

                                <p class="login-topic">Reset Password</p>

                                <form method="post" action="ResetPwd">

                                    <div class="input username-form">
                                        <label for="username">Username</label>
                                        <input type="text" name="username" id="username" placeholder="Confirm your Username"
                                            onkeyup="usernameValidation()">
                                        <p class="error " id="usernameError"></p>
                                    </div>

                                    <div class="input">
                                        <label for="pwd">Enter a new password</label>
                                        <input type="password" name="pwd" id="pwd" placeholder="Enter Password"
                                            onkeyup="pwdValidation()">
                                        <p class="error " id="pwdError"></p>
                                    </div>

                                    <div class="input">
                                        <label for="pwd">Confirm Password</label>
                                        <input type="password" id="confirmPwd" name="confirmPwd"
                                            placeholder="Confirm password" onkeyup="confirmValidation()">
                                        <p class="error " id="confirmpwdError"></p>
                                    </div>

                                    <div><input type="submit" value="Reset" class="login-btn" name="submit" id="submit"
                                            onclick="return validateForm()">

                                    </div>

                                    <script src="js/resetPwd.js"></script>

                                </form>


                            </div>
                        </div>

                    </div>
            </div>
        </header>

        <!-- FOOTER -->

        <%@include file="footer.jsp" %>



    </body>

    </html>