<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="css/SupplierThanuka.css">

<meta charset="ISO-8859-1">
<title>Offers Form</title>
</head>
<body>

 <div class="container">
 
     <div class="title">Offers</div>
    
        <div class="content">
    
           <form action="offers">
           
              <div class="user-details">
              
                <div class="input-box">
          
                     <span class="details">Offer Name</span>
                     
                     <input type="text" name="oname" id="oname" placeholder="Enter Your Offer Name"> 
                     
                 </div>
                 
              <div class="input-box">
          
                    <span class="details">Rate</span>
                    
                    <input type="text" name="rate" id="rate" placeholder="Enter Your Rate">
      
                 </div>
              
              <div class="input-box">
          
                    <span class="details">Description</span>
                   
                   <textarea id = "description" name = "description" rows= "4" cols = "50"> </textarea> 
                   
                </div> 
              
           <div class="button"> <br><br><br>
           
          <input type="submit" value="Submit"> 
          
        </div>
        
        </div>
        
      </form>
      
    </div>
    
  </div>

</body>

</html>