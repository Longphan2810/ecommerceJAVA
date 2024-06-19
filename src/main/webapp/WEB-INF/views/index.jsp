<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="jakarta.tags.core" prefix="c" %>
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Neko Shop</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>

<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">


</head>
<body>

	<!-- Topbar Start -->
	<div class="container-fluid">
	
		<div class="row align-items-center py-3 px-xl-5">
			<div class="col-lg-3 d-none d-lg-block">
				<a href="/" class="text-decoration-none">
					<h1 class="m-0 display-5 font-weight-semi-bold">
						Neko Shop
					</h1>
				</a>
			</div>
			<div class="col-lg-6 col-6 text-left">
				<form action="/shop/filter" method="get">
					<div class="input-group">
						<input type="text" class="form-control"
							name="keywords"
							placeholder="Search for products">
						<div class="input-group-append">
							<button type="submit" class="btn border"  role="button"> <span
								class=" bg-transparent text-primary h-100">
									<i class="fa fa-search"></i>
							</span>
							</button>
						</div>
					</div>
				</form>
			</div>
			<div class="col-lg-3 col-6 text-right">
				<!-- shopping  cart -->
				 <a href="/shopCart" class="btn border"> <i
					class="fas fa-shopping-cart text-primary"></i> <span class="badge text-dark fs-6">${sessionScope.sizeCart}</span>
				</a>
			</div>
		</div>
	</div>
	<!-- Topbar End -->

	<!-- Navbar Start -->
	<div class="container-fluid mb-5">
		<div class="row border-top px-xl-5">
			<div class="col-lg-3 d-none d-lg-block">
				
					<a class="btn-lg btn py-3 shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-bs-toggle="collapse"
						href="#collapseExample" role="button" aria-expanded="false"
						aria-controls="collapseExample"> Categories 
						 <i class="fa fa-angle-down text-dark"></i>
						</a>
				
				<div class="collapse show" id="collapseExample">
					<div class="card card-body">
					<nav class="collapse show navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0" id="navbar-vertical">
                    <div class="navbar-nav w-100 overflow-hidden" style="height: 410px">
                        
                        <c:forEach var="cate" items="${listCate}">
                         <a href="/shop/${cate.name}" class="nav-item nav-link">${cate.name}</a>
                        </c:forEach>
                        
                       
                        
                    </div>
                </nav>
					</div>
				</div>
			</div>
			<div class="col-lg-9">
				<nav
					class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
					<a href="" class="text-decoration-none d-block d-lg-none">
						<h1 class="m-0 display-5 font-weight-semi-bold">
							<span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper
						</h1>
					</a>
								 <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
					<div class="collapse navbar-collapse justify-content-between p-3"
						id="navbarSupportedContent">
						<div class="navbar-nav mr-auto py-0">
							<a href="/" class="nav-item nav-link active">Home</a> <a
								href="/shop" class="nav-item nav-link">Shop</a> 
							
							
						</div>
						
						
						<c:if test="${userCurrent==null}">
						<div class="navbar-nav ml-auto py-0">
							<a href="login-form" class="nav-item nav-link">Login</a>
							 <a href="/register-form"
								class="nav-item nav-link">Register</a>
						</div>
						
						</c:if>
						<c:if test="${userCurrent!=null}">
						<div class="navbar-nav ml-auto py-0">
							
							 <a href="/infoCostumer"
								class="nav-item nav-link">Thông tin tài khoản</a>
								 <a href="/log-out"
								class="nav-item nav-link">Log-out</a>
						</div>
						
						</c:if>
						
					</div>
				</nav>

				<!-- Slide start -->

				<div id="carouselExampleRide" class="carousel slide"
					data-bs-ride="true">
					<div class="carousel-inner">
						<div class="carousel-item active" style="height: 410px;">
							<img src="img/carousel-1.jpg" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item" style="height: 410px;">
							<img src="img/carousel-2.jpg" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item" style="height: 410px;">
							<img src="img/carousel-1.jpg" class="d-block w-100" alt="...">
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleRide" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleRide" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
				<!-- Slide end -->


			</div>
		</div>
	</div>
	<!-- Navbar End -->
	
	
    <!-- Featured Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5 pb-3">
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                    <h1 class="fa fa-check text-primary m-0 mr-3"></h1>
                    <h5 class="font-weight-semi-bold m-0">Quality Product</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                    <h1 class="fa fa-shipping-fast text-primary m-0 mr-2"></h1>
                    <h5 class="font-weight-semi-bold m-0">Free Shipping</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                    <h1 class="fas fa-exchange-alt text-primary m-0 mr-3"></h1>
                    <h5 class="font-weight-semi-bold m-0">14-Day Return</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                    <h1 class="fa fa-phone-volume text-primary m-0 mr-3"></h1>
                    <h5 class="font-weight-semi-bold m-0">24/7 Support</h5>
                </div>
            </div>
        </div>
    </div>
    <!-- Featured End -->
    
   
       <!-- Products Start -->
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">Trandy Products</span></h2>
        </div>
        <div class="row  container w-100 mx-auto  px-xl-5 pb-3">
          
          <c:forEach var="product" items="${listProductIndex}">
          <jsp:include page="./component/product2.jsp">
          <jsp:param value="${product.idProduct}" name="id"/>
          	<jsp:param value="${product.nameImage}" name="image"/>
         	 <jsp:param value="${product.name}" name="name"/>	
         	 <jsp:param value="${product.price}" name="price"/>
          </jsp:include>
          
          </c:forEach>
          
         
           			
					
          
           
         
            
         
         
        </div>
    </div>
    <!-- Products End -->

    
    <!-- Footer Start -->
   	<%@ include file="./component/footer.jsp" %>
	
    <!-- Footer End -->
    

</body>
</html>