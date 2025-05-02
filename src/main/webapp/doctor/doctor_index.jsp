<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.db.DBConnect" %>
<%@ page import="com.dao.DoctorDao" %>
<%@ page import="com.entity.Doctor" %>
<!DOCTYPE html>
<html>
    <style type="text/css">
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
        }
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Doctor Index</title>
        <%@include file = "../component/allcss.jsp" %>
    </head>
    <body>
        <%@include file = "doctor_navbar.jsp" %>
        <c:if test="${empty doctorObj }"> 
            <c:redirect url="../doctor_login.jsp"></c:redirect> 
        </c:if>
        <p class="text-center fs-3">Doctor Dashboard</p>
        <div class="container p-5">
            <% 
            Doctor d = (Doctor) session.getAttribute("doctorObj");
            DoctorDao dao = new DoctorDao(DBConnect.getConn());
            %>
            <div class="row">
                <div class="col-md-4 offset-md-2">
                    <div class="card paint-card">
                        <div class="card-body text-center text-success">
                            <i class="fas fa-user-md fa-3x"></i><br>
                            <p class="fs-4 text-center">
                                Doctor <br><%= dao.countDoctor() %>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card paint-card">
                        <div class="card-body text-center text-success">
                            <i class="far fa-calendar-check fa-3x"></i><br>
                            <p class="fs-4 text-center">
                                Total Appointment <br><%= dao.countAppointmentByDoctorId(d.getId()) %>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
