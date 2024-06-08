<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib uri="jakarta.tags.core" prefix="c" %>
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
		<span style="font-size: x-large;font-style: inherit;" >Địa chỉ của tôi</span>
		</div>
	
		
				<!-- Địa chỉ mới-->
		
		<div class=" my-4 border shadow-sm " >
		<!-- sơ lượt sản phẩm -->
		<div class="   py-3  border-bottom d-flex flex-nonwrap">
		
			<!-- thong tin sản phẩm -->
			<div class=" col-12 d-flex justify-content-center " >
		
			<span>
			<a href="/locationCostumer/add-form">+ Thêm địa chỉ mới </a>
			</span>
			
			</div>
		</div>
		
		</div>
		
		<!-- đơn hàng  end -->
		
		<c:forEach var="element"  items="${listDeliveryAddress}">
		<!-- Địa chỉ -->
		
		<div class=" my-4 border shadow-sm " >
		<!-- sơ lượt sản phẩm -->
		<div class="   py-3  border-bottom d-flex flex-nonwrap">
			<!-- thong tin sản phẩm -->
			<div class=" col-9 d-flex justify-content-between " >
			
			<div class="ms-3">
		${element.name}	
		<c:if test="${element.status}">
		 <span class="text-success ms-2"> <i class="fa-regular fa-circle-check"></i> Địa chỉ mặc định </span> 
		 </c:if>
		 <br>
			Địa chỉ : ${element.address} , ${element.city} <br>
			Số Điện thoại : ${element.phone}
			
			</div>
			
			<span>
			<a href="/locationCostumer/update-form/${element.idDeliveryAddress}"> Chỉnh  Sửa</a>
			</span>
			
			</div>
			
		</div>
		
		</div>
		
		<!-- địa chỉ end -->
		
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