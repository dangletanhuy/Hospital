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
    <title>Edit Doctor</title>
    <%@include file="../component/allcss.jsp" %>
</head>
<body>
    <%@include file="adm_navbar.jsp" %>

    <div class="container-fluid p-3">
        <div class="row">
            <div class="col-md-3 offset md-4 mx-auto">
                <div class="card paint-card border-0">
                    <div class="card-body">
                        <p class ="fs-3 text-center">Edit Doctor Details</p>

                        <c:if test="${not empty ErrMsg}">
                            <p class="fs-3 text-center text-danger">${ErrMsg}</p>
                               <c:remove var="ErrMsg" scope="session"/>
                        </c:if>

                        <c:if test="${not empty SuccMsg}">
                            <div class="fs-3 text-center text-success" role="alert">${SuccMsg}</div>
                               <c:remove var="SuccMsg" scope="session"/>
                        </c:if>
                            
                        <%
                        int id = Integer.parseInt(request.getParameter("id"));
                        DoctorDao dao2 = new DoctorDao(DBConnect.getConn()); 
                        Doctor d = dao2.getDoctorById(id);
                        
                        %>


                        <form action="../updateDoctor" method="post">
                            <div class="mb-4">
                                <label class="form-label">Name </label> 
                                <input  type="text" required name="fullname" class="form-control" 
                                value="<%= d.getFullName() %>">
                            </div>

                            <div class=" mb-3">
                                <label class="form-label">Email </label>
                                <input  type="email" required name="email" class="form-control"
                                value="<%= d.getEmail() %>">
                            </div>

                            <div class=" mb-3">
                                <label class="form-label">Day Of Birth </label>
                                <input  type="date" required name="dob" class="form-control"
                                value="<%= d.getDob() %>">
                            </div>
                            
                            <div class=" mb-3">
                                <label class="form-label">Qualification </label>
                                <input  type="text" required name="quali" class="form-control"
                                value="<%= d.getQuali() %>">
                            </div>
                            
                            <div class="mb-3">
                                 <label class="form-label">Specialist </label>
                                 <select required name="specialist" class="form-control">
                                 <option value=""><%= d.getSpecialist() %></option>
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
                                <input  type="number" required name="phoneno" class="form-control"
                                value="<%= d.getPhoneNo() %>">
                            </div>

                            <div class=" mb-3">
                                <label class="form-label">Password </label>
                                <input  type="text" required name="password" class="form-control"
                                value="<%= d.getPassword()%>">
                            </div>

                            <input type="hidden" name="id" value="<%=d.getId()%>">

                            <button type="submit" class="btn btn-primary col-md-12">Update</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</body>
</html>