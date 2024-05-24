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


</head>
<body>

	<%@ include file="./component/navbar.jsp" %>

	<!-- Shop Start -->
	<div class="container-fluid ">
		<div class="row px-xl-5">
			<!-- Shop Sidebar Start -->
			<div class="col-lg-3 col-md-12">
				<!-- Price Start -->
				<div class="border-bottom mb-4 pb-4">
					<h5 class="font-weight-semi-bold mb-4">Filter by price</h5>
					<form>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input " checked
								id="price-all"> <label class="custom-control-label ms-3"
								for="price-all">All Price</label> <span
								class="rounded-pill border px-2 ms-auto">1000</span>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" id="price-1">
							<label class="custom-control-label ms-3" for="price-1">$0 -
								$100</label> <span class="rounded-pill border px-2 ms-auto">1000</span>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" id="price-2">
							<label class="custom-control-label ms-3" for="price-2">$100 -
								$200</label> <span class="rounded-pill border px-2 ms-auto">1000</span>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" id="price-3">
							<label class="custom-control-label ms-3" for="price-3">$200 -
								$300</label> <span class="rounded-pill border px-2 ms-auto">1000</span>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" id="price-4">
							<label class="custom-control-label ms-3" for="price-4">$300 -
								$400</label> <span class="rounded-pill border px-2 ms-auto">1000</span>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
							<input type="checkbox" class="custom-control-input" id="price-5">
							<label class="custom-control-label ms-3" for="price-5">$400 -
								$500</label> <span class="rounded-pill border px-2 ms-auto">1000</span>
						</div>
					</form>
				</div>
				<!-- Price End -->

				<!-- Color Start -->
				<div class="border-bottom mb-4 pb-4">
					<h5 class="font-weight-semi-bold mb-4">Filter by color</h5>
					<form>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" checked
								id="color-all"> <label class="custom-control-label ms-3"
								for="price-all">All Color</label> <span
								class="rounded-pill border px-2 ms-auto">1000</span>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" id="color-1">
							<label class="custom-control-label ms-3" for="color-1">Black</label> <span
								class="rounded-pill border px-2 ms-auto">1000</span>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" id="color-2">
							<label class="custom-control-label ms-3" for="color-2">White</label> <span
								class="rounded-pill border px-2 ms-auto">1000</span>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" id="color-3">
							<label class="custom-control-label ms-3" for="color-3">Red</label> <span
								class="rounded-pill border px-2 ms-auto">1000</span>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" id="color-4">
							<label class="custom-control-label ms-3" for="color-4">Blue</label> <span
								class="rounded-pill border px-2 ms-auto">1000</span>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
							<input type="checkbox" class="custom-control-input" id="color-5">
							<label class="custom-control-label ms-3" for="color-5">Green</label> <span
								class="rounded-pill border px-2 ms-auto">1000</span>
						</div>
					</form>
				</div>
				<!-- Color End -->

				<!-- Size Start -->
				<div class="mb-5">
					<h5 class="font-weight-semi-bold mb-4">Filter by size</h5>
					<form>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" checked
								id="size-all"> <label class="custom-control-label ms-3"
								for="size-all">All Size</label> <span
								class="badge border font-weight-normal ms-auto">1000</span>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" id="size-1">
							<label class="custom-control-label ms-3" for="size-1">XS</label> <span
								class="badge border font-weight-normal ms-auto">150</span>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" id="size-2">
							<label class="custom-control-label ms-3" for="size-2">S</label> <span
								class="badge border font-weight-normal ms-auto">295</span>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" id="size-3">
							<label class="custom-control-label ms-3" for="size-3">M</label> <span
								class="badge border font-weight-normal ms-auto">246</span>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" id="size-4">
							<label class="custom-control-label ms-3" for="size-4">L</label> <span
								class="badge border font-weight-normal ms-auto">145</span>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
							<input type="checkbox" class="custom-control-input" id="size-5">
							<label class="custom-control-label  ms-3" for="size-5">XL</label> <span
								class="badge border font-weight-normal ms-auto">168</span>
						</div>
					</form>
				</div>
				<!-- Size End -->
			</div>
			<!-- Shop Sidebar End -->


			<!-- Shop Product Start -->
			<div class="col-lg-9 col-md-12">
				<div class="row pb-3">
					<div class="col-12 pb-1">
						<div
							class="d-flex align-items-center justify-content-between mb-4">

							<div class="dropdown">
								<button class="btn border dropdown-toggle" type="button"
									data-bs-toggle="dropdown" aria-expanded="false">
									sort by</button>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="#">Lastest</a></li>
									<li><a class="dropdown-item" href="#">Popularity</a></li>
									<li><a class="dropdown-item" href="#">Best Rating</a></li>
								</ul>
							</div>
						</div>
					</div>
				
					<jsp:include page="./component/product.jsp"></jsp:include>
					<jsp:include page="./component/product.jsp"></jsp:include>
					<jsp:include page="./component/product.jsp"></jsp:include>
					<jsp:include page="./component/product.jsp"></jsp:include>
					<jsp:include page="./component/product.jsp"></jsp:include>
					<jsp:include page="./component/product.jsp"></jsp:include>
					<jsp:include page="./component/product.jsp"></jsp:include>
					<jsp:include page="./component/product.jsp"></jsp:include>
					<jsp:include page="./component/product.jsp"></jsp:include>
					
					
					
					
					
					<div class="col-12 pb-1">
						<nav aria-label="Page navigation">
							<ul class="pagination justify-content-center mb-3">
								<li class="page-item disabled"><a class="page-link"
									href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										<span class="sr-only">Previous</span>
								</a></li>
								<li class="page-item active"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										<span class="sr-only">Next</span>
								</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
			<!-- Shop Product End -->
		</div>
		
		
	</div>
	<!-- Shop End -->




	<!-- Footer Start -->
	<%@ include file="./component/footer.jsp" %>
	
	<!-- Footer End -->


</body>
</html>