<!DOCTYPE html>

<html lang="en" dir="ltr">

  <head>
  
    <meta charset="UTF-8">
  
    <link rel="stylesheet" href="css/SupplierThanuka.css">
    <link rel="stylesheet" href="css/SearchResults.css">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     
   </head>
   
<body>

 <div class="container">
 
    <div class="title">Profile </div> <br>
    
        <div class="content">
        
           <table border = "2">
      
               <c:forEach var = "supp" items = "${suppDetails}"> 
               
               <c:set var = "id" value = "${supp.id1}"/>
               <c:set var = "FirstName" value = "${supp.FirstName}"/>
               <c:set var = "LastName" value = "${supp.LastName}"/>
               <c:set var = "Email" value = "${supp.Email}"/>
               <c:set var = "NIC" value = "${supp.NIC}"/>
               <c:set var = "UserName" value = "${supp.UserName}"/>
               <c:set var = "Password" value = "${supp.Passowrd}"/>  
               
        
        <div class="user-details">
        
            <div class="input-box">
          
                 <span class="details">
            
            <tr>
              <th> Supplier Id</th>
              <th> First Name</th>
              <th> Last Name</th>
               <th>Email</th>
               <th> NIC</th>
               <th> UserName</th>
               <th> Password</th>
           </tr>
                  </span>
            
            <tr>
               <td>${supp.id1}</td>
               <td>${supp.FirstName}</td>
               <td>${supp.LastName}</td>
               <td>${supp.Email}</td>
               <td>${supp.NIC}</td>
               <td>${supp.UserName}</td>
               <td>${supp.Password}</td>     
            </tr>
             

          </div>
          
         </div>
         
       </c:forEach>
       
    </table> <br><br> 
    
    <c:url value = "SupplierProUpdate.jsp" var = "suppupdate">
      
      <c:param name = "id" value = "${id}"/>
      <c:param name = "FirstName" value = "${FirstName}"/>
      <c:param name = "LastName" value = "${LastName}"/>
      <c:param name = "Email" value = "${Email}"/>
       <c:param name = "NIC" value = "${NIC}"/>
      <c:param name = "UserName" value = "${UserName}"/>
      <c:param name = "Password" value = "${Password}"/>
     
    </c:url>
      
        <center>
        
          <div class="button">
          
            <a href = "${suppupdate}"> 
          
            <input type="button" value="Update Data" name = "update"> </a>
            
           </div>
           
        </center>
        
     </div>
    
    </div>
  
 </body>

</html>
