<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page isELIgnored="false" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-info">
  <div class="container-fluid">
      <i class="fa-solid fa-hospital me-2 text-white"></i>
    <a class="navbar-brand" href="index.jsp">Color Hospital</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" 
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">

        <c:if test="${empty userObj}">
          <li class="nav-item"><a class="nav-link active"aria-current="page" href="admin_login.jsp"> <i class="fa-solid fa-arrow-right-to-bracket me-0.5"></i> Admin</a></li>
        
          <li class="nav-item"><a class="nav-link active" aria-current="page" href="doctor_login.jsp">Doctor</a></li>
        
          <li class="nav-item"><a class="nav-link active" aria-current="page" href="<%= request.getContextPath() %>/user_login.jsp">User</a></li>
        
          <li class="nav-item"><a class="nav-link active" aria-current="page" href="user_appointment.jsp">Appointment</a></li>
        </c:if>
            

        <c:if test="${not empty userObj}">
            <li class="nav-item"><a class="nav-link active" aria-current="page" href="user_appointment.jsp">Appointment</a></li>
            <li class="nav-item"><a class="nav-link active" aria-current="page" href="#">Show Appointment</a></li>
          
            <div class="dropdown">
              <button class="btn btn-info dropdown-toggle text-white" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fa-solid fa-users"></i> ${userObj.fullName}
              </button>
              <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                <a class="dropdown-item" href="#">Change Password</a>
                <a class="dropdown-item" href="userLogout">Logout</a>
              
              </div>
            </div>
            
         </c:if>    
      </ul>
      
    </div>
  </div>
</nav>
