<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.db.DBConnect" %>
<%@ page import="com.dao.DoctorDao" %>
<%@ page import="com.entity.Doctor" %>
<%@ page import="com.dao.AppointmentDao" %>
<%@ page import="com.entity.Appointment" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Patient</title>
        <%@include file="../component/allcss.jsp" %>
    </head>
    <style type="text/css">
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
        }
    </style>
    <body>
        <%@include file = "doctor_navbar.jsp" %>
        <c:if test="${empty doctorObj }"> 
            <c:redirect url="../doctor_login.jsp"></c:redirect> 
        </c:if>
        <div class="container p-3">
            <div class="row">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="fs-3 text-center">Patient Details</p> 
                        <c:if test="${not empty SuccMsg}">
                               <p class="text-center text-success fs-4"> ${SuccMsg}</p>
                               <c:remove var="SuccMsg" scope="session" />
                           </c:if> 
                               
                            <c:if test="${not empty ErrMsg}">
                                <p class="text-center text-danger fs-6"> ${ErrMsg}</p>
                                <c:remove var="ErrMsg" scope="session" />
                            </c:if> 

                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Full Name</th>
                                    <th scope="col">Gender</th>
                                    <th scope="col">Age</th>
                                    <th scope="col">Appointment Date</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Phone No</th>
                                    <th scope="col">Diseases</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% 
                                Doctor d = (Doctor) session.getAttribute("doctorObj");
                                AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
                                List<Appointment> list = dao.getAllAppointmentByDoctorLogin(d.getId());
                                for (Appointment ap: list) {%>
                                    <tr>
                                        <th><%= ap.getFullName() %></th>
                                        <td><%= ap.getGender() %></td>
                                        <td><%= ap.getAge() %></td>
                                        <td><%= ap.getAppointDate() %></td>
                                        <td><%= ap.getEmail() %></td>
                                        <td><%= ap.getPhNo() %></td>
                                        <td><%= ap.getDiseases() %></td>
                                        <td><%= ap.getStatus() %></td>
                                        <td>
                                            <% 
                                            if ("Pending".equals(ap.getStatus())) {%>
                                                <a href="comment.jsp?id=<%=ap.getId() %>" class="btn btn-success btn-sm">Comment</a>
                                            <%} else { %>
                                                <a href="#" class="btn btn-success btn-sm disabled">Comment</a>
                                            <%    
                                            }
                                            %>
                                            
                                        </td>
                                    </tr>
                                <%
                                }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
