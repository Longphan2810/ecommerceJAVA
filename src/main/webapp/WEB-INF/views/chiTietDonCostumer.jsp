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
		<span style="font-weight: bold;">Nguyen van a </span>
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
		<span style="font-size: x-large;font-style: inherit;" >Chi Tiết đơn hàng : ${orderCurrent.idOrder}</span>
		</div>
	
		<!-- Dia chi giao -->
              <div class="card border-secondary w-100">
                    <div class="card-header   border">
                        <h4 class="font-weight-semi-bold m-0">Giao tới </h4>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between mb-3 pt-1">
                        <div> <h6 class="font-weight-medium">${orderCurrent.name} ${orderCurrent.phone} (  )</h6></div>
                           
                        <div class="w-50">   
                            <h6 class="font-weight-medium">${orderCurrent.address}, ${orderCurrent.city} </h6>
                        </div>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium"></h6>
                            <h6 class="font-weight-medium">
                           </h6>
                        </div>
                    </div>
                    
                </div>
	
			<!-- tìm đơn hàng -->
		
		<!-- đơn hàng -->
		
		<div class=" my-4 border shadow-sm " >
		<!-- trạng thái đơn  -->
		<div class="p-3 border-bottom h5 " > Trạng thái đơn hàng : ${orderCurrent.status}
		 <br>
		<span class="  h5">Phương thức thanh toán : ${orderCurrent.paymentMethod}  ${orderCurrent.payedVNpay==true?'(Đã thanh toán)' :'' }${orderCurrent.payedVNpay==false?'(chưa thanh toán)' :'' }   </span>
		
		</div>
	
	<!-- sơ lượt sản phẩm -->
		
			<c:forEach var="orderDetail" items="${orderCurrent.listOrderDetails}">
				<div class="   py-3  border-bottom d-flex flex-nonwrap">
			<!-- hình sản phẩm -->
			<div class="col-2 me-5">
			<img alt="" src="/imageProduct/${orderDetail.productDetail.product.nameImage}" style="height: 150px ; width: 150px">
			</div>
			<!-- thong tin sản phẩm -->
			<div class=" col-8 d-flex justify-content-between " style="font-weight: bolder;">
			<span>${orderDetail.productDetail.product.name}</span>
			<fmt:formatNumber value="${orderDetail.productDetail.product.price}"  type="currency"></fmt:formatNumber>
			</div>
		</div>
			</c:forEach>
	
		
		
		<!-- Tông tien -->
		<div class="  d-flex justify-content-around py-4" >
			<span></span>
			<span>Tổng Tiền  : <fmt:formatNumber value="${orderCurrent.amount}"  type="currency"></fmt:formatNumber> </span>
			
			</div>
		
		
		
		
		
		
		
		<!-- đơn hàng  end -->
		
		
			
		
		
		
		
		
		
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