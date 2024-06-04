<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
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

	<!-- Shop Start -->
	<div class="container-fluid ">
		<div class="row px-xl-5">
			<!-- Shop Sidebar Start -->
			<div class="col-lg-3 col-md-12">
				<!-- Price Start -->
				<div class="border-bottom mb-4 pb-4">

					<h5 class="font-weight-semi-bold mb-4">Filter by price</h5>
					<c:if test="${categoryCurrent!=null}">
						<c:set var="subUri" value="${categoryCurrent.name}/"></c:set>
					</c:if>
					<form action="/shop/${subUri}filter?p=0" method="get">
						
						
						<input type="hidden" name="sortBy" value="${sortCurrent}" >
						<input type="hidden" name="keywords" value="${keywords}" >
						
					
						
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="radio" class="custom-control-input "
								${filterByPrice=='all'?'checked':''} name="filterByPrice"
								value="all" id="price-all"> <label
								class="custom-control-label ms-3" for="price-all">All
								Price</label> <span class="rounded-pill border px-2 ms-auto"></span>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="radio" class="custom-control-input"
								${filterByPrice=='50'?'checked':''} name="filterByPrice"
								value="50" id="price-1"> <label
								class="custom-control-label ms-3" for="price-1">0 -
								50000 VND</label> <span class="rounded-pill border px-2 ms-auto"></span>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="radio" class="custom-control-input"
								${filterByPrice=='100'?'checked':''} name="filterByPrice"
								value="100" id="price-2"> <label
								class="custom-control-label ms-3" for="price-2">50000 -
								100000</label> <span class="rounded-pill border px-2 ms-auto"></span>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="radio" class="custom-control-input"
								${filterByPrice=='200'?'checked':''} name="filterByPrice"
								value="200" id="price-3"> <label
								class="custom-control-label ms-3" for="price-3">100000 -
								200000</label> <span class="rounded-pill border px-2 ms-auto"></span>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="radio" class="custom-control-input"
								${filterByPrice=='200+'?'checked':''} name="filterByPrice"
								value="200+" id="price-4"> <label
								class="custom-control-label ms-3" for="price-4">200000+
								vnd</label> <span class="rounded-pill border px-2 ms-auto"></span>
						</div>


						<div class="my-2">
							<button type="submit" class="btn btn-outline-primary">Lọc</button>

						</div>
					</form>
				</div>
				<!-- Price End -->



			</div>
			<!-- Shop Sidebar End -->


			<!-- Shop Product Start -->
			<div class="col-lg-9 col-md-12">
				<div class="row pb-3">
					<div class="col-12 pb-1">
						<c:if test="${keywords!=''}">
						<h2>Các sản phẩm : ${keywords}</h2>
						</c:if>
						<div
							 class="d-flex align-items-center justify-content-between mb-4">
							
							<div class="dropdown">
								<button class="btn border dropdown-toggle" type="button"
									data-bs-toggle="dropdown" aria-expanded="false">${sortCurrent!=null?sortCurrent:'Sort By'}</button>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item"
										href="/shop/${subUri}filter?p=0&&sortBy=price low to high&&filterByPrice=${filterByPrice}&&keywords=${keywords}">price
											low to high</a></li>
									<li><a class="dropdown-item"
										href="/shop/${subUri}filter?p=0&&sortBy=price high to low&&filterByPrice=${filterByPrice}&&keywords=${keywords}">price
											high to low</a></li>

								</ul>
							</div>
						</div>
					</div>

					<c:forEach var="product" items="${listProduct.content}">
						<jsp:include page="./component/product.jsp">
							<jsp:param value="${product.idProduct}" name="id" />
							<jsp:param value="${product.nameImage}" name="image" />
							<jsp:param value="${product.name}" name="name" />
							<jsp:param value="${product.price}" name="price" />
						</jsp:include>

					</c:forEach>





					<div class="col-12 pb-1">
						<nav aria-label="Page navigation">


							<ul class="pagination justify-content-center mb-3">

								<li class="page-item"><a class="page-link"
									${listProduct.number-1>=0?'':'onclick="return false;"'}
									href="/shop/${subUri}filter?p=${listProduct.number-1}&&sortBy=${sortCurrent}&&filterByPrice=${filterByPrice}&&keywords=${keywords}">Previous</a>
								</li>

								<c:forEach begin="1" var="i" step="1"
									end="${listProduct.totalPages}">
									<li class="page-item"><a class="page-link"
										href="/shop/${subUri}filter?p=${i-1}&&sortBy=${sortCurrent}&&filterByPrice=${filterByPrice}&&keywords=${keywords}">${i}</a></li>
								</c:forEach>

								<li class="page-item"><a class="page-link"
									${listProduct.number<listProduct.totalPages-1?'':'onclick="return false;"'}
									href="/shop/${subUri}filter?p=${listProduct.number+1}&&sortBy=${sortCurrent}&&filterByPrice=${filterByPrice}&&keywords=${keywords}">Next</a>
								</li>

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
	<%@ include file="./component/footer.jsp"%>

	<!-- Footer End -->


</body>
</html>