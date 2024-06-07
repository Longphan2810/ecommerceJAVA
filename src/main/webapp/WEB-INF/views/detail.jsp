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
	
	<form action="/addToCard" method="post" >
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
					<p class="text-dark font-weight-medium mb-0 mr-3 p-2">Size</p>

						<span class="ms-1 border p-2 d-flex  flex-nowrap"> <input type="radio"
							class="custom-control-input" id="size-1"  required="required" name="size" value="S"> <label
							class="custom-control-label fs-6" for="size-1"> Size S <br> (Còn:999SP)</label>
						</span> 
						<span class="ms-3 border p-2" > <input type="radio"
							class="custom-control-input" id="size-2" required="required" name="size" value="M"> <label
							class="custom-control-label" for="size-2">Size M <br> (Còn:999SP)</label>
						</span> <span class="ms-3 border p-2"> <input type="radio"
							class="custom-control-input" id="size-3" required="required" name="size" value="L"> <label
							class="custom-control-label" for="size-3">Size L<br> (Còn:999SP)</label>
						</span> <span class="ms-3 border p-2"> <input type="radio"
							class="custom-control-input" id="size-4"  required="required"name="size" value="XL"> <label
							class="custom-control-label" for="size-4">Size XL <br> (Còn:999SP)</label>
						</span>
					
				</div>

				<div class="d-flex align-items-center mb-4 pt-2">
					<label class="me-4">Số lượng mua</label>
					<div class="input-group quantity mr-3 border me-3"
						style="width: 130px;">
					  	
						<input type="number" min=0  required="required" class="form-control  text-center" name="quality">
						
					</div>
					<input type="hidden" name="idProduct" value="${productDB.idProduct}">
					<button class="btn btn-primary px-3" type="submit">
						<i class="fa fa-shopping-cart mr-1"></i> Add To Cart
					</button>
				</div>

			</div>
		</div>


	</div>
	<!-- Shop Detail End -->
	</form>
	
	<hr>
	<!-- Shop Product Start -->
	<div class="w-100 text-center">
		<h2>-You May Also Like-</h2>

	</div>
	
 <div class="container">
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
</div>







	<!-- Shop Product End -->

<!--  thong bao -->

	<div class="toast-container  position-fixed bottom-0 end-0 p-3">
		<div id="liveToast" class="toast ${param.message!=null?'show':''}"
			role="alert" aria-live="assertive" aria-atomic="true">
			<div class="toast-header">
				<strong class="me-auto">Thông báo</strong>

				<button type="button" class="btn-close" data-bs-dismiss="toast"
					aria-label="Close"></button>
			</div>
			<div class="toast-body">${param.message}</div>
		</div>
	</div>


	<!-- Footer Start -->
	<%@ include file="./component/footer.jsp"%>

	<!-- Footer End -->


</body>
</html>