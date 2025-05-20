<%@page contentType="text/html" pageEncoding="UTF-8"%><%@ page import="com.db.DBConnect" %>
<%@ page import="com.entity.Doctor" %>
<%@ page import="com.dao.AppointmentDao" %>
<%@ page import="com.entity.Appointment" %>
<%@ page import="com.entity.User" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
            .paint-card {
                box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
            }
        </style>
        <%@include file = "../component/allcss.jsp" %>
    </head>
    <body>
        <%@include file = "doctor_navbar.jsp" %>
        <c:if test="${empty doctorObj }"> 
            <c:redirect url="../doctor_login.jsp"></c:redirect> 
        </c:if>
        
        <div class="container p-3">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card paint-card">
                        <div class="card-body">
                            <p class="text-center fs-4">Patient Comment</p>
                            <% 
                            int id = Integer.parseInt(request.getParameter("id"));
                            AppointmentDao dao = new AppointmentDao(DBConnect.getConn());

                            Appointment ap = dao.getAppointmentById(id);
                            %> 
                            <form action="../updateStatus" method="post" class="row">
                                <div class="col-md-6">
                                    <label for="">Patient Name</label>
                                    <input type="text" readonly value="<%=ap.getFullName() %>" class="form-control">
                                </div>

                                <div class="col-md-6">
                                    <label for="">Age</label>
                                    <input type="text" readonly value="<%=ap.getAge() %>" class="form-control">
                                </div>

                                <div class="col-md-6">
                                    <label for="">Mob No</label>
                                    <input type="text" readonly value="<%=ap.getPhNo() %>" class="form-control">
                                </div>

                                <div class="col-md-6">
                                    <label for="">Diseases</label>
                                    <input type="text" readonly value="<%=ap.getDiseases() %>" class="form-control">
                                </div>

                                <div class="col-md-12">
                                    <br> <label>Comment</label>
                                    <textarea required name="comm" class="form-control" rows="3" cols=""></textarea>
                                </div>

                                <input type="hidden" name="id" value="<%=ap.getId() %>"> 
                                <input type="hidden" name="did" value="<%=ap.getDoctorId() %>">
                                <button class="mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
