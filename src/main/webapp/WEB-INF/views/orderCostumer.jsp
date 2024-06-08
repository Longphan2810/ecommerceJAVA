<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib uri="jakarta.tags.core" prefix="c" %>
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

<script src="https://kit.fontawesome.com/bceea5e627.js" crossorigin="anonymous"></script>

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
  <a href="/infoCostumer" class="list-group-item list-group-item-action " aria-current="true">
 <i class="fa-solid fa-user me-3"></i>Thông tin tài khoản
  </a>
   <a href="/orderCostumer/list" class="list-group-item list-group-item-action active">
   <i class="fa-solid fa-file-invoice me-3"></i> Quản lý đơn hàng</a>
  
  <a href="/locationCostumer/list" class="list-group-item list-group-item-action">
   <i class="fa-solid fa-location-dot me-3"></i> Sổ địa chỉ</a>
  <a  class="list-group-item list-group-item-action">Coming soon . . .</a>
</div>
		
		
		</div>
		<!-- side menu  -->
		
		<!-- info  -->
		<div class="col-9 shadow-lg  row  pb-3" >
		<div>
		<div class="my-3  ">
		<span style="font-size: x-large;font-style: inherit;" >Đơn hàng của tôi</span>
		</div>
		<!-- tìm đơn hàng -->
		<div>
		<form class="d-flex" action="/orderCostumer/search" method="post" role="search">
        <input class="form-control me-2" type="search" name="idOrder" placeholder="Tìm theo mã đơn" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
		</div>
			<!-- tìm đơn hàng -->
		
		
		<c:forEach var="order" items="${pageOrders.content}">
			<form action="/orderCostumer/chi-tiet-don" method="post">
			<!-- đơn hàng -->
			<input type="hidden" name="idOrder" value="${order.idOrder}">
		<div class=" my-4 border shadow-sm " >
		<!-- trạng thái đơn  -->
		<div class="p-3 border-bottom " >Trạng thái đơn hàng : ${order.status} <span class="ms-5"> Mã đơn hàng :${order.idOrder}</span> </div>
		<!-- sơ lượt sản phẩm -->
		
			<c:forEach var="orderDetail" items="${order.listOrderDetails}">
				<div class="   py-3  border-bottom d-flex flex-nonwrap">
			<!-- hình sản phẩm -->
			<div class="col-2 me-5">
			<img alt="" src="/imageProduct/${orderDetail.productDetail.product.nameImage}" style="height: 80px ; width: 150px">
			</div>
			<!-- thong tin sản phẩm -->
			<div class=" col-8 d-flex justify-content-between " style="font-weight: bolder;">
			<span>${orderDetail.productDetail.product.name}</span>
			<fmt:formatNumber value="${orderDetail.productDetail.product.price}"  type="currency"></fmt:formatNumber>
			</div>
		</div>
			</c:forEach>
	
		
		
		<!-- Tông tien -->
		<div class="  d-flex justify-content-around " >
			<span></span>
			<span>Tổng Tiền  : <fmt:formatNumber value="${order.amount}"  type="currency"></fmt:formatNumber> </span>
			
			</div>
		
		
		
		
		<!-- btn xem dơn -->
		
		<div class=" py-3 d-flex justify-content-around " >
			<span></span>
			
			<button type="submit" class="btn btn-outline-primary" role="button">Xem chi tiết</button>
			
			</div>
		</div>
		</form>
		
		<!-- đơn hàng  end -->
		
		
		</c:forEach>
		

		
		
		
		
		</div>
		
		</div>
		<!-- info  -->
		
		
	</div>
	<!-- Page Header End -->



	<!-- Footer Start -->
	<%@ include file="./component/footer.jsp"%>

	<!-- Footer End -->


</body>
</html>