<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.functions" prefix="fn"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>

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
		<%@ include file="./sidebar/SidebarAdmin.jsp"%>
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
										 <a href="./authentication-login.html"
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
						<h3>Danh Sách đơn hàng</h3>
						<!-- form tim kiem -->


						<div class="row g-3">
							<form action="/admin/list-orders">
								<div class="row g-3 ">
									<div class="col-8">
										<input type="number" min="1" class="form-control"
											placeholder="Tìm mã đơn hàng" name="keyword" aria-label="First name">
									</div>

									<div class="col-3 ">
										<button type="submit" class="btn btn-secondary ">Tìm
											kiếm</button>
										<button type="button" class="btn btn-outline-primary  ">Làm
											Mới</button>
									</div>
								</div>
							</form>

							<div class="col-12"></div>
							<!-- table -->
							<div class="col-11 mx-auto"
								style="overflow-y: scroll; height: 500px;">

								<table class="table table-light shadow border table-hover "
									style="height: 500px">
									<thead>
										<tr>

											<th scope="col">Mã Đơn Hàng</th>
											<th scope="col">Ngày Đặt (yyyy-MM-dd)</th>
											<th scope="col">Tên Khách Hàng</th>
											<th scope="col">Tổng tiền</th>
											<th scope="col">Trạng Thái</th>
											<th scope="col">Thao Tác</th>
										</tr>
									</thead>
									<tbody>


										<c:forEach var="order" items="${pageOrder.content}">
											<tr>
												<td>${order.idOrder}</td>
												<td><fmt:formatDate value="${order.orderDate}"
														pattern="yyyy-MM-dd" /></td>
												<td>${order.name}</td>
												<td><fmt:formatNumber value="${order.amount}"
														type="currency"></fmt:formatNumber> VND</td>
												<td>${order.status}</td>
												<td>
													<form action="/admin/orders">
														<input type="hidden" value="${order.idOrder}"
															name="idOrder">
														<button type="submit" class="btn btn-outline-primary">Cập
															Nhật</button>
													</form>
												</td>
											</tr>
										</c:forEach>










									</tbody>
								</table>


							</div>

							<!-- paging -->
							<div class="d-flex justify-content-center">

								<nav aria-label="Page navigation example mx-auto">




									<ul class="pagination justify-content-center mb-3">

										<li class="page-item"><a class="page-link"
											href="/admin/list-orders?p=0">First</a></li>

										<c:forEach begin="1" var="i" step="1"
											end="${pageOrder.totalPages}">
											<li class="page-item"><a class="page-link"
												href="/admin/list-orders?p=0${i-1}">${i}</a></li>

										</c:forEach>

										<li class="page-item"><a class="page-link"
											href="/admin/list-orders?p=${pageOrder.totalPages-1}">Last</a></li>

									</ul>


								</nav>




							</div>


						</div>







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