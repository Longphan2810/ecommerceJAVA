<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<script src="https://kit.fontawesome.com/bceea5e627.js"
	crossorigin="anonymous"></script>

</head>
<body>

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
					class="fas fa-shopping-cart text-primary"></i> <span class="badge">0</span>
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
						<div class="navbar-nav ml-auto py-0">
							<a href="/login" class="nav-item nav-link">Login</a> <a href="/login"
								class="nav-item nav-link">Register</a>
						</div>
					</div>
				</nav>
			

			</div>
		</div>
	</div>
	<!-- Navbar End -->






	<!-- Page Header Start -->
	<div class="container-fluid  my-3 m-auto row">
		<!-- side menu  -->
		<div class="col-3 ">

			<!-- account -->
			<div class="row">



				<div class="ms-5 my-2">
					Tài Khoản của <br> <span style="font-weight: bold;">Nguyen
						van a </span>
				</div>
			</div>


			<div class="list-group">
				<a href="/infoCostumer"
					class="list-group-item list-group-item-action " aria-current="true">
					<i class="fa-solid fa-user me-3"></i>Thông tin tài khoản
				</a> <a href="/orderCostumer"
					class="list-group-item list-group-item-action"> <i
					class="fa-solid fa-file-invoice me-3"></i> Quản lý đơn hàng
				</a> <a href="/locationCostumer"
					class="list-group-item list-group-item-action "> <i
					class="fa-solid fa-location-dot me-3"></i> Sổ địa chỉ
				</a> <a class="list-group-item list-group-item-action">Coming soon .
					. .</a>
			</div>


		</div>
		<!-- side menu  -->

		<!-- info  -->
		<div class="col-9 shadow-lg  row  pb-3">
			<div>
				<div class="my-3  ">
					<span style="font-size: x-large; font-style: inherit;">Đổi Mật khẩu</span>
				</div>


				<!-- Địa chỉ mới-->




				<!-- Địa chỉ -->

				<div class=" my-4 border shadow-sm ">
					<!-- sơ lượt sản phẩm -->
					<div class="  w-50 py-3  border-bottom d-flex mx-auto">


						<form class="row g-3 m-3 border rounded p-3">
							<div>
							<label for="inputPassword5" class="form-label">Mật khẩu hiện tại</label> <input
								type="password" id="inputPassword5" class="form-control"
								aria-describedby="passwordHelpBlock">
							<div id="passwordHelpBlock" class="form-text"></div>
							</div>
							<div>
							<label for="inputPassword5" class="form-label">Mật khẩu mới</label> <input
								type="password" id="inputPassword5" class="form-control"
								aria-describedby="passwordHelpBlock">
							<div id="passwordHelpBlock" class="form-text">
								Mật khẩu phải dài từ 8 đến 32 ký tự, bao gồm chữ và số</div>
							</div>
							<div>
							<label for="inputPassword5" class="form-label">Nhập lại mật khẩu mới</label> <input
								type="password" id="inputPassword5" class="form-control"
								aria-describedby="passwordHelpBlock">
							<div id="passwordHelpBlock" class="form-text"></div>
							</div>
							
							<div>
							<button type="button" class="btn btn-outline-primary">Lưu  thay đổi</button>
							</div>
						</form>



					</div>

				</div>

				<!-- đơn hàng  end -->










			</div>

		</div>
		<!-- info  -->


	</div>
	<!-- Page Header End -->



	<!-- Footer Start -->
	<%@ include file="./component/footer.jsp"%>

	<!-- Footer End -->


</body>
</html>