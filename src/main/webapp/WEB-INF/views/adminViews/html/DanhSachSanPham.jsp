<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib uri="jakarta.tags.core" prefix="c" %>
	<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>

<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Modernize </title>
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
		<%@ include file="./sidebar/SidebarAdmin.jsp" %>
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
						<h3>Danh Sách Sản Phẩm</h3>
						<!-- form tim kiem -->
						<form action="/admin/list-product">

							<div class="row g-3">
								<div class="col-8">
									<input type="text" class="form-control"
										name="keywords" value="${keywords}"
										placeholder="Tìm Tên sản phẩm"
										aria-label="First name">
								</div>
								
								<div class="col-4">
									<button type="submit" class="btn btn-secondary mx-2">Tìm
										kiếm</button>
									<button type="submit" formaction="/admin/list-product" formmethod="post" class="btn btn-outline-primary  mx-2">Làm
										Mới</button>
								</div>


								<div class="col-12 d-flex justify-content-between">
									<h4> Tổng : ${pageProduct.totalElements} Sản Phẩm</h4>
									
								</div>
								<!-- table -->
								<div class="col-11 mx-auto" style="overflow-y: scroll; height: 500px;">

									<table class="table table-light shadow border table-hover   ">
										<thead>
											<tr>
												<th scope="col">Ảnh</th>
												<th scope="col">Mã Sản Phẩm</th>
												<th scope="col">Tên Sản Phẩm</th>
												<th scope="col">Giá </th>
												<th scope="col">Giảm Giá</th>
												<th scope="col">Thao Tác</th>
											</tr>
										</thead>
										<tbody>
										
										<c:forEach var="product" items="${pageProduct.content}">
											<tr>
												<td>
												<img alt="" src="/imageProduct/${product.nameImage}" style="height: 100px ; width: 120px">
												
												</td>
											
												<td >${product.idProduct}</td>
												<td>${product.name}</td>
												<td>${product.price} VND</td>
												<td>${product.disscount} %</td>
												<td>
												<button type="submit" formaction="/admin/product/edit/${product.idProduct}" class="btn btn-outline-primary">Chỉnh sửa</button>
												</td>
											</tr>
											</c:forEach>
											
										</tbody>
									</table>


								</div>
								
									<!-- paging -->
								<div class="d-flex justify-content-center">

									<nav aria-label="Page navigation example mx-auto">
										
										
										
										<ul class="pagination">
											
											<li class="page-item">
											<a class="page-link" ${pageProduct.number-1>=0?'':'onclick="return false;"'} href="/admin/list-product?p=${pageProduct.number-1}&&keywords=${keywords}">Previous</a>
											</li>
										
											<c:forEach begin="1"  var="i" step="1" end="${pageProduct.totalPages}">
											<li class="page-item"><a class="page-link" href="/admin/list-product?p=${i-1}&&keywords=${keywords}">${i}</a></li>	
											</c:forEach>
										
											<li class="page-item">
											<a class="page-link" ${pageProduct.number<pageProduct.totalPages-1?'':'onclick="return false;"'} href="/admin/list-product?p=${pageProduct.number+1}&&keywords=${keywords}">Next</a>
											</li>
										</ul>
										
									</nav>
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