/**
 * 
 */
 
 /*<script type="text/javascript">

        const dbar = document.querySelector(".detailedBar");
        const dbutton = document.querySelector(".detailedBar button");

        dbutton.addEventListener("click", ()=>{

            const visible = dbar.getAttribute("hash");

            if(visible == "false"){
                dbar.setAttribute("hash", true);
            }

            else if(visible == "true"){
                dbar.setAttribute("hash", false);
            }


        } )




       
    </script>*/


    let sidebar = document.querySelector(".side-bar");
    let sidebarBtn = document.getElementById("true");

    sidebarBtn.onclick = function(){
        sidebar.classList.toggle("active");
    }

    
    /*if(document.getElementById("checkbtn").checked){

        let sidebar = document.querySelector(".side-bar");
        sidebar.classList.toggle("active");
    }*/
    
  
document.getElementById("checkbtn").addEventListener("click", ()=>{
var hash = document.getElementById("checkbtn").checked;
                               
if(hash){
    let sidebar = document.querySelector(".side-bar");
    let navbar = document.querySelector(".navbar");
    let dashboard = document.querySelector(".dashboard");
    let sellings = document.querySelector(".sellings");
    let orders = document.querySelector(".orders");

    sidebar.classList.add("dark");
    navbar.classList.add("dark");
    dashboard.classList.add("dark-dashboard");
    sellings.classList.add("dark-sellings");
    orders.classList.add("dark-orders");

}

else if(!hash){
    let sidebar = document.querySelector(".side-bar");
    let navbar = document.querySelector(".navbar");
    let dashboard = document.querySelector(".dashboard");
    let sellings = document.querySelector(".dark-sellings");
    let orders = document.querySelector(".dark-orders");

    sidebar.classList.remove("dark");
    navbar.classList.remove("dark");
    dashboard.classList.remove("dark-dashboard");
    sellings.classList.remove("dark-sellings");
    orders.classList.remove("dark-orders");
   
}
})
      


//Register Form popup
let popup = document.getElementById("popup");

function openPopup(){
    popup.classList.add("open-popup");
}

function closePopup(){
    popup.classList.remove("open-popup");
}