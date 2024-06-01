<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


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
									<img src="/assets/images/profile/user-1.jpg" alt="" width="35"
									height="35" class="rounded-circle">
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

				<div class="shadow-lg border">

					<div class="container m-3">
						<h3>Quản lý Loại Sản phẩm</h3>

						<form:form action="/admin/category" method="post"
							modelAttribute="category">
							<div class="row">

								<div class="col-11">


									<div class="mb-3">
										<label for="exampleFormControlInput1" class="form-label">
											Mã Loại sản phẩm</label> <input type="number" name="idCategory"
											value="${category.idCategory}" readonly="readonly"
											class="form-control" id="exampleFormControlInput1"
											placeholder="Id Category">
									</div>

									<div class="mb-3">
										<label for="exampleFormControlInput1" class="form-label">
											Tên Loại sản phẩm</label> <input type="text" name="name"
											value="${category.name}" class="form-control"
											id="exampleFormControlInput1"
											placeholder="Quan abc, Ao abc ,.."> <span
											class="mx-3"> <form:errors path="name"
												cssStyle="color:red;"></form:errors>
										</span>

									</div>




								</div>

								<div class="col-11 text-center mb-3">
									<button type="submit" formaction="/admin/category/add"
										class="btn btn-outline-primary mx-2">Thêm</button>
									<button type="submit" formaction="/admin/category/saveOrUpdate"
										class="btn btn-outline-primary mx-2">Cập Nhật</button>
									<button type="submit" formaction="/admin/category/delete"
										class="btn btn-outline-primary mx-2">Xoá</button>
									<button type="submit" formaction="/admin/category"
										class="btn btn-outline-primary mx-2">Làm Mới</button>

								</div>
								</form:form>
								<form  action="/admin/category/findbyname" method="get" role="search">
								<div class=" col-12 row my-3">
									
									<div class="col-9 mx-auto">
										<input class="form-control me-2" type="text"
											placeholder="Search by name" name="name" aria-label="Search">
									</div>
									<div class="col-3 text-center">
										<button class="btn btn-outline-success" type="submit">Search</button>
									</div>
								
								</div>
								
									</form>

								<!-- Table -->
								<div class="col-12 mx-auto"
									style="overflow-y: scroll; height: 500px;">

									<table class="table border shadow">
										<thead>
											<tr>
												<th scope="col">ID</th>
												<th scope="col">Name</th>
												<th scope="col">Action</th>

											</tr>
										</thead>
										<tbody>
											<c:forEach var="cate" items="${listCategory}">

												<tr>
													<th scope="row">${cate.idCategory}</th>
													<td>${cate.name}</td>
													<td><a href="/admin/category/edit/${cate.idCategory}">Edit</a></td>

												</tr>

											</c:forEach>



										</tbody>
									</table>
								</div>



							</div>
						



					</div>





				</div>


			</div>





		</div>
	</div>

	<!--  thong bao -->

	<div class="toast-container  position-fixed bottom-0 end-0 p-3">
		<div id="liveToast" class="toast ${message!=null?'show':''}"
			role="alert" aria-live="assertive" aria-atomic="true">
			<div class="toast-header">
				<strong class="me-auto">Thông báo</strong>

				<button type="button" class="btn-close" data-bs-dismiss="toast"
					aria-label="Close"></button>
			</div>
			<div class="toast-body">${message}</div>
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