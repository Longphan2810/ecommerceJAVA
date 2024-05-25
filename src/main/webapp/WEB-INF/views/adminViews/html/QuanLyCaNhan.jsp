<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Modernize Free</title>
<link rel="shortcut icon" type="image/png"
	href="../assets/images/logos/favicon.png" />
<link rel="stylesheet" href="../assets/css/styles.min.css" />
</head>

<body>
	<!--  Body Wrapper -->
	<div class="page-wrapper" id="main-wrapper" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed">
		<!-- Sidebar Start -->
			<!-- Sidebar Start -->
		<%@ include file="./sidebar/SidebarAdmin.jsp"%>
		<!--  Sidebar End -->		<!--  Sidebar End -->
		<!--  Main wrapper -->
		<div class="body-wrapper">
			<!--  Header Start -->
			<header class="app-header">
				<nav class="navbar navbar-expand-lg navbar-light">
					<ul class="navbar-nav">
						<li class="nav-item d-block d-xl-none"><a
							class="nav-link sidebartoggler nav-icon-hover"
							id="headerCollapse" href="javascript:void(0)"> <i
								class="ti ti-menu-2"></i>
						</a></li>

					</ul>
					<div class="navbar-collapse justify-content-end px-0"
						id="navbarNav">
						<ul
							class="navbar-nav flex-row ms-auto align-items-center justify-content-end">

							<li class="nav-item dropdown"><a
								class="nav-link nav-icon-hover" href="javascript:void(0)"
								id="drop2" data-bs-toggle="dropdown" aria-expanded="false">
									<img src="../assets/images/profile/user-1.jpg" alt=""
									width="35" height="35" class="rounded-circle">
							</a>
								<div
									class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up"
									aria-labelledby="drop2">
									<div class="message-body">
										<a href="javascript:void(0)"
											class="d-flex align-items-center gap-2 dropdown-item"> <i
											class="ti ti-user fs-6"></i>
											<p class="mb-0 fs-3">My Profile</p>
										</a> <a href="javascript:void(0)"
											class="d-flex align-items-center gap-2 dropdown-item"> <i
											class="ti ti-mail fs-6"></i>
											<p class="mb-0 fs-3">My Account</p>
										</a> <a href="javascript:void(0)"
											class="d-flex align-items-center gap-2 dropdown-item"> <i
											class="ti ti-list-check fs-6"></i>
											<p class="mb-0 fs-3">My Task</p>
										</a> <a href="./authentication-login.html"
											class="btn btn-outline-primary mx-3 mt-2 d-block">Logout</a>
									</div>
								</div></li>
						</ul>
					</div>
				</nav>
			</header>
			<!--  Header End -->
			<!-- body  -->
			<div class="container-fluid">

				<div class="shadow-lg border w-75 mx-auto">

					<div class="container  m-3">
						<h3>Thông Tin Cá Nhân</h3>

						<form action="">
							<div class="row">


								<!-- Right -->
								<div class="col-11">

									<div class="mb-3">
										<label for="exampleFormControlInput1" class="form-label">
											Họ Và Tên</label> <input type="text" class="form-control"
											id="exampleFormControlInput1" readonly="readonly"
											placeholder="Tên người dùng">
									</div>

									<div class="row">
										<div class="col-6">
											<label for="exampleFormControlInput1" class="form-label">
												Email </label> <input type="email" class="form-control"
												placeholder="" aria-label="First name">
										</div>
										<div class="col-6">
											<label for="exampleFormControlInput1" class="form-label">
												Số điện thoại</label> <input type="text" class="form-control"
												placeholder="" aria-label="Last name">
										</div>
										<div class="col-6">
											<label for="exampleFormControlInput1" class="form-label">
												Địa chỉ</label> <input type="text" class="form-control"
												placeholder="%" aria-label="Last name">
										</div>
										<div class="col-6">
											<label for="exampleFormControlInput1" class="form-label">
												Ngày Sinh</label> <input type="Date" class="form-control"
												placeholder="%" aria-label="Last name">
										</div>

									</div>








								</div>

								<div class="my-2 py-1 col-11 border-top">

									<label for="exampleFormControlInput1" class="form-label">
										Mật khẩu</label> <input type="password" class="form-control"
										id="exampleFormControlInput1" 
										placeholder="Nhập nếu muốn đổi mật khẩu">
								</div>
								<div class="my-2 py-1 col-11 border-top">

									<label for="exampleFormControlInput1" class="form-label">
										Mật khẩu Mới</label> <input type="password" class="form-control"
										id="exampleFormControlInput1" 
										placeholder="Nhập nếu muốn đổi mật khẩu">
								</div>
								<div class="my-2 py-1 col-11 border-top">

									<label for="exampleFormControlInput1" class="form-label">
										Nhập lại Mật khẩu mới</label> <input type="password" class="form-control"
										id="exampleFormControlInput1" 
										placeholder="Nhập nếu muốn đổi mật khẩu">
								</div>

								<div class="col-11 text-center p-3">

									<button type="button" class="btn btn-outline-primary mx-2">Cập
										Nhật</button>
									<button type="button" class="btn btn-outline-primary mx-2">Làm
										Mới</button>

								</div>

							</div>
						</form>



					</div>





				</div>


			</div>
		</div>
	</div>
	<script src="../assets/libs/jquery/dist/jquery.min.js"></script>
	<script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="../assets/js/sidebarmenu.js"></script>
	<script src="../assets/js/app.min.js"></script>
	<script src="../assets/libs/apexcharts/dist/apexcharts.min.js"></script>
	<script src="../assets/libs/simplebar/dist/simplebar.js"></script>
	<script src="../assets/js/dashboard.js"></script>
</body>

</html>