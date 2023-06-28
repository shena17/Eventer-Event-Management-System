<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

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
                            
                             <% if(session.getAttribute("username")==null){ %>

				                	<li><a href="login.jsp">Events</a></li>
				
				                <% } else { %>
				
									<li><a href="bookEvent.jsp">Events</a></li>
				                    
				                    <%} %>
				                    
                            
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Services</a></li>

                            <% if(session.getAttribute("username")==null){ %>

                                <li><a href="login.jsp" class="loginBtn"><button class="nav-btn">LOGIN<i
                                                class="fa-solid fa-right-to-bracket"></i></button></a></li>

                                <% } else { %>

                                    <li>
                                        <form><button class="userProfile" type="submit" formaction="userProfile"><i
                                                    class="fa-solid fa-user-circle"></i></button></form>
                                    </li>
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