<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/index.css">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/footer.css">
        <link rel="icon" href="images/favicon.png" type="image/x-icon">
        <script src="https://kit.fontawesome.com/38b6b4f5e7.js" crossorigin="anonymous"></script>
        <title>Eventer</title>

    </head>

    <body>

        <header>

            <div class="top-layer">

                <%@include file="header.jsp" %>


                    <div class="main-box">

                        <div class="intro" id="intro">
                            <script src="/js/index.js"></script>
                            <p><span class="underline">We Plan</span> The <span class="best-events">Best <span
                                        class="sub">Events</span></span></p>

                        </div>


                        <script type="module" src="/js/index.js"></script>

                        <div class="lead">
                            <div class="lead-content para">
                                <p>Plan your events now with Eventer.....</p>
                                
                                 <% if(session.getAttribute("username")==null){ %>

				                	<a href="login.jsp"><button class="btn1 btn">Event Planner</button></a>
				
				                <% } else { %>
				
									<a href="bookEvent.jsp"><button class="btn1 btn">Event Planner</button></a>
				                    
				                    <%} %>
                                
                                                                
                                <%if(session.getAttribute("username") == null){ %>
                                	<a href="#"><button class="btn2 btn btnAb">About us<i
                                            class="fa-solid fa-chevron-right"></i></button></a>
                                <%} else{ %>
                                
                                	<a href="DashboardNavigation"><button class="btn2 btn btnAb">Dashboard</button></a>
                                   <%}%>
                            </div>
                        </div>

                    </div>

            </div>
        </header>


        <!-- BODY -->

        <div class="topic serviceTopic">Eventer Latest Services</div>
        <div class="events">
            <div class="eventBody">
                <!-- Card 1-->

                <img class="eventImg grid" src="images/birthday.jpg" alt="birthday">
                <div class="description grid">
                    <p class="eventHeader ">Birthdays</p>
                    <p class="eventDescription">A birthday party is much more than a simple blowing out of candles. It
                        is a
                        combination of delicious food, good music and of course, good times! We are dedicated in making
                        your
                        birthday a memorable one by delivering a personalized experience.</p>
                </div>

                <!-- Card 2 -->
                <img src="images/wed1.jpg" alt="wedding" class="eventImg grid wed1">

                <div class="description grid">

                    <p class="eventHeader">Weddings</p>
                    <p class="eventDescription">We make your dreams come true! Let us create the perfect wedding for you
                        and
                        your partner. We make your dreams come true! Our weddings are unique from start to finish. We
                        provide
                        the best service you expect on your big day. Celebrations
                        with
                        your family and friends
                        will be unforgettable.</p>
                </div>

                <img src="images/wedding2.jpg" alt="wedding" class="eventImg grid">




                <!-- Card 3 -->
                <div class="description grid">
                    <p class="eventHeader ">Parties</p>
                    <p class="eventDescription">We specialise in producing major birthday parties. Whether you are
                        planning
                        a marquee party; a bespoke nightclub for a 21st Birthday; a mini festival or a decadent soiree
                        for a
                        50th. We have the experience and the
                        dedication
                        to
                        deliver your perfect event.
                    </p>
                </div>

                <img src="images/party.jpg" alt="party" class="eventImg grid">

            </div>

            <script src="js/transitions.js"></script>

        </div>

        <!-- MORE EVENTS -->

        <div class="moreEvents">

            <p>Discover more events......</p>
            <a href="#"><button class="btn2 btn moreBtn">Discover more<i class="fa-solid fa-chevron-right"></i>
                </button></a>

        </div>

        <!-- FOOTER -->

        <%@include file="footer.jsp" %>

    </body>

    </html>