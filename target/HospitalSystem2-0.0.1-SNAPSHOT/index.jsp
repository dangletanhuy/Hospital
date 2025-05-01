<%@page import="com.db.DBConnect" %>
<%@page import="java.sql.Connection" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index Page</title>
        <%@include file="component/allcss.jsp" %>
<style type="text/css">
    .paint-card {
        box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
}
</style>
                    
    </head>
    <body>
        <%@include file="component/navbar.jsp" %>
            
        
<!--        slide to introduce-->

<div id="carouselExampleIndicators" class="carousel slide position-relative">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="image/hosp2.jpg" class="d-block w-100" alt="..." height="700px">
    </div>
    <div class="carousel-item">
      <img src="image/hosp1.jpg" class="d-block w-100" alt="..." height="700px">
    </div>
    <div class="carousel-item">
      <img src="image/doc3.jpg" class="d-block w-100" alt="..." height="700px">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
        <div class="container p-3">
		<p class="text-center fs-2 ">Why Choose Our Hospital?</p>

		<div class="row">
			<div class="col-md-8 p-5">
				<div class="row">
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-4">Expert & Caring Doctors </p>
								<p> Our highly skilled doctors provide top-quality care with dedication and compassion.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-4">Advanced Medical Technology</p>
								<p>Cutting-edge equipment for accurate diagnosis and effective treatment.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-5">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-4">Patient-Centered Care</p>
								<p>We prioritize comfort, safety, and personalized treatment for every patient.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-5">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-4">Experienced & Compassionate Staff</p>
								<p>Highly skilled doctors, nurses, and medical professionals is dedicated to providing the best patient care</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<img alt="" src="image/caringdoct.jpg">
			</div>

		</div>
	</div>

<hr>
 
<div class="container p-2">
		<p class="text-center fs-2 ">Our Team</p>
		
		<div class="row">
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="image/doct1.jpg" width="250px" height="300px">
						<p class="fw-bold fs-5">Dr.Mau</p>
						<p class="fs-7">(CEO & Chairman)</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="image/doct2.jpg" width="250px" height="300px">
						<p class="fw-bold fs-5">Dr. Rooney</p>
						<p class="fs-7">(Chief Doctor)</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="image/doct3.jpg" width="250px" height="300px">
						<p class="fw-bold fs-5">Dr. Cr7</p>
						<p class="fs-7">(Chief Doctor)</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="image/doct4.jpg" width="250px" height="300px">
						<p class="fw-bold fs-5">Dr. Mbappe</p>
						<p class="fs-7">(Chief Doctor)</p>
					</div>
				</div>
			</div>

		</div>

	</div>

<%@include file="component/footer.jsp" %>
    </body>
</html>
