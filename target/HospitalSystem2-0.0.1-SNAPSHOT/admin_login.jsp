<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page isELIgnored="false"  %>
<!DOCTYPE html>
<html>
    <style type="text/css">
    .paint-card {
        box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
    }
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>
        <%@include file="component/allcss.jsp" %>
    </head>
    <body>
        <%@include file="component/navbar.jsp" %>
         <div class="container p-5">
           <div class="row">
               <div class="col-md-4 offset-md-4">
                   <div class="card paint-card">
                       <div class="card-body">
                           <p class ="fs-4 text-center">Admin Login</p> 
                           
                           <c:if test="${not empty SuccMsg}">
                               <p class="text-center text-success fs-4"> ${SuccMsg}</p>
                               <c:remove var="SuccMsg" scope="session" />
                           </c:if> 
                               
                            <c:if test="${not empty ErrMsg}">
                                <p class="text-center text-danger fs-6"> ${ErrMsg}</p>
                                <c:remove var="ErrMsg" scope="session" />
                            </c:if>                          
                           
                           <form action="adminLogin" method="post">
                               <div class="mb-4">
                                   <label class="form-label"> Username or Email </label> 
                                   <input required name="email" type="text" class="form-control">
                               </div>
                               
                               <div class="mb-4"
                                    <label class="form-label">Password</label>
                                    <input required name ="password" type ="password" class="form-control">
                               </div>
                                    
                               <button type ="submit" class="btn bg-info text-white col-md-12">Login</button> 
                           </form>
                           
                       </div>
                   </div>
               </div> 
           </div>
       </div>   
    </body>
</html>
