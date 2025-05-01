<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.dao.SpecialistDao" %> 
<%@ page import="com.entity.Specialist" %>
<%@ page import="java.util.List" %>
<%@ page import="com.db.DBConnect" %>
<%@ page import="com.dao.DoctorDao" %>
<%@ page import="com.entity.Doctor" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Appointment</title>
        <%@include file="component/allcss.jsp" %>
        <style>
            .paint-card {
                box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
                margin-top: 50px;
            }
          
        </style>
    </head>
    <body>
        <%@include file="component/navbar.jsp" %>
        <%
             if (session.getAttribute("userObj") == null) {
                session.setAttribute("loginMsg", "Please Login First");
                response.sendRedirect("user_login.jsp");
                return;
            }
        %>

        <div class="contianer p-3">
            <div class="row">
                <div class="col-md-6 p-5">
                    <img src="image/caringdoct.jpg" alt="">
                </div>

                <div class="col-md-6">
                    <div class="card paint-card">
                        <div class="card-body">
                            <p class="text-center fs-3">User Appointment</p>
                            <c:if test="${not empty SuccMsg}">
                               <p class="text-center text-success fs-4"> ${SuccMsg}</p>
                               <c:remove var="SuccMsg" scope="session" />
                           </c:if> 

                            <c:if test="${not empty ErrMsg}">
                                <p class="text-center text-danger fs-6"> ${ErrMsg}</p>
                                <c:remove var="ErrMsg" scope="session" />
                            </c:if>

                            <form class="row g-3" action="addAppointment" method="post">
                                <input type="hidden" name="userid" value="${userObj.id}">

                                <div class="col-md-6"> 
                                    <label for="inputEmail4" class="form-label">Full Name</label> 
                                    <input required type="text" class="form-control" name="fullname"> 
                                </div> 

                                <div class="col-md-6"> 
                                    <label>Gender</label> 
                                    <select class="form-control" name="gender" required> 
                                        <option value="male">Male</option> 
                                        <option value="female">Female</option> 
                                    </select> 
                                </div> 

                                <div class="col-md-6"> 
                                    <label for="inputEmail4" class="form-label">Age</label> 
                                    <input required type="number" class="form-control" name="age"> 
                                </div>

                                <div class="col-md-6"> 
                                    <label for="inputEmail4" class="form-Label">Appointment Date</label> 
                                    <input type="date" class="form-control" required name="appoint_date"> 
                                </div> 

                                <div class="col-md-6"> 
                                    <label for="inputEmail4" class="form-Label">Email</label> 
                                    <input required type="email" class="form-control" name="email"> 
                                </div> 

                                <div class="col-md-6"> 
                                    <label for="inputEmail4" class="form-label">Phone No</label> 
                                    <input maxlength="10" required type="number" class="form-control" name="phno"> 
                                </div> 
                                
                                <div class="col-md-6"> 
                                    <label for="inputEmail4" class="form-Label">Diseases</label> 
                                    <input required type="text" class="form-control" name="diseases"> 
                                </div>

                                <div class="col-md-6"> 
                                    <label for="inputPassword4" class="form-label">Doctor</label> 
                                    <select class="form-control" name="doct" required> 
                                        <option value="male">--Select--</option>
                                        
                                        <% 
                                        DoctorDao dao = new DoctorDao(DBConnect.getConn()); 
                                        List<Doctor> list = dao.getAllDoctor();
                                        for(Doctor d:list) {
                                        %>
                                        <option value="<%=d.getId()%>"><%= d.getFullName() %> (<%=d.getSpecialist()%>)
                                        </option>
                                        <%
                                        }
                                        %>

                                    </select> 
                                </div>

                                <div class="col-md-12"> 
                                    <label>Full Address</label> 
                                    <textarea required name="address" class="form-control" rows="3" cols=""></textarea> 
                                </div> 

                                <button class="col-md-6 offset-md-3 btn btn-success">Submit</button> 
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </body>
</html>
