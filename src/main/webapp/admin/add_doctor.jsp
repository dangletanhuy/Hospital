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
    <title>Add Doctor</title>
    <%@include file="../component/allcss.jsp" %>
    <style type="text/css">
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
        }
    </style>
</head>
<body>
    <%@include file="adm_navbar.jsp" %>

    <div class="container-fluid p-3">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card paint-card">
                    <p class ="fs-3 text-center">Add Doctor </p>
                    <div class="card-body">
                        <c:if test="${not empty ErrMsg}">
                            <p class="fs-3 text-center text-danger">${ErrMsg}</p>
                               <c:remove var="ErrMsg" scope="session"/>
                        </c:if>

                        <c:if test="${not empty SuccMsg}">
                            <div class="fs-3 text-center text-success" role="alert">${SuccMsg}</div>
                               <c:remove var="SuccMsg" scope="session"/>
                        </c:if>
                        <form action="../addDoctor" method="post">
                            <div class="mb-3">
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
                                            <option value="<%= s.getSpecialistName() %>"><%= s.getSpecialistName() %></option>
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
    
</body>
</html>