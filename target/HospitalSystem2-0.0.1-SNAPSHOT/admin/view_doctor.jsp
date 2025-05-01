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
    <title>View Doctor</title>
    <%@include file="../component/allcss.jsp" %>
</head>
<body>
    <%@include file="adm_navbar.jsp" %>

    <div class="container-fluid p-3">
        <div class="row">    
    
    

        <div class ="col md-12">
            <div class="card paint-card">
                <div class="card-body">
                    <p class ="fs-3 text-center"> Doctor List </p>
                    <c:if test="${not empty ErrMsg}">
                            <p class="fs-3 text-center text-danger">${ErrMsg}</p>
                               <c:remove var="ErrMsg" scope="session"/>
                        </c:if>

                        <c:if test="${not empty SuccMsg}">
                            <div class="fs-3 text-center text-success" role="alert">${SuccMsg}</div>
                               <c:remove var="SuccMsg" scope="session"/>
                        </c:if>
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
                        
                    <a href="../deleteDoctor?id=<%=d.getId()%>" 
                        class="btn btn-danger">Delete</a>
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