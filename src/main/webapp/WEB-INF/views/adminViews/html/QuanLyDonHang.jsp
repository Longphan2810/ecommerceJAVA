<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="jakarta.tags.core" prefix="c" %>
	<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
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
		<%@ include file="./sidebar/SidebarAdmin.jsp"%>
		<!--  Sidebar End -->
		<!--  Main wrapper -->
		<div class="body-wrapper">
					<!--  Header Start -->
			<%@ include file="./sidebar/header.jsp" %>
			<!--  Header End -->

			<!-- body  -->
			<div class="container-fluid">

				<div class="shadow-lg border" >

					<div class="container m-3">
						<h3>Quản lý Sản phẩm</h3>

						<form action="/admin/orders/update">
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
														<h6 class="font-weight-medium">${order.name}
															(${order.phone})</h6>
													</div>

													<div class="w-50">
														<h6 class="font-weight-medium">${order.address}, ${order.city}</h6>
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
												<input value="${order.idOrder}" name="idOrder" type="hidden">
													<select class="form-select"  name="status"
														aria-label="Default select example">
														
														<option ${order.status=='done'?'selected':''}  value="done">done</option>
														<option ${order.status=='cancel'?'selected':''}  value="cancel">cancel</option>
														<option ${order.status=='waiting'?'selected':''}  value="waiting">waiting</option>
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
											
											</tr>
										</thead>
										<tbody class="align-middle">
										
										<c:forEach var="orderDetail" items="${order.listOrderDetails}">
										<tr>
												<td class="align-middle"><img src="/imageProduct/${orderDetail.productDetail.product.nameImage}"
													alt="" style="width: 50px;">${orderDetail.productDetail.product.name}</td>
												<td class="align-middle">
												<fmt:formatNumber value="${orderDetail.productDetail.product.price}"  type="currency"></fmt:formatNumber> VND
												</td>
												<td class="align-middle">
													<div class="input-group quantity mx-auto"
														style="width: 100px;">
														<div class="input-group-btn">
															
														</div>
														<input type="text" readonly="readonly"
															class="form-control  form-control-sm  text-center"
															value="${orderDetail.quanlity}">
														<div class="input-group-btn">
															
														</div>
													</div>
												</td>
												<td class="align-middle">
												<fmt:formatNumber value="${orderDetail.productDetail.product.price *orderDetail.quanlity}"  type="currency"></fmt:formatNumber> VND
												
												</td>
												
											</tr>
										
										</c:forEach>
										
											
											
											
											
											
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
													<h4 class="font-weight-medium"> <fmt:formatNumber value="${order.amount}"  type="currency"></fmt:formatNumber> </h4>
												</div>
											</div>

										</div>
									</div>

								</div>
								<!-- Dia chi giao end-->



								<div class="col-11 text-center ">
									<button type="submit" class="btn btn-outline-primary mx-2">Cập
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
	<script src="/assets/libs/jquery/dist/jquery.min.js"></script>
	<script src="/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/assets/js/sidebarmenu.js"></script>
	<script src="/assets/js/app.min.js"></script>
	<script src="/assets/libs/apexcharts/dist/apexcharts.min.js"></script>
	<script src="/assets/libs/simplebar/dist/simplebar.js"></script>
	<script src="/assets/js/dashboard.js"></script>
</body>

</html>