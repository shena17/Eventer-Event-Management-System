<html>
<head>
<meta charset = "UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel = "stylesheet" href = "css\styleThanuka.css">
<link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

<title> Supplier DASHBOARD PANEL </title>

</head>

<body>

<nav>
        <div class="logo-name">
        
            <div class="logo-image">
            
                <img src="images\favicon.png" alt="" style = "width : 500px height  500px;">
            </div>
            

            <span class="logo_name">Eventer</span>
            
        </div>

        <div class="menu-items">
        
            <ul class="nav-links">
            
                <li><a href="#">
                <i class="uil uil-estate"></i>
                    
                    <span class="link-name">Dashboard</span>
                    
                </a></li><br>
                
				 <li><a href="ViewEvents">
                    <i class="uil uil-chart"></i>
                    
                    <span class="link-name">View Events</span> 
                    
                </a></li><br>
                
				 <li><a href="ViewPastEvents">  <!-- EventsThanuka.jsp -->
                    <i class="uil uil-chart"></i>
                    
                    <span class="link-name">View Past Events</span> 
                    
                </a></li> <br>
				
				 <li><a href="">
                    <i class="uil uil-chart"></i>
                    
                    <span class="link-name">View Upcoming Events</span> 
                    
                </a></li> <br>
				
                <li><a href="Offers.jsp">
                
                    <i class="uil uil-thumbs-up"></i>
                    <span class="link-name">Add Offers</span> 
                    
                </a></li><br>
                
                 <li><a href="">
                    <i class="uil uil-chart"></i>
                    
                    <span class="link-name">View Ratings/Feedbacks</span> 
                    
                </a></li><br>
            </ul>
			
			 <ul class="logout-mode">
			 
                <li><a href="LogoutUser">
                    <i class="uil uil-signout"></i>
                    
                    <span class="link-name">Logout</span> 
                    
                </a></li>

                <li class="mode">
                
                    <a href="#">
                        <i class="uil uil-moon"></i>
                        
                    <span class="link-name">Dark Mode</span>
                </a>

                <div class="mode-toggle">
                
                  <span class="switch"></span>
                  
                </div>
              </li>
              
            </ul>
            
        </div>
        
    </nav>
	
	<section class="dashboard">
        <div class="top">
            <i class="uil uil-bars sidebar-toggle"></i>

           <div class="search-box">
                <i class="uil uil-search"></i>
				<a href ="searchpage.jsp"> <input type="text" placeholder="Search here..."> </a>
				</div>
            <a href = "SupplierAccount.jsp">
            <img src="images\profile.jpg" alt="" style = "width : 100px; height : 100px"></a>
        </div>
		
		<div class="dash-content">
            <div class="overview">
                <div class="title">
                    <i class="uil uil-tachometer-fast-alt"></i>
                    <span class="text">Dashboard</span>
                </div>
				
				<div class="boxes">
                    <div class="box box1">
                        <i class="uil uil-thumbs-up"></i>
                        <span class="text">Total Likes</span>
                        <span class="number">75,120</span>
                    </div>
                    <div class="box box2">
                        <i class="uil uil-comments"></i>
                        <span class="text">Comments</span>
                        <span class="number">20,250</span>
                    </div>
                    <div class="box box3">
                        <i class="uil uil-share"></i>
                        <span class="text">Total Share</span>
                        <span class="number">15,965</span>
                    </div>
                </div>
            </div>
			
			 <div class="activity">
                <div class="title">
                    <i class="uil uil-clock-three"></i>
                    <span class="text">Recent Activity</span>
                </div>
				
				<div class="activity-data">
                    <div class="data names">
                        <span class="data-title">Name</span>
                        <span class="data-list">Thomas Shelby</span>
                        <span class="data-list">Jhon Shelby</span>
                        <span class="data-list">Martin Garix</span>
                        <span class="data-list">Charlie Puth</span>
                        <span class="data-list">Shawn Mendes</span>
                        <span class="data-list">Ava Max</span>
                        <span class="data-list">Micheal Jordan</span>
                    </div>
					
					<div class="data email">
                        <span class="data-title">Email</span>
                        <span class="data-list">tmShlbY@gmail.com</span>
                        <span class="data-list">jhnSheblY@gmail.com</span>
                        <span class="data-list">MartinG@gmail.com</span>
                        <span class="data-list">CharliePPu@gmail.com</span>
                        <span class="data-list">ShawnMendsde@gmail.com</span>
                        <span class="data-list">AvamaXX@gmail.com</span>
                        <span class="data-list">MichealJorDDAn@gmail.com</span>
                    </div>
					
					<div class="data joined">
                        <span class="data-title">Joined</span>
                        <span class="data-list">2022-05-12</span>
                        <span class="data-list">2022-05-12</span>
                        <span class="data-list">2022-05-13</span>
                        <span class="data-list">2022-05-13</span>
                        <span class="data-list">2022-05-14</span>
                        <span class="data-list">2022-05-14</span>
                        <span class="data-list">2022-05-15</span>
                    </div>
					
					<div class="data type">
                        <span class="data-title">Type</span>
                        <span class="data-list">New</span>
                        <span class="data-list">Member</span>
                        <span class="data-list">Member</span>
                        <span class="data-list">New</span>
                        <span class="data-list">Member</span>
                        <span class="data-list">New</span>
                        <span class="data-list">Member</span>
                    </div>
					
					<div class="data status">
                        <span class="data-title">Status</span>
                        <span class="data-list">Liked</span>
                        <span class="data-list">Liked</span>
                        <span class="data-list">Liked</span>
                        <span class="data-list">Liked</span>
                        <span class="data-list">Liked</span>
                        <span class="data-list">Liked</span>
                        <span class="data-list">Liked</span>
                    </div>
                </div>
            </div>
        </div>
    </section>
	
	<script src="js\scriptThanuka.js"></script>
</body>
</html>