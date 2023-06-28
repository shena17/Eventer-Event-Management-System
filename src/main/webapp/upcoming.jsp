<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/ceb392bc28.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/upcoming.css">
    <title>Upcoming Events</title>
</head>
<body>
    <div class="main">
        <div class="left">
            <div class="logo">
                <img src="images/logo.png" at="logo">
            </div>
            <c:url value="DashBordController" var="dashBoard">
            	<c:param name="godash" value="home"></c:param>
            </c:url>
            <c:url value="DashBordController" var="upcomming">
            	<c:param name="godash" value="upcomming"></c:param>
            </c:url>
            
            <c:url value="DashBordController" var="past">
            	<c:param name="godash" value="past"></c:param>
            </c:url>
            
            <div class="sidebar">
               <!-- sidebar --> 
               <ul>
                <a href="${dashBoard}" class="text"><li><i class="fa-solid fa-house"></i>Home</li></a>
                <a href="bookEvent.jsp" class="text"><li><i class="fa-solid fa-bookmark"></i>Book Event</li></a>
                <a href="${upcomming}" class="text"><li><i class="fa-solid fa-calendar-days"></i>Upcoming Events</li></a>
                <a href="${past}" class="text"><li><i class="fa-solid fa-calendar-check"></i>Past Events</li></a>
                <a href="notification.jsp" class="text"><li><i class="fa-solid fa-bell"></i>Notifications</li></a>
                <a href="supplierview.jsp" class="text"><li><i class="fa-solid fa-boxes-packing"></i>View suppliers</li></a>
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
            <div class="rightlower">
                <div class="content content-main" data-visible="true">
                    <table>
                        <tr>
                            <th>EventID</th>
                            <th>Event Type</th>
                            <th>Venue</th>
                            <th>Date</th>
                            <th>Status</th>
                            <th></th>
                        </tr>
                         <c:forEach var="e" items="${events}">
                              <tr>
                                <td>${e.eid}</td>
                                <td>${e.eType}</td>
                                <td>${e.venue}</td>
                                <td>${e.date}</td>
                                <td>${e.status}</td>
                                
                                <c:url value="EventUpdateControler" var="eventUpdate">
            						<c:param name="update" value="${e.eid}"></c:param>
           						</c:url>
           						<c:url value="DeleteEventController" var="deleteEvent">
            						<c:param name="delete" value="${e.eid}"></c:param>
           						</c:url>
           						<c:url value="PayEvent" var="payEvent">
            						<c:param name="id" value="${e.eid}"></c:param>
           						</c:url>
                                 	<td class="btnPanel">
                                        <a href="${eventUpdate}"><button type="submit" class="btnLine" id="details" name="update" value="${e.eid}">Edit</button></a>
                                        <a href="${payEvent }"><button type="submit" class="btnLine" id="details" name="delete" value="${e.eid}">Payment</button></a>
                               		    <a href="${deleteEvent}"><button type="submit" class="delete" name="delete" value="${e.eid}"><i class="fa-solid fa-trash" class="deleteIcon"></i></button></a>
                                    </td>
                            </tr>
                        </c:forEach>
                       <!--  <tr>
                            <td>1000</td>
                            <td>Party</td>
                            <td>Taj</td>
                            <td>02/01/2022</td>
                            <td>Confirmed</td>
                            <td class="buttonPanel"><button type="button" class="details " id="details">Details</button><button type="button" class="details deleteBtn" id="details">Delete</button></td>
                        </tr> 
                        <tr>
                            <td>1000</td>
                            <td>Party</td>
                            <td>Taj</td>
                            <td>02/01/2022</td>
                            <td>Confirmed</td>
                            <td class="buttonPanel"><button type="button" class="details " id="details">Details</button><button type="button" class="details deleteBtn" id="details">Delete</button></td>
                        </tr>  
                        <tr>
                            <td>1000</td>
                            <td>Party</td>
                            <td>Taj</td>
                            <td>02/01/2022</td>
                            <td>Confirmed</td>
                            <td class="buttonPanel"><button type="button" class="details " id="details">Details</button><button type="button" class="details deleteBtn" id="details">Delete</button></td>
                        </tr>    
                        <tr>
                            <td>1000</td>
                            <td>Party</td>
                            <td>Taj</td>
                            <td>02/01/2022</td>
                            <td>Confirmed</td>
                            <td class="buttonPanel"><button type="button" class="details" id="details">Details</button><button type="button" class="details" id="details">Delete</button></td>
                        </tr>    
                        <tr>
                            <td>1000</td>
                            <td>Party</td>
                            <td>Taj</td>
                            <td>02/01/2022</td>
                            <td>Confirmed</td>
                            <td class="buttonPanel"><button type="button" class="details " id="details">Details</button><button type="button" class="details deleteBtn" id="details">Delete</button></td>
                        </tr>    
                        <tr>
                            <td>1000</td>
                            <td>Party</td>
                            <td>Taj</td>
                            <td>02/01/2022</td>
                            <td>Confirmed</td>
                            <td class="buttonPanel"><button type="button" class="details " id="details">Details</button><button type="button" class="details deleteBtn" id="details">Delete</button></td>
                        </tr> -->    
                    </table>
                    
                </div>

<!--                 popup

                <div class="content popup" data-visible="false">
                    <table>
                        <tr class="header">
                            <th></th>
                            <th></th>
                        </tr>
                        <tr class="tr2">
                            <td>EventID</td>
                            <td>1000</td>
                        </tr> 
                        <tr>
                            <td>Event Type</td>
                            <td>Party</td>
                        </tr>  
                        <tr>
                            <td>Venue</td>
                            <td>Taj</td>
                        </tr>    
                        <tr>
                            <td>Date</td>
                            <td>02/01/2022</td>
                        </tr>    
                        
                        <tr>
                            <td>Food</td>
                            <td>Included</td>
                        </tr>  
                        <tr>
                            <td>Photography</td>
                            <td>Included</td>
                        </tr>
                        <tr>
                            <td>Music</td>
                            <td>Null</td>
                        </tr>
                        <tr>
                            <td>Decorations</td>
                            <td>Included</td>
                        </tr>  
                        <tr>
                            <td>Budget</td>
                            <td>10000</td>
                        </tr>             

                    </table>

                    <div class="btnSet">
                    <a href="#"><button type="button" id="pay">Payment</button></a>
                    <button type="button" class="back" id="back">Back</button>
                     </div>


                </div> -->

                <!-- <script>
                    const display = document.querySelectorAll(".details");
                    const hide = document.querySelector(".popup");
                    const main = document.querySelector(".content-main");

                    for (let i = 0; i < display.length; i++) {

                        display[i].addEventListener("click", () => {
                            const Visibility = hide.getAttribute("data-visible");

                            if (Visibility == "false") {
                                main.setAttribute("data-visible", false);
                                hide.setAttribute("data-visible", true);
                            }
                            if (Visibility == "true") {
                                main.setAttribute("data-visible", true);
                                hide.setAttribute("data-visible", false);
                            }
                        });

                    }

                    const back = document.querySelector(".back");

                    back.addEventListener("click", () => {
                        const Visibility = hide.getAttribute("data-visible");

                            if (Visibility == "false") {
                                main.setAttribute("data-visible", false);
                                hide.setAttribute("data-visible", true);
                            }
                            if (Visibility == "true") {
                                main.setAttribute("data-visible", true);
                                hide.setAttribute("data-visible", false);
                            }
                    });

                </script>

                </script> -->
            </div>

            
        </div>
    </div>

</body>
</html>