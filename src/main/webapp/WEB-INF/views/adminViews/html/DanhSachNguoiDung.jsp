<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib uri="jakarta.tags.core" prefix="c" %>

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
						<form action="/admin/list-user">

							<div class="row g-3">
								<div class="col-5">
									<input type="text" class="form-control"
										placeholder="Tìm Tên người dùng" value="${keywordName}"
										name="keywordName"
										aria-label="First name">
								</div>
								<div class="col-5">
									<input type="email" class="form-control"
										placeholder="Tìm email người dùng" value="${keywordEmail}"
										name="keywordEmail"
										aria-label="First name">
								</div>
								<div class="col-2">
									<button type="submit" formaction="/admin/list-user" formmethod="get" class="btn btn-secondary mx-2">Tìm
										kiếm</button>
									
								</div>


								<div class="col-12">
									<h4> ${pageUsers.totalElements} Người dùng trong hệ thống</h4>
								</div>
								<!-- table -->
								<div class="col-11 mx-auto" style="overflow-y: scroll; height: 500px;">

									<table class="table table-light shadow border table-hover   ">
										<thead>
											<tr>
												
												<th scope="col">Tên Người dùng</th>
												<th scope="col">Email</th>
												<th scope="col">SĐT </th>
												<th scope="col">Ngày đăng ký</th>
												<th scope="col">Trạng Thái</th>
												<th scope="col">Thao Tác</th>
											</tr>
										</thead>
										<tbody>
											
											<c:forEach var="user" items="${pageUsers.content}">
											
												<tr>
												
												<td style='width: 20%;'>${user.name}</td>
												<td>${user.email}</td>
												<td>${user.phone}</td>
												<td>${user.birhday}</td>
												<td>${user.status}</td>
												<td>
												<a type="button" href="/admin/user/edit/${user.idUser}" class="btn btn-outline-primary"> sửa</a>
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
											<a class="page-link" ${pageUsers.number-1>=0?'':'onclick="return false;"'} href="/admin/list-user?p=${pageUsers.number-1}&&keywordName=${keywordName}&&keywordEmail=${keywordEmail}">Previous</a>
											</li>
										
											<c:forEach begin="1"  var="i" step="1" end="${pageUsers.totalPages}">
											<li class="page-item"><a class="page-link" href="/admin/list-user?p=${i-1}&&keywordName=${keywordName}&&keywordEmail=${keywordEmail}">${i}</a></li>	
											</c:forEach>
										
											<li class="page-item">
											<a class="page-link" ${pageUsers.number<pageUsers.totalPages-1?'':'onclick="return false;"'} href="/admin/list-user?p=${pageUsers.number+1}&&keywordName=${keywordName}&&keywordEmail=${keywordEmail}">Next</a>
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