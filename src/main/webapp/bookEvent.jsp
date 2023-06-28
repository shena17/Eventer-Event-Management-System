<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/register.css">
    <link rel="stylesheet" href="css/bookEvent.css">
    <title>Book Event</title>
    <link rel="icon" href="images/favicon.png" type="image/x-icon">
    <script src="https://kit.fontawesome.com/38b6b4f5e7.js" crossorigin="anonymous"></script>
</head>

<body>

    <header>

        <div class="top-layer">

            <%@include file="header.jsp" %>

            <!-- BODY -->

            <div class="body">

                <p>Book Your Event</p>

                <form action="BookingHandler" method="post">

                    <div class="main">

                        <div class="left">


                            <div class="input">
                                <label for="eventType">Select Event Type</label>
                                <select name="eventType" required>
                                    <option value="birthday">Birthday</option>
                                    <option value="party">Party</option>
                                    <option value="meeting">Meeting</option>
                                    <option value="wedding">Wedding</option>
                                </select>
                            </div>

                            <div class="input">
                                <label for="list">Include Options</label>

                                <div class="options">
                                    <span><input type="checkbox" name="list" value="food">
                                        <p>Food</p>
                                    </span>
                                    <span><input type="checkbox" name="list" value="music">
                                        <p>Music</p>
                                    </span>
                                    <span><input type="checkbox" name="list" value="photography">
                                        <p>Photography</p>
                                    </span>
                                    <span><input type="checkbox" name="list" value="deco">
                                        <p>Decorations</p>
                                    </span>
                                </div>
                            </div>
                        </div>

                        <div class="right">

                            <div class="input">
                                <label for="date">Select Date</label>
                                <input type="date" name="date" required>
                            </div>

                            <div class="input">
                                <label for="noOfGuest">Number of Guests</label>
                                <input type="number" name="noOfGuest" value="1" required>
                            </div>
                            <div class="input">
                                <label for="themeColor">Theme Color</label>
                                <input type="color" name="themeColor" class="color">
                            </div>
                        </div>

                    </div>

                    <div class="signup-btn"><input class="submit" type="submit" value="Next" id="submit" name="submit">
                    </div>

                </form>
            </div>

        </div>
    </header>

    <!-- FOOTER -->

    <%@include file="footer.jsp" %>



</body>

</html>