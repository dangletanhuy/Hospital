<%@ page import="com.dao.SpecialistDao" %> 
<%@ page import="com.entity.Specialist" %>
<%@ page import="java.util.List" %>
<%@ page import="com.db.DBConnect" %>
<%@ page import="com.dao.DoctorDao" %>
<%@ page import="com.entity.Doctor" %>




<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8" />
    <title>title</title>
    <%@include file="../component/allcss.jsp" %>
</head>
<body>
    <%@include file="adm_navbar.jsp" %>

    <div class="container-fluid p-3">
        <div class="row">
            <div class="col-md-3">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class ="fs-3 text-center">Add Doctor </p>

                        <c:if test="${not empty ErrMsg}">
                            <p class="fs-3 text-center text-danger">${ErrMsg}</p>
                               <c:remove var="ErrMsg" scope="session"/>
                        </c:if>

                        <c:if test="${not empty SuccMsg}">
                            <div class="fs-3 text-center text-success" role="alert">${SuccMsg}</div>
                               <c:remove var="SuccMsg" scope="session"/>
                        </c:if>
                            </div>
                        <form action="../addDoctor" method="post">
                            <div class="mb-4">
                                <label class="form-label">Name </label> 
                                <input  type="text" required name="fullname" class="form-control">
                            </div>

                            <div class=" mb-3">
                                <label class="form-label">Email </label>
                                <input  type="email" required name="email" class="form-control">
                            </div>

                            <div class=" mb-3">
                                <label class="form-label">Day Of Birth </label>
                                <input  type="date" required name="dob" class="form-control">
                            </div>
                            
                            <div class=" mb-3">
                                <label class="form-label">Qualification </label>
                                <input  type="text" required name="quali" class="form-control">
                            </div>
                            
                            <div class="mb-3">
                                 <label class="form-label">Specialist </label>
                                 <select required name="specialist" class="form-control">
                                 <option value="">Select</option>
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
                                <input  type="number" required name="phoneno" class="form-control">
                            </div>

                            <div class=" mb-3">
                                <label class="form-label">Password </label>
                                <input  type="password" required name="password" class="form-control">
                            </div>

                            <button type="submit" class="btn btn-primary"> Add </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    <div class ="col md-8">
        <div class="card paint-card">
            <div class="card-body">
                <p class ="fs-3 text-center"> Doctor List </p>
                <table class="table">
                    <thead>
                        <tr>
                            <th> Name </th>
                            <th> Email </th>
                            <th> DOB </th>
                            <th> Qualification</th>
                            <th> Specialist </th>
                            <th> Phone Number </th>
                            <th> Action </th>
                        </tr>
                    </thead>
                    <tbody>
                         <%
        DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
        List<Doctor> list2 = dao2.getAllDoctor();
        for (Doctor d : list2) {
    %>
        <tr>
            <td><%= d.getFullName() %></td>
            <td><%= d.getEmail() %></td>
            <td><%= d.getDob() %></td>
            <td><%= d.getQuali() %></td>
            <td><%= d.getSpecialist() %></td>
            <td><%= d.getPhoneNo() %></td>
            <td>
                <a href="edit_doctor.jsp?id=<%= d.getId() %>"
                class="btn btn-primary">Edit</a>
                <a href="#" class="btn btn-danger">Delete</a>
            </td>
        </tr>
    <%
        }
    %>


                    </tbody>
                        
                </table>
        </div>
    </div>
</body>
</html>