<!DOCTYPE html>
<html lang="en" dir="ltr">

  <head>
  
    <meta charset="UTF-8">
  
    <link rel="stylesheet" href="css/SupplierThanuka.css">
    
    
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     
   </head>
   
<body>

    <%
    
         String id = request.getParameter("id");
         String firstname = request.getParameter("FirstName");
         String lastname = request.getParameter("LastName");
         String email = request.getParameter("Email");
         String nic = request.getParameter("NIC");
         String username = request.getParameter("UserName");
         String password = request.getParameter("Password");
    %>

  <div class="container">
 
     <div class="title">Profile</div>
    
        <div class="content">
    
           <form action="Supplierupdate">
           
              <div class="user-details">
              
                <div class="input-box">
          
                     <span class="details">First Name</span> 
                     
                     <input type="text" name="fname" id="fname" placeholder="Enter Your First Name" value = "<%=firstname%>" 
                      onkeyup="fnameValidation()">
                      <p class="error " id="fnameError"></p>
                 </div>
                 
              <div class="input-box">
          
                    <span class="details">Last Name</span>
                    
                    <input type="text" name="lname" id="lname" placeholder="Enter Your Last Name" value = "<%=lastname%>" 
                    onkeyup="lnameValidation()">
                   <p class="error " id="lnameError"></p>
                 </div>
              
              <div class="input-box">
          
                    <span class="details">UserName</span>
                    
                    <input type="text" name="username" id="username" placeholder="Enter Your UserName" value = "<%=username%>" 
                     onkeyup="usernameValidation()">
                   <p class="error " id="usernameError"></p>
                </div>
              
              <div class="input-box">
          
                   <span class="details">Email</span>
                   
                   <input type="text" name="email" id="email" placeholder="Enter Your Email" value = "<%=email%>"  
                    onkeyup="emailValidation()">
                   <p class="error " id="emailError"></p>
              </div>
              
              <div class="input-box">
          
                   <span class="details">Contact</span>
            
                   <input type="text" name="contact" id="contact" placeholder="Enter Your Mobile Number" value = ""   
                    onkeyup="contactValidation()">
                   <p class="error " id="contactError"></p>
              </div>
              
              <div class="input-box">
              
                   <span class="details">Password</span>
                   
                   <input type="password" name="pwd" id="pwd" placeholder="Create Your Password" value = "<%=password%>" 
                    onkeyup="pwdValidation()">
                   <p class="error " id="pwdError"></p>
             </div>
             
              <div class="input-box">
              
                   <span class="details">Confirm Password</span>
                   
                   <input type="password" id="confirmpwd" name="confirmpwd" placeholder="Confirm your password" onkeyup="confirmValidation()" value = ""> 
                  <p class="error " id="confirmpwdError"></p> 
              </div>
          
              <div class="input-box">
          
                   <span class="details">Budget</span>
            
                   <input type="text" name = "budget" placeholder="Enter Your New Budget" value = ""> 
              </div>
              
           </div>
        
           <div class="button">
           
          <input type="submit" value="Update Profile"> 
          
        </div>
        
      </form>
      
    </div>
    
  </div>
  
 <script src="js/SupplierProUpdate.js"> </script>
 
</body>

</html>
