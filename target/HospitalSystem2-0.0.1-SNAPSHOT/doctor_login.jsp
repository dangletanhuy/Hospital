<%-- 
    Document   : doctor_logn
    Created on : Feb 22, 2025, 6:48:55 PM
    Author     : Chocmao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style type="text/css">
    .paint-card {
        box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
}
</style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Doctor Login</title>
        <%@include file="component/allcss.jsp" %>
    </head>
    <body>
       <%@include file="component/navbar.jsp" %>
       
       <div class="container p-5">
           <div class="row">
               <div class="col-md-4 offset-md-4">
                   <div class="card paint-card">
                       <div class="card-body">
                           <p class ="fs-4 text-center">Doctor Login</p>    
                           <form action="#" method="post">
                               <div class="mb-4">
                                   <label class="form-label">Email </label> <input required name="email" type="email" class="form-control">
                               </div>
                               
                               <div class="mb-4"
                                    <label class="form-label">Password</label>
                                    <input required name ="password" type ="password" class="form-control">
                               </div>
                                    
                               <button type ="submit" class="btn bg-info text-white col-md-12">Login</button> 
                           </form>
                           
                           <br>Not have an account? <a href="component/signup.jsp" class="text-decoration-none">Create Account</a>  
                           
                       </div>
                   </div>
               </div> 
           </div>
       </div>   
    
  </body>
</html>
