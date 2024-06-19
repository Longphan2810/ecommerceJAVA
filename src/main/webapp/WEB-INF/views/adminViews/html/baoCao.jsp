<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
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
			<%@ include file="./sidebar/header.jsp" %>
			<!--  Header End -->

			<!-- body  -->
			<div class="container-fluid">

				<div class="shadow-lg border">

					<div class="container m-3">
						<h3>Quản lý Sản phẩm</h3>

						<div class="row py-3">

							<!-- Dia chi giao -->
							<div class="col-12">
								<div class="container-fluid "></div>

							</div>
							<!-- Dia chi giao end-->

							<!-- Dia chi giao -->
							<div class="col-11 ">
								<div class="container-fluid ">

									<div class="card-body border mb-3">
										<div class="d-flex justify-content-around  py-2">
											<div>
												<h4 class="font-weight-medium">Doanh thu sản phẩm đã
													bán</h4>
											</div>


										</div>

									</div>
								</div>

							</div>


								<form action="">							<!-- Dia chi giao end-->
							<div class="col-12 row my-2">

									<div class="col-6">

										<select class="form-select" name="findDate"
											aria-label="Default select example">
											<option value="" >All</option>
											<c:forEach var="date"  items="${listDate}">
												<fmt:formatDate var="dateFM"  value="${date}"
													pattern="yyyy-MM-dd" />
													
												<option ${date.time==dateCurrent.time?'selected':''} value="${dateFM}">${dateFM}</option>
											</c:forEach>
										</select>
									</div>

									<div class="col-5">
										<button type="submit" class="btn btn-secondary mx-2">Tìm
											kiếm</button>

									</div>
								

							</div>
							</form>
							<!-- danh sach san pham trong don -->

							<div class="col-lg-11 table-responsive mb-3">
								<table class="table table-bordered text-center mb-0">
									<thead class="bg-secondary text-dark">
										<tr>
											<th>Products</th>
											<th>Price</th>
											<th>Quantity sold</th>
											<th>Sales</th>
										</tr>
									</thead>
									<tbody class="align-middle">
										<c:set var="tongTien" value="0"></c:set>
										<c:forEach var="report" items="${listReport}">
											<tr>
												<td class="align-middle">${report.productDetail.product.name}
													(Size ${report.productDetail.size} )</td>
												<td class="align-middle"><fmt:formatNumber
														value="${report.productDetail.product.price}"
														type="currency"></fmt:formatNumber> VND</td>
												<td class="align-middle">${report.quatitySold}</td>
												<td class="align-middle"><fmt:formatNumber
														value="${report.productDetail.product.price*report.quatitySold}"
														type="currency"></fmt:formatNumber> VND <c:set
														var="tongTien"
														value="${tongTien+report.productDetail.product.price*report.quatitySold}"></c:set>
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
												<h4 class="font-weight-medium">Tổng tiền</h4>
											</div>

											<div class="">
												<h4 class="font-weight-medium">
													<fmt:formatNumber value="${tongTien}" type="currency"></fmt:formatNumber>
												</h4>
											</div>
										</div>

									</div>
								</div>

							</div>
							<!-- Dia chi giao end-->





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