
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page isELIgnored="false"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="allcss.jsp" %>
<style type="text/css">
    .paint-card {
        box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
}
</style>
    </head>
    <body>
         <%@include file="navbar.jsp" %>
         <div class="container p-5">
           <div class="row">
               <div class="col-md-4 offset-md-4">
                   <div class="card paint-card">
                       <div class="card-body">
                           <p class ="fs-4 text-center">Register Account</p> 
                           
                           <c:if test="${not empty SucMsg}">
                               <p class="text-center text-success fs-4"> ${SucMsg}</p>
                               <c:remove var="SucMsg" scope="session" />
                           </c:if> 
                               
                            <c:if test="${not empty ErrMsg}">
                                <p class="text-center text-danger fs-4"> ${ErrMsg}</p>
                                <c:remove var="ErrMsg" scope="session" />
                            </c:if> 
                               
                           <form action="<%= request.getContextPath() %>/user_register" method="post">
                               <div class="mb-4">
                                   <label class="form-label">Full Name/User Name</label> <input required name="fullname" type="text" class="form-control">
                               </div>
                               
                               <div class="mb-4">
                                    <label class="form-label">Email</label> <input required name="email" type="email" class="form-control">
                               </div>

                               <div class="mb-4"
                                    <label class="form-label">Password</label>
                                    <input required name ="password" type ="password" class="form-control">
                               </div>
                                    
                               <button type ="submit" class="btn bg-info text-white col-md-12">Register</button> 
                           </form>
                           
                           
                           
                       </div>
                   </div>
               </div> 
           </div>
       </div>   
    </body>
</html>
