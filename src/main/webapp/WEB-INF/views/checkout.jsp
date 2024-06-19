<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
	<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Neko Shop</title>
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

	<%@ include file="./component/navbar.jsp"%>

	<h3 class="ms-5">Thanh Toán</h3>

	<div class="container-fluid w-75 ">
		<!-- Dia chi giao -->



				<div class="card border-secondary w-100">
					<div class="card-header   border">
						<h4 class="font-weight-semi-bold m-0">Giao tới</h4>
					</div>
					
					
					<div class="card-body">
					
		<c:forEach var="element" items="${listDeliveryInUser}">

			<c:if test="${element.status==true}">
					
						<div class="d-flex justify-content-between mb-3 pt-1">
							<div>
								<h6 class="font-weight-medium">${element.name}(
									${element.phone} )</h6>
							</div>

							<div class="w-50">
								<h6 class="font-weight-medium">${element.address},
									${element.city}</h6>
							</div>
						</div>
						</c:if>


		</c:forEach>
						
						<div class="d-flex justify-content-between">
							<h6 class="font-weight-medium"></h6>
							<h6 class="font-weight-medium">
								<a href="#" class="" data-bs-toggle="modal"
									data-bs-target="#exampleModal">Thay Đổi</a>
							</h6>
						</div>
						

					</div>



				</div>




			




	</div>
	<!-- Cart Start -->
	<div class="container-fluid pt-5">

		<div class="row px-xl-5">
			<h4>Sản phẩm</h4>



			<div class="col-lg-8 table-responsive mb-5">
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

						<c:set var="totalPrice" value="0"></c:set>
						<c:forEach var="item" items="${mapShopCart}">



							<tr>

								<td class="align-middle"><img
									src="/imageProduct/${item.key.nameImage}" alt=""
									style="width: 50px;">${item.key.name} ( Size :
									${item.key.size} )</td>
								<td class="align-middle">${item.key.price}VND</td>
								<td class="align-middle">
									<div class="input-group quantity mx-auto" style="width: 100px;">
										<form action="/shopCart/Update">
											<input type="number" name="quality"
												onblur="this.form.submit()"
												class="form-control form-control-sm  text-center"
												value="${item.value}"> <input type="hidden"
												name="idProductDetailInHashMap"
												value="${item.key.idProductDetail}">
										</form>
									</div>
								</td>
								
								<td>
								 <fmt:formatNumber value="${item.value*item.key.price}" type="currency" ></fmt:formatNumber> 
								 </td>
								<c:set var="totalPrice"
									value="${totalPrice+item.value*item.key.price}"></c:set>

								<td class="align-middle">
									<form action="/shopCart/remove/${item.key.idProductDetail}"
										method="get">
										<button type="submit" class="btn btn-sm btn-danger">
											<i class="fa fa-times"></i>
										</button>
									</form>
								</td>

							</tr>

						</c:forEach>




					</tbody>
				</table>
			</div>





			<div class="col-lg-4">




					<form action="/create-order" method="post">
				<!-- tong tien -->
				<div class="card border-secondary mb-5">
					<div class="card-header  border-0">
						<h4 class="font-weight-semi-bold m-0">Thanh toán</h4>
					</div>
					<div class="card-body">
						<div class="d-flex justify-content-between mb-3 pt-1">
							<h6 class="font-weight-medium">Subtotal</h6>
							<h6 class="font-weight-medium">
							      <fmt:formatNumber value="${totalPrice}" type="currency" ></fmt:formatNumber> VND
							</h6>
						</div>
						<div class="d-flex justify-content-between">
							<h6 class="font-weight-medium">Shipping</h6>
							<h6 class="font-weight-medium">0 VND</h6>
						</div>
						<hr>
						<div class="d-flex justify-content-between">
							<h6 class="font-weight-medium">Phương thức thanh toán</h6>
							<h6 class="font-weight-medium"></h6>
						</div>

						<div class="form-check">
							<input class="form-check-input" type="radio"
								name="paymentMethods" value="cash" checked id="flexRadioDefault1"> <label
								class="form-check-label" for="flexRadioDefault1">
								Thanh toán bằng tiền mặt </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" 
								name="paymentMethods" value="VNpay" id="flexRadioDefault2" >
							<label class="form-check-label" for="flexRadioDefault2">
								Thanh toán bằng VNpay  </label>
						</div>

					</div>
					<div class="card-footer border-secondary bg-transparent">
						<div class="d-flex justify-content-between mt-2">
							<h5 class="font-weight-bold">Total</h5>
							<h5 class="font-weight-bold">
							<fmt:formatNumber value="${totalPrice}" type="currency" ></fmt:formatNumber> VND
							
							</h5>
						</div>
						<div class="d-flex justify-content-between mt-2">
							<h5 class="font-weight-bold"></h5>
							<button type="submit" class="btn btn-block btn-primary my-3 py-3">Đặt
								hàng</button>
						</div>

					</div>
				</div>
				
				</form>




			</div>
		</div>
	</div>
	<!-- Cart End -->


	<!-- Modal đổi địa chỉ giao -->
	<form action="/checkout/change-adrress" method="post">
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">Địa chỉ
							của tôi</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body ">



						<c:set var="totalPrice" value="0"></c:set>
						<c:forEach var="element" items="${listDeliveryInUser}">
							<!-- địa chỉ  -->
							<div class="form-check border-bottom">
								<input class="form-check-input" ${element.status?'checked':''}
									required="required" value="${element.idDeliveryAddress}"
									type="radio" name=idDeliveryAddress id="flexRadioDefault1">
								<label class="form-check-label" for="flexRadioDefault1">
									${element.name} <br> ( ${element.phone} )<br>
									<div>${element.address}, ${element.city}</div>
								</label>
							</div>
							<!-- địa chỉ  -->

						</c:forEach>


					</div>
					<div class="modal-footer">
						
						<button type="submit" class="btn btn-primary">Save
							changes</button>
						<button type="submit" formaction="/locationCostumer/add-form" formmethod="get" class="btn btn-primary">Thêm mới</button>
					<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</form>


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
	



	<!-- Footer Start -->
	<%@ include file="./component/footer.jsp"%>

	<!-- Footer End -->


</body>
</html>