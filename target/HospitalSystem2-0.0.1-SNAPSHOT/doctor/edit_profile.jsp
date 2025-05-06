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
                        <p class="text-center fs-3">Edit Profile</p>
                        <c:if test="${not empty SuccMsgD}">
                                <p class="text-center text-success fs-4"> ${SuccMsgD}</p>
                                <c:remove var="SuccMsgD" scope="session" />
                            </c:if> 
                                
                            <c:if test="${not empty ErrMsgD}">
                                <p class="text-center text-danger fs-6"> ${ErrMsgD}</p>
                                <c:remove var="ErrMsgD" scope="session" />
                            </c:if>
                        <div class="card-body">
                            <form action="../doctorUpdateProfile" method="post">
                                <div class="mb-4">
                                    <label class="form-label">Full Name </label> 
                                    <input  type="text" required name="fullname" class="form-control" value="${doctorObj.fullName}">
                                </div>

                                <div class=" mb-3">
                                    <label class="form-label">Day Of Birth </label>
                                    <input  type="date" required name="dob" class="form-control" value="${doctorObj.dob}">
                                </div>
                                
                                <div class=" mb-3">
                                    <label class="form-label">Qualification </label>
                                    <input  type="text" required name="quali" class="form-control" value="${doctorObj.quali}">
                                </div>
                                
                                <div class="mb-3">
                                     <label class="form-label">Specialist </label>
                                     <select required name="specialist" class="form-control">
                                     <option value="">${doctorObj.specialist}</option>
                                 <% 
                                    SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
                                    List<Specialist> list = dao.getAllSpecialist();
                                    for (Specialist s : list) { 
                                %>
                                         <option value="<%= s.getId() %>"><%= s.getSpecialistName() %></option>
                                    <% 
                                           } 
                                  %>
                                    </select>
                                </div>
                                <div class=" mb-3">
                                    <label class="form-label">Phone Number </label>
                                    <input  type="number" required name="phoneno" class="form-control" value="${doctorObj.phoneNo}">
                                </div>
                                <input type="hidden" name="id" value="${doctorObj.id}">
    
                                <button type="submit" class="btn btn-primary">Apply</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
