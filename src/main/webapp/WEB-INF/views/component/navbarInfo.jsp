<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Topbar Start -->
	<div class="container-fluid" >

		<div class="row align-items-center py-3 px-xl-5">
			<div class="col-lg-3 d-none d-lg-block">
				<a href="/" class="text-decoration-none">
					<h1 class="m-0 display-5 font-weight-semi-bold">Neko Shop</h1>
				</a>
			</div>
			<div class="col-lg-6 col-6 text-left">
				<form action="">
					<div class="input-group">
						<input type="text" class="form-control"
							placeholder="Search for products">
						<div class="input-group-append">
							<a href="#"> <span
								class="input-group-text bg-transparent text-primary h-100">
									<i class="fa fa-search"></i>
							</span>
							</a>
						</div>
					</div>
				</form>
			</div>
			<div class="col-lg-3 col-6 text-right">
				<!-- shopping cart -->
				<a href="/shopCart" class="btn border"> <i
					class="fas fa-shopping-cart text-primary"></i> <span class="badge text-dark fs-6">${sessionScope.sizeCart}</span>
				</a>
			</div>
		</div>
	</div>
	<!-- Topbar End -->
	
	<!-- Navbar Start -->
	<div class="container-fluid ">
		<div class="row border-top px-xl-5">
			
			<div class="col-lg-12">
				<nav
					class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0"
					style="background-color: white;">
					<a href="" class="text-decoration-none d-block d-lg-none">
						<h1 class="m-0 display-5 font-weight-semi-bold">neko shop</h1>
					</a>
							 <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
					<div class="collapse navbar-collapse justify-content-between p-3" style="background: white"
						id="navbarSupportedContent">
						<div class="navbar-nav mr-auto py-0">
							<a href="/" class="nav-item nav-link active">Home</a> <a
								href="/shop" class="nav-item nav-link">Shop</a> 
							
							
						</div>
						
						<c:if test="${userCurrent==null}">
						<div class="navbar-nav ml-auto py-0">
							<a href="/login-form" class="nav-item nav-link">Login</a>
							 <a href="/register-form"
								class="nav-item nav-link">Register</a>
						</div>
						
						</c:if>
						<c:if test="${userCurrent!=null}">
						<div class="navbar-nav ml-auto py-0">
							
							 <a href="/infoCostumer"
								class="nav-item nav-link">Thông tin tài khoản</a>
						</div>
						
						</c:if>
						
						
					</div>
				</nav>
			

			</div>
		</div>
	</div>
	<!-- Navbar End -->
	
