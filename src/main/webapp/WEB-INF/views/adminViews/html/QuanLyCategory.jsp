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
			<%@ include file="./sidebar/header.jsp" %>
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