<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Modernize</title>
<link rel="shortcut icon" type="image/png"
	href="/assets/images/logos/favicon.png" />
<link rel="stylesheet" href="/assets/css/styles.min.css" />
</head>

<body>
	<!--  Body Wrapper -->
	<div class="page-wrapper" id="main-wrapper" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed">
		<!-- Sidebar Start -->
		<!-- Sidebar Start -->
		<%@ include file="./sidebar/SidebarAdmin.jsp"%>
		<!--  Sidebar End -->
		<!--  Sidebar End -->
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
									<img src="/assets/images/profile/user-1.jpg" alt=""
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

				<div class="shadow-lg border" style="height: 800px">

					<div class="container m-3">
						<h3>Quản lý Sản phẩm</h3>

						<form action="">
							<div class="row">

								<!-- left -->
								<div class="col-5">

									<img src="/img/cat-5.jpg"
										class="img-thumbnail border mx-auto" alt="."
										style="height: 260px; width: 400px">
									<div class="input-group my-3 ">
										<label class="input-group-text" for="inputGroupFile01">Upload
											Image</label> <input type="file" class="form-control"
											id="inputGroupFile01">
									</div>

								</div>
								<!-- Right -->
								<div class="col-6">

									<div class="mb-3">
										<label for="exampleFormControlInput1" class="form-label">
											Tên sản phẩm</label> <input type="email" class="form-control"
											id="exampleFormControlInput1" placeholder="name@example.com">
									</div>

									<div class="row">
										<div class="col-6">
											<label for="exampleFormControlInput1" class="form-label">
												Giá </label> <input type="text" class="form-control" placeholder=""
												aria-label="First name">
										</div>

										<div class="col-6">
											<label for="exampleFormControlInput1" class="form-label">
												Giảm giá</label> <input type="text" class="form-control"
												placeholder="%" aria-label="Last name">
										</div>

										<div class="col-12">
										<label for="exampleFormControlInput1" class="form-label">
												So Luong theo size</label>
										
										<div class="col-12 row"> 
												
										<!-- So Luong theo size -->
										
										
										<div class="form-floating mb-3 col-3">
											<input type="number" min="0" class="form-control" id="floatingInput"
												placeholder="S"> <label
												for="floatingInput" > <span class="mx-4"> S </span></label>
										</div>
										<div class="form-floating mb-3 col-3">
											<input type="number" class="form-control" id="floatingInput"
												placeholder="M"> <label
												for="floatingInput"> <span class="mx-4"> M </span></label>
										</div>
										<div class="form-floating mb-3 col-3">
											<input type="number" class="form-control" id="floatingInput"
												placeholder="L"> <label
												for="floatingInput"> <span class="mx-4"> L </span></label>
										</div>
										<div class="form-floating mb-3 col-3">
											<input type="number" class="form-control" id="floatingInput"
												placeholder="S"> <label
												for="floatingInput"><span class="mx-4"> XL </span> </label>
										</div>
										
										
										
										<!-- So Luong theo size -->
										
										</div>
										
										</div>

									</div>

									<div class="mb-3 mt-3">
										<label for="exampleFormControlInput1" class="form-label">
											Loại mặt hàng</label> <select class="form-select"
											aria-label="Default select example">
											<option selected>Open this select menu</option>
											<option value="1">One</option>
											<option value="2">Two</option>
											<option value="3">Three</option>
										</select>

									</div>
									<div class="mb-3 mt-3">
										<label for="exampleFormControlInput1" class="form-label">
											Trạng thái</label>
										<div class="form-check mx-3 form-check-inline">
											<input class="form-check-input" type="radio"
												name="inlineRadioOptions" id="inlineRadio1" value="option1">
											<label class="form-check-label" for="inlineRadio1">Đang
												mở bán</label>
										</div>
										<div class="form-check mx-3 form-check-inline">
											<input class="form-check-input" type="radio"
												name="inlineRadioOptions" id="inlineRadio2" value="option2">
											<label class="form-check-label" for="inlineRadio2">Ngừng
												Kinh Doanh</label>
										</div>

									</div>





								</div>
								<!-- bottom -->
								<div class="col-11">

									<div class="mb-3">
										<label for="exampleFormControlTextarea1" class="form-label">Example
											textarea</label>
										<textarea class="form-control"
											id="exampleFormControlTextarea1" rows="10"></textarea>
									</div>
								</div>

								<div class="col-11 text-center">
									<button type="button" class="btn btn-outline-primary mx-2">Thêm</button>
									<button type="button" class="btn btn-outline-primary mx-2">Cập
										Nhật</button>
									<button type="button" class="btn btn-outline-primary mx-2">Xoá</button>
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
	<script src="/assets/libs/jquery/dist/jquery.min.js"></script>
	<script src="/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/assets/js/sidebarmenu.js"></script>
	<script src="/assets/js/app.min.js"></script>
	<script src="/assets/libs/apexcharts/dist/apexcharts.min.js"></script>
	<script src="/assets/libs/simplebar/dist/simplebar.js"></script>
	<script src="/assets/js/dashboard.js"></script>
</body>

</html>