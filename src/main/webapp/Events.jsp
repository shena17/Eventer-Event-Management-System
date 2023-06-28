<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	 <link rel="stylesheet" href="./css/supplier.css">
	<title>Insert title here</title>
</head>
<body>

	<section class="head" id="specialHeadEvent">
        
        <a href="OrganizerDashboard"><div class="backbutton">Go Back</div></a>
        <h2>Events</h2>

        <div class="filter" id="filter">
            <input type="checkbox" id="" name="" value="">Upcomming
            <input type="checkbox" id="" name="" value="">Ongoing
            <input type="checkbox" id="" name="" value="">Past
        </div>
        <input type="search">

    
    </section>

    <section>
        <div class="Table">
            <table>
                <thead>
                    <tr>
                        <th id="specialHeadEventRows">NO</th>
                        <th>EID</th>
                        <th>UID</th>
                        <th>VID</th>
                        <th>Date</th>
                        <th>Budget</th>
                        <th>No of Guests</th>
                        <th>Status</th>
                        <th>Delete</th>
                        
                    </tr>
                </thead>
                
                <%int i=0; %>
                <c:forEach var="details" items="${EventDetails}">
	                <c:url value="DeleteEvent" var="delete">
                      		<c:param name="id" value="${details.eid}"/>
					</c:url>
					
					<% i++; %>
                <tbody>
                    <tr>
                        <td id="specialHeadEventRows"><%out.println(i); %></td>
                        <td>${details.eid}</td>
                        <td>${details.uid}</td>
                        <td>${details.vid}</td>
                        <td>${details.date}</td>
                        <td>${details.budget}</td>
                        <td>${details.noOfGuest}</td>
                        <td>${details.status}</td>
                        <td><button><a href="${delete}">Remove</button></a></td>
                    </tr>
                    
                </tbody>
                 </c:forEach>

            </table>
        </div>

    </section>

</body>


</body>
</html>