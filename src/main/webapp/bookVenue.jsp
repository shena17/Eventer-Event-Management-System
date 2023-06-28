<%@page import="com.model.Venue" %>
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
                <link rel="stylesheet" href="css/bookVenue.css">
                <link rel="stylesheet" href="css/resetPwd.css">
                <title>Book Supplier</title>
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

                                    <p class="login-topic">Book Supplier</p>

                                    <form action="BookSupplierHandler" method="post">

                                        <div class="input">
                                            <label for="venue">Venue</label>
                                            <select name="venue">
                                                <c:forEach var="cus" items="${Venue}">
                                                    <option value="${cus.vid}">${cus.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>

                                        <div class="input">
                                            <label for="name">Food</label>
                                            <c:forEach var="sup" items="${Supplier}">
                                                <c:if test="${sup.type=='food'}">
                                                    <span><input type="radio" name="food" value="${sup.sid }">
                                                        <div class="detail">
                                                            <p>Name : ${sup.name}</p>
                                                            <p>Price : $${sup.price}</p>
                                                        </div>
                                                    </span>
                                                </c:if>
                                            </c:forEach>

                                        </div>


                                        <div class="input">
                                            <label for="name">Decorations</label>
                                            <c:forEach var="sup" items="${Supplier}">
                                                <c:if test="${sup.type=='deco'}">
                                                    <span><input type="radio" name="deco" value="${sup.sid }">
                                                        <div class="detail">
                                                            <p>Name : ${sup.name}</p>
                                                            <p>Price : $${sup.price}</p>
                                                        </div>
                                                    </span>
                                                </c:if>
                                            </c:forEach>
                                        </div>

                                        <div class="input">
                                            <label for="name">Photography</label>
                                            <c:forEach var="sup" items="${Supplier}">
                                                <c:if test="${sup.type=='photography'}">
                                                    <span><input type="radio" name="photography" value="${sup.sid }">
                                                        <div class="detail">
                                                            <p>Name : ${sup.name}</p>
                                                            <p>Price : $${sup.price}</p>
                                                        </div>
                                                    </span>
                                                </c:if>
                                            </c:forEach>
                                        </div>

                                        <div class="input">
                                            <label for="name">Music</label>
                                            <c:forEach var="sup" items="${Supplier}">
                                                <c:if test="${sup.type=='music'}">
                                                    <span><input type="radio" name="music" value="${sup.sid }">
                                                        <div class="detail">
                                                            <p>Name : ${sup.name}</p>
                                                            <p>Price : $${sup.price}</p>
                                                        </div>
                                                    </span>
                                                </c:if>
                                            </c:forEach>
                                        </div>


                                        <div><input type="submit" value="Submit" class="login-btn">
                                        </div>


                                    </form>

                                </div>
                            </div>

                        </div>
                    </div>
                </header>

                <!-- FOOTER -->

                <footer>

                    <div class="footer">

                        <div class="btm"><img src="images/eventer.png" alt="logo" class="logo footerLogo"></div>

                        <div class="btm">

                            <p class="footHead">Quick Links</p>

                            <ul>
                                <li><a href="#"><i class="fa-solid fa-chevron-right"></i>Home</a></li>
                                <li><a href="#"><i class="fa-solid fa-chevron-right"></i>Events</a></li>
                                <li><a href="#"><i class="fa-solid fa-chevron-right"></i>Suppliers</a></li>
                                <li><a href="#"><i class="fa-solid fa-chevron-right"></i>Feedback</a></li>
                            </ul>

                        </div>

                        <div class="btm">

                            <p class="footHead">Our Services</p>

                            <ul>
                                <li><a href="#"><i class="fa-solid fa-chevron-right"></i>Wedding</a></li>
                                <li><a href="#"><i class="fa-solid fa-chevron-right"></i>Birthday</a></li>
                                <li><a href="#"><i class="fa-solid fa-chevron-right"></i>Party</a></li>
                                <li><a href="#"><i class="fa-solid fa-chevron-right"></i>Conference</a></li>
                            </ul>

                        </div>

                        <div class="btm footerIcons">

                            <p class="footHead head3">Get in touch</p>

                            <ul class="social">
                                <li><a href="#"><i class="fa-brands fa-instagram"></i></a></li>
                                <li><a href="#"><i class="fa-brands fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa-brands fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa-brands fa-youtube"></i></a></li>
                                <li><a href="#"><i class="fa-brands fa-pinterest"></i></a></li>
                            </ul></a>

                            <p class="contactBar"><a href="#"><i
                                        class="fa-regular fa-envelope"></i>eventergroup@gmail.com</a></p>

                        </div>

                    </div>

                </footer>



            </body>

            </html>