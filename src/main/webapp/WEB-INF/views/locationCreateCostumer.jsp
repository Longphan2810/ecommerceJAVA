<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<script src="https://kit.fontawesome.com/bceea5e627.js"
	crossorigin="anonymous"></script>

</head>
<body>


	<%@ include file="./component/navbarInfo.jsp"%>





	<!-- Page Header Start -->
	<div class="container-fluid  my-3 m-auto row">
		<!-- side menu  -->
		<div class="col-3 ">

			<!-- account -->
			<div class="row">



				<div class="ms-5 my-2">
		Tài Khoản của <br>
		<span style="font-weight: bold;">${sessionScope.userCurrent.name }</span>
		</div>
			</div>


			<div class="list-group">
				<a href="/infoCostumer"
					class="list-group-item list-group-item-action " aria-current="true">
					<i class="fa-solid fa-user me-3"></i>Thông tin tài khoản
				</a> <a href="/orderCostumer/list"
					class="list-group-item list-group-item-action "> <i
					class="fa-solid fa-file-invoice me-3"></i> Quản lý đơn hàng
				</a> <a href="/locationCostumer/list"
					class="list-group-item list-group-item-action active"> <i
					class="fa-solid fa-location-dot me-3"></i> Sổ địa chỉ
				</a> <a class="list-group-item list-group-item-action">Coming soon .
					. .</a>
			</div>


		</div>
		<!-- side menu  -->

		<!-- info  -->
		<div class="col-9 shadow-lg  row  pb-3">
			<div>
				<div class="my-3  ">
					<span style="font-size: x-large; font-style: inherit;">Thêm
						địa chỉ mới</span>
				</div>


				<!-- Địa chỉ mới-->




				<!-- Địa chỉ -->

				<div class=" my-4 border shadow-sm ">
					<!-- sơ lượt sản phẩm -->
					<div class="   py-3  border-bottom d-flex flex-nonwrap">


						<form action="/locationCostumer/add-Address" method="post"
							class="row g-3 m-3">
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Họ và tên</label> <input
									type="text" required="required" name="name"
									class="form-control" id="inputEmail4">
							</div>
							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Số điện
									thoại</label> <input type="text" required="required" minlength="10"
									name="phone" class="form-control" id="inputPassword4">

								<%--alert  --%>
								<div id="liveAlertPlaceholder">
									<div class="${ValidatePhone==true?'':'d-none'}">
										<div class="alert alert-danger alert-dismissible" role="alert">
											<div>Phone chỉ được nhập số !</div>
											<button type="button" class="btn-close"
												data-bs-dismiss="alert" aria-label="Close"></button>
										</div>
									</div>
								</div>
								<%--alert  --%>


							</div>
							<div class="col-12">
								<label for="inputAddress" class="form-label">Tỉnh/Thành
									phố</label> <input type="text" required="required" name="city"
									class="form-control" id="inputAddress"
									placeholder="1234 Main St">
							</div>


							<div class="col-md-12">
								<label for="inputCity" class="form-label">Địa chỉ</label> <input
									type="text" required="required" class="form-control"
									name="address" id="inputCity">
							</div>

							<div class="col-md-12">
								<div class="form-check">
									<input class="form-check-input" name="status" type="checkbox"
										value="true" id="flexCheckDefault"> <label
										class="form-check-label" for="flexCheckDefault"> Địa
										chỉ mặc định </label>
								</div>
							</div>



							<div class="col-12">
								<button type="submit" class="btn btn-primary">Lưu địa
									chỉ</button>
							</div>



						</form>



					</div>

				</div>

				<!-- đơn hàng  end -->










			</div>

		</div>
		<!-- info  -->


	</div>
	<!-- Page Header End -->
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