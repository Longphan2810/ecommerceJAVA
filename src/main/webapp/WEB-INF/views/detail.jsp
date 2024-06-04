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

	<hr>
	<!-- Shop Detail Start -->
	<div class="container-fluid py-5">
		<div class="row px-xl-5">
			<div class="col-lg-5 pb-5">
				<div id="product-carousel" class="carousel slide"
					data-ride="carousel">
					<div class="carousel-inner border">
						<div class="carousel-item active">
							<img class="w-100 h-100"
								src="/imageProduct/${productDB.nameImage}" alt="Image">
						</div>

					</div>

				</div>
			</div>

			<div class="col-lg-7 pb-5">
				<h3 class="font-weight-semi-bold">${productDB.name}</h3>

				<h4 class="font-weight-semi-bold mb-4">Price :
					${productDB.price} VND</h4>
				<p class="mb-4">${productDB.description} Volup erat ipsum diam
					elitr rebum et dolor. Est nonumy elitr erat diam stet sit clita ea.
					Sanc invidunt ipsum et, labore clita lorem magna lorem ut. Erat
					lorem duo dolor no sea nonumy. Accus labore stet, est lorem sit
					diam sea et justo, amet at lorem et eirmod ipsum diam et rebum kasd
					rebum.</p>
				<div class="d-flex mb-3 flex-nowrap">
					<p class="text-dark font-weight-medium mb-0 mr-3">Sizes:</p>
					<form>


						<span class="ms-3"> <input type="radio"
							class="custom-control-input" id="size-2" name="size"> <label
							class="custom-control-label" for="size-2">S</label>
						</span> <span class="ms-3"> <input type="radio"
							class="custom-control-input" id="size-1" name="size"> <label
							class="custom-control-label" for="size-1">M</label>
						</span> <span class="ms-3"> <input type="radio"
							class="custom-control-input" id="size-2" name="size"> <label
							class="custom-control-label" for="size-2">L</label>
						</span> <span class="ms-3"> <input type="radio"
							class="custom-control-input" id="size-2" name="size"> <label
							class="custom-control-label" for="size-2">XL</label>
						</span>
					</form>
				</div>

				<div class="d-flex align-items-center mb-4 pt-2">
					<div class="input-group quantity mr-3 border me-3"
						style="width: 130px;">
						<div class="input-group-btn">
							<button class="btn  btn-minus">
								<i class="fa fa-minus"></i>
							</button>
						</div>
						<input type="text" class="form-control  text-center" value="1">
						<div class="input-group-btn">
							<button class="btn  btn-plus">
								<i class="fa fa-plus"></i>
							</button>
						</div>
					</div>
					<button class="btn btn-primary px-3">
						<i class="fa fa-shopping-cart mr-1"></i> Add To Cart
					</button>
				</div>

			</div>
		</div>


	</div>
	<!-- Shop Detail End -->
	<hr>
	<!-- Shop Product Start -->
	<div class="w-100 text-center">
		<h2>-You May Also Like-</h2>

	</div>

	<div class="w-100 container-fluid  row">

		
		<c:forEach var="product" items="${listMayLike}">
			<jsp:include page="./component/product.jsp">
				<jsp:param value="${product.idProduct}" name="id" />
				<jsp:param value="${product.nameImage}" name="image" />
				<jsp:param value="${product.name}" name="name" />
				<jsp:param value="${product.price}" name="price" />
			</jsp:include>

		</c:forEach>
	</div>








	<!-- Shop Product End -->




	<!-- Footer Start -->
	<%@ include file="./component/footer.jsp"%>

	<!-- Footer End -->


</body>
</html>