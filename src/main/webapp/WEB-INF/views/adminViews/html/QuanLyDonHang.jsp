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

				<div class="shadow-lg border" >

					<div class="container m-3">
						<h3>Quản lý Sản phẩm</h3>

						<form action="">
							<div class="row py-3">

								<!-- Dia chi giao -->
								<div class="col-12">
									<div class="container-fluid ">

										<div class="card border-secondary w-100">
											<div class="card-header  border">
												<h4 class="font-weight-semi-bold m-0">Giao tới</h4>
											</div>
											<div class="card-body">
												<div class="d-flex justify-content-between  pt-1">
													<div>
														<h6 class="font-weight-medium">Nguyen van a
															(0776946628)</h6>
													</div>

													<div class="w-50">
														<h6 class="font-weight-medium">Cầu Cống Tiềm (Quán
															bún thu), Đường Trần Đại Nghĩa, Phường Điện Ngọc, Thị Xã
															Điện Bàn, Quảng Nam</h6>
													</div>
												</div>

											</div>

										</div>
									</div>

								</div>
								<!-- Dia chi giao end-->

								<!-- Dia chi giao -->
								<div class="col-11 ">
									<div class="container-fluid ">

										<div class="card-body border mb-3">
											<div class="d-flex justify-content-around  py-2">
												<div>
													<h4 class="font-weight-medium">Trạng thái đơn hàng</h4>
												</div>

												<div class="">
													<select class="form-select"
														aria-label="Default select example">
														<option selected>Đang xử lý</option>
														<option value="1">Đã huỷ</option>
														
													</select>
												</div>
											</div>

										</div>
									</div>

								</div>
								<!-- Dia chi giao end-->

								<!-- danh sach san pham trong don -->

								<div class="col-lg-11 table-responsive mb-3">
									<table class="table table-bordered text-center mb-0">
										<thead class="bg-secondary text-dark">
											<tr>
												<th>Products</th>
												<th>Price</th>
												<th>Quantity</th>
												<th>Total</th>
												<th>Remove</th>
											</tr>
										</thead>
										<tbody class="align-middle">
											<tr>
												<td class="align-middle"><img src="/img/product-1.jpg"
													alt="" style="width: 50px;"> Colorful Stylish Shirt</td>
												<td class="align-middle">$150</td>
												<td class="align-middle">
													<div class="input-group quantity mx-auto"
														style="width: 100px;">
														<div class="input-group-btn">
															<button class="btn btn-sm btn-primary btn-minus">
																<i class="fa fa-minus"></i>
															</button>
														</div>
														<input type="text"
															class="form-control form-control-sm  text-center"
															value="1">
														<div class="input-group-btn">
															<button class="btn btn-sm btn-primary btn-plus">
																<i class="fa fa-plus"></i>
															</button>
														</div>
													</div>
												</td>
												<td class="align-middle">$150</td>
												<td class="align-middle"><button
														class="btn btn-sm btn-danger">
														<i class="fa fa-times"></i>
													</button></td>
											</tr>
											<tr>
												<td class="align-middle"><img src="/img/product-2.jpg"
													alt="" style="width: 50px;"> Colorful Stylish Shirt</td>
												<td class="align-middle">$150</td>
												<td class="align-middle">
													<div class="input-group quantity mx-auto"
														style="width: 100px;">
														<div class="input-group-btn">
															<button class="btn btn-sm btn-primary btn-minus">
																<i class="fa fa-minus"></i>
															</button>
														</div>
														<input type="text"
															class="form-control form-control-sm  text-center"
															value="1">
														<div class="input-group-btn">
															<button class="btn btn-sm btn-primary btn-plus">
																<i class="fa fa-plus"></i>
															</button>
														</div>
													</div>
												</td>
												<td class="align-middle">$150</td>
												<td class="align-middle"><button
														class="btn btn-sm btn-danger">
														<i class="fa fa-times"></i>
													</button></td>
											</tr>
											<tr>
												<td class="align-middle"><img src="/img/product-3.jpg"
													alt="" style="width: 50px;"> Colorful Stylish Shirt</td>
												<td class="align-middle">$150</td>
												<td class="align-middle">
													<div class="input-group quantity mx-auto"
														style="width: 100px;">
														<div class="input-group-btn">
															<button class="btn btn-sm btn-primary btn-minus">
																<i class="fa fa-minus"></i>
															</button>
														</div>
														<input type="text"
															class="form-control form-control-sm  text-center"
															value="1">
														<div class="input-group-btn">
															<button class="btn btn-sm btn-primary btn-plus">
																<i class="fa fa-plus"></i>
															</button>
														</div>
													</div>
												</td>
												<td class="align-middle">$150</td>
												<td class="align-middle"><button
														class="btn btn-sm btn-danger">
														<i class="fa fa-times"></i>
													</button></td>
											</tr>
											<tr>
												<td class="align-middle"><img src="/img/product-4.jpg"
													alt="" style="width: 50px;"> Colorful Stylish Shirt</td>
												<td class="align-middle">$150</td>
												<td class="align-middle">
													<div class="input-group quantity mx-auto"
														style="width: 100px;">
														<div class="input-group-btn">
															<button class="btn btn-sm btn-primary btn-minus">
																<i class="fa fa-minus"></i>
															</button>
														</div>
														<input type="text"
															class="form-control form-control-sm  text-center"
															value="1">
														<div class="input-group-btn">
															<button class="btn btn-sm btn-primary btn-plus">
																<i class="fa fa-plus"></i>
															</button>
														</div>
													</div>
												</td>
												<td class="align-middle">$150</td>
												<td class="align-middle"><button
														class="btn btn-sm btn-danger">
														<i class="fa fa-times"></i>
													</button></td>
											</tr>
											<tr>
												<td class="align-middle"><img src="/img/product-5.jpg"
													alt="" style="width: 50px;"> Colorful Stylish Shirt</td>
												<td class="align-middle">$150</td>
												<td class="align-middle">
													<div class="input-group quantity mx-auto"
														style="width: 100px;">
														<div class="input-group-btn">
															<button class="btn btn-sm btn-primary btn-minus">
																<i class="fa fa-minus"></i>
															</button>
														</div>
														<input type="text"
															class="form-control form-control-sm  text-center"
															value="1">
														<div class="input-group-btn">
															<button class="btn btn-sm btn-primary btn-plus">
																<i class="fa fa-plus"></i>
															</button>
														</div>
													</div>
												</td>
												<td class="align-middle">$150</td>
												<td class="align-middle"><button
														class="btn btn-sm btn-danger">
														<i class="fa fa-times"></i>
													</button></td>
											</tr>
										</tbody>
									</table>
								</div>

								<!-- danh sach san pham trong don end -->


								<!-- Dia chi giao -->
								<div class="col-11">
									<div class="container-fluid ">

										<div class="card-body border my-3">
											<div class="d-flex justify-content-around  pt-1">
												<div>
													<h4 class="font-weight-medium">Tổng đơn</h4>
												</div>

												<div class="">
													<h4 class="font-weight-medium">999$</h4>
												</div>
											</div>

										</div>
									</div>

								</div>
								<!-- Dia chi giao end-->



								<div class="col-11 text-center ">
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