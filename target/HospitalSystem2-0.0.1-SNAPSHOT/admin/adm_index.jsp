

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
        <%@include file="adm_navbar.jsp" %>
        
        <c:if test ="${ empty adminObj}">
            <c:redirect url="../admin_login.jsp"></c:redirect>
        </c:if> 
        
        <div class="container p-5">
		<p class="text-center fs-3">Admin Dashboard</p>
		<c:if test="${not empty ErrMsg}">
			<p class="fs-3 text-center text-danger">${ErrMsg}</p>
			<c:remove var="ErrMsg" scope="session" />
		</c:if>
		<c:if test="${not empty SuccMsg}">
			<div class="fs-3 text-center text-success" role="alert">${SuccMsg}</div>
			<c:remove var="SuccMsg" scope="session" />
		</c:if>
		
		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">
							Doctor <br>6
						</p>
					</div>
				</div>
			</div>



			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-circle fa-3x"></i><br>
						<p class="fs-4 text-center">
							User <br>33
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Total Appointment <br>12
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-4 mt-2">

				<div class="card paint-card " data-bs-toggle="modal"
					data-bs-target="#exampleModal">
					<div class="card-body text-center text-success">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Specialist <br>4
						</p>
					</div>
				</div>

			</div>

		</div>
	</div>
  
  <!-- Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	  <div class="modal-content">
		<div class="modal-header">
		  <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
		  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		</div>
		<form action="../addSpecialist" method="post">
			<div class="modal-body">
			  <div class="form-group">
				<label>Enter Specialist Name</label>
				<input type="text" class="form-control" name="speName" required>
			  </div>
			</div>
	
			<!-- Modal Footer: Close + Add Button -->
			<div class="modal-footer">
			  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			  <button type="submit" class="btn btn-primary">Add</button>
			</div>
		  </form>
	  </div>
	</div>
  </div>
      
    </body>
</html>
