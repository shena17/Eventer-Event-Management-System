<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
 	<link rel="stylesheet" href="./css/supplier.css">
<title>Admin Dashboad</title>
</head>
<body>

	
    <section class="head">
        
        <a href="OrganizerDashboard"><div class="backbutton">Go Back</div></a>
        <input type="search">

        <div class="filter">
            <input type="checkbox" id="" name="" value="">Venue
            <input type="checkbox" id="" name="" value="">Deco
            <input type="checkbox" id="" name="" value="">Catering
            <input type="checkbox" id="" name="" value="">Music
            <input type="checkbox" id="" name="" value="">Photogrphy
        </div>

        <button><div class="backbutton" id="addBtn" onclick="openPopup()">Add New</div></button>

        <div class="popup" id="popup">
            <div class="regform">

                <div class="tableDiv">
                    <table>
                        <thead>
                            <tr>
                                <th>NO</th>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Type</th>
                                <th>Approve</th>
                            </tr>
                        </theah>
					<%int j =0; %>
					<c:forEach var="details" items="${SupPendDetails}">
	                			<c:url value="ApproveSupplier" var="Approve">
                      				<c:param name="id" value="${details.id}"/>
							</c:url>
							<%j++; %>
                        <tbody>
                            <tr>
                                <td><%out.println(j); %></td>
                                <td>${details.id}</td>
                                <td>${details.fname}</td>
                                <td>${details.email}</td>
                                <td><button><a href="${Approve}">Approve</a></button></td>
                            </tr>
                            
                           
                        </tbody>
                      </c:forEach>
                    </table>

                </div>

                <button onclick="closePopup()" class="okBtn">Ok</button>
            </div>
            
        </div>

        <script>
            let popup = document.getElementById("popup");


            function openPopup(){
                popup.classList.add("open-popup");
            }

            function closePopup(){
                popup.classList.remove("open-popup");
            }
        </script>
    
    </section>

    <section>
        <h2>Suppliers</h2>
        
        <div class="Table">
        
            <table>
                <thead>
                    <tr>
                        <th>NO</th>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>UserName</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                
                <% int i = 0; %>
                <c:forEach var="details" items="${SupDetails}">
	                <c:url value="DeleteSupplier" var="delete">
                      		<c:param name="id" value="${details.id}"/>
					</c:url>
					
					<%i++; %>
					
                <tbody>
                
                
                    <tr>
                        <td><%out.println(i);%></td>
                        <td>${details.id}</td>
                        <td>${details.fname}</td>
                        <td>${details.email}</td>
                        <td>${details.uname}</td>
                        <td><button><a href="${delete}">Remove</a></button></td>
                    </tr>

                    
                </tbody>
               </c:forEach>

            </table>
             
        </div>

    </section>
</body>
</html>