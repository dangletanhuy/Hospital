<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="component/allcss.jsp" %>
        <style type="text/css">
            .paint-card {
                box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
            }
        </style>
    </head>
    <body>
        <%@include file="component/navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <p class="text-center fs-3">Change Password</p> 
                        <div class="card-body"> 
                            <form> 
                                <div class="mb-3"> 
                                    <label>Enter New Password</label> <input type="text" name="newPassword" class="form-control" required> 
                                </div> 
                                <div class="mb-3"> 
                                    <label>Enter Old Password</label> <input type="text" name="oldPassword" class="form-control" required> 
                                </div> 
                                <button class="btn btn-success col-md-12">Change Password</button> 
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
