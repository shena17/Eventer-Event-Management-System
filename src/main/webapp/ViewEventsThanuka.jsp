<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Events</title>

   <link rel="stylesheet" href="css/SupplierThanuka.css">
    <link rel="stylesheet" href="css/SearchResults.css">

</head>
<body>

 <div class="container">
 
    <div class="title">Events </div> <br>
    
        <div class="content">
        
           <table border = "2">  
           
        <div class="user-details">
        
            <div class="input-box">
          
                 <span class="details">
            
            <tr>
              <th> Event ID</th>
              <th> Venue ID</th>
              <th> Date </th> 
              <th> Color</th>
              <th> No Of Guests</th>
             
           </tr>
                  </span>
            
            <c:forEach var="e" items="${details}">
            <tr>
               <td>${eid}</td>
               <td>${vid}</td>
               <td>${Date}</td>
               <td>${Color}</td>
               <td>${NoOfGuests}</td>
            </tr>
             </c:forEach>

          </div>
          
         </div>
         
       
    </table> 
    
      
    
     </div>
    
    </div>



</body>
</html>