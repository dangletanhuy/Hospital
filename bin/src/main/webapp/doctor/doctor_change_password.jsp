<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.entity.Specialist"%>
<%@page import="com.dao.SpecialistDao"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="../component/allcss.jsp" %>
        <style type="text/css">
            .paint-card {
                box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
            }
        </style>
    </head>
    <body>
        <%@include file = "doctor_navbar.jsp" %>
        <c:if test="${empty doctorObj }"> 
            <c:redirect url="../doctor_login.jsp"></c:redirect> 
        </c:if>

        <div class="container p-4">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card paint-card">
                        <p class="text-center fs-3">Change Password</p>
                        <div class="card-body"> 
                            <c:if test="${not empty SuccMsg}">
                                <p class="text-center text-success fs-4"> ${SuccMsg}</p>
                                <c:remove var="SuccMsg" scope="session" />
                            </c:if> 
                                
                            <c:if test="${not empty ErrMsg}">
                                <p class="text-center text-danger fs-6"> ${ErrMsg}</p>
                                <c:remove var="ErrMsg" scope="session" />
                            </c:if> 
                            <form action="../doctorChangePassword" method="post"> 
                                <div class="mb-3"> 
                                    <label>Enter New Password</label> <input type="text" name="newPassword" class="form-control" required> 
                                </div> 
                                <div class="mb-3"> 
                                    <label>Enter Old Password</label> <input type="text" name="oldPassword" class="form-control" required> 
                                </div> 
                                <input type="hidden" value="${doctorObj.id}" name="uid">
                                <button class="btn btn-success col-md-12">Change Password</button> 
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </body>
</html>
